import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:record/record.dart';
import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:audioplayers/audioplayers.dart';
import '../../../ThemeData/app_widgets.dart';
import '../../../ThemeData/ui_kit.dart';
import '../../../ThemeData/ui_overlays.dart';
import '../../../l10n/s.dart';
import 'VoicePlayer.dart';

class AudioGridEditor extends StatefulWidget {
  final List<Map<String, String>> initialItems;
  final ValueChanged<List<Map<String, String>>> onChanged;
  final int maxFiles;
  final bool isHorizontal;

  const AudioGridEditor({
    super.key, required this.initialItems, required this.onChanged, this.maxFiles = 6, this.isHorizontal = false,
  });

  @override
  State<AudioGridEditor> createState() => _AudioGridEditorState();
}

class _AudioGridEditorState extends State<AudioGridEditor> {
  final AudioRecorder _recorder = AudioRecorder();
  final VoicePlayerController _audioController = VoicePlayerController();
  final List<Map<String, String>> _items = [];
  final ValueNotifier<bool> _isRecording = ValueNotifier(false);
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _items.addAll(widget.initialItems);
  }

  @override
  void dispose() {
    _recorder.dispose(); _audioController.dispose(); _timer?.cancel(); _isRecording.dispose();
    super.dispose();
  }

  void _sync() => widget.onChanged(List.from(_items));

  Future<void> _record() async {
    if (!await _recorder.hasPermission()) {
      return UIOverlays.showSnack(context, S.errNoMic, color: AppColors.danger, icon: Icons.error_outline_rounded);
    }
    if (_isRecording.value) return _stopRecording();

    final dir = await getTemporaryDirectory();
    await _recorder.start(const RecordConfig(), path: '${dir.path}/record_${DateTime.now().millisecondsSinceEpoch}.m4a');
    _isRecording.value = true;

    _timer?.cancel();
    _timer = Timer(const Duration(seconds: 10), () => _isRecording.value ? _stopRecording() : null);
  }

  Future<void> _stopRecording() async {
    final path = await _recorder.stop();
    _timer?.cancel();
    _isRecording.value = false;
    if (path != null) _add(path, S.defaultRecordName);
  }

  Future<void> _pick() async {
    final path = (await FilePicker.pickFiles(type: FileType.audio))?.files.single.path;
    if (path == null) return;

    final p = AudioPlayer(); await p.setSource(DeviceFileSource(path));
    final dur = await p.getDuration(); await p.dispose();

    if (dur != null && dur.inSeconds > 10) {
      if (mounted) UIOverlays.showSnack(context, S.errTooLong, color: AppColors.accentPink, icon: Icons.warning_amber_rounded);
      return;
    }
    _add(path, S.defaultRecordName);
  }

  void _onAdd() {
    if (_items.length >= widget.maxFiles) {
      return UIOverlays.showSnack(context, S.errMaxFiles, color: AppColors.accentPink, icon: Icons.warning_amber_rounded);
    }
    showModalBottomSheet(
      context: context, useSafeArea: true, backgroundColor: const Color(0xFF1E1E1E),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20.r))),
      builder: (_) => SafeArea(child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(leading: const Icon(Icons.mic, color: Colors.redAccent), title: Text(S.sheetMicStart, style: const TextStyle(color: Colors.white)), onTap: () { Navigator.pop(context); _record(); }),
          ListTile(leading: const Icon(Icons.file_upload, color: Colors.white), title: Text(S.sheetPickFile, style: const TextStyle(color: Colors.white)), onTap: () { Navigator.pop(context); _pick(); }),
        ],
      )),
    );
  }

  void _add(String path, String name) {
    setState(() => _items.add({'title': name, 'path': path}));
    _sync();
  }

  void _remove(int index) async {
    if (_audioController.playingIndex == index) await _audioController.togglePlay(index, '', isRemote: false);
    setState(() => _items.removeAt(index));
    _sync();
  }

  void _renameItem(int index) {
    final ctrl = TextEditingController(text: _items[index]['title']);
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        backgroundColor: const Color(0xFF1E1E1E), title: S.renameAudioTitle.h2(),
        content: Column(
          mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            AppInput(controller: ctrl, autofocus: true, maxLength: 15, filledStyle: true, hint: S.renameAudioHint),
            SizedBox(height: 4.h),
            ValueListenableBuilder(valueListenable: ctrl, builder: (_, val, __) => '${val.text.length}/15'.caption(color: Colors.white38)),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: Text(S.cancel)),
          TextButton(onPressed: () { if (ctrl.text.trim().isNotEmpty) setState(() => _items[index]['title'] = ctrl.text.trim()); _sync(); Navigator.pop(context); }, child: const Text("OK", style: TextStyle(color: Colors.redAccent))),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final itemCount = _items.length < widget.maxFiles ? _items.length + 1 : widget.maxFiles;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        S.audioMainTitle.body(weight: FontWeight.w700),
        ValueListenableBuilder<bool>(
          valueListenable: _isRecording,
          builder: (_, rec, __) => rec ? Padding(padding: EdgeInsets.only(top: 10.h), child: Text(S.recordingStatus, style: const TextStyle(color: Colors.redAccent, fontWeight: FontWeight.bold))) : const SizedBox.shrink(),
        ),
        SizedBox(height: 12.h),
        widget.isHorizontal
            ? SizedBox(
          height: 80.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal, itemCount: itemCount,
            separatorBuilder: (_, __) => SizedBox(width: 12.w),
            itemBuilder: (_, i) => SizedBox(width: 165.w, child: (i == _items.length) ? _buildAddBtn() : _buildCard(i)),
          ),
        )
            : GridView.builder(
          shrinkWrap: true, physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, mainAxisSpacing: 12.h, crossAxisSpacing: 12.w, childAspectRatio: 165 / 80),
          itemCount: itemCount, itemBuilder: (_, i) => (i == _items.length) ? _buildAddBtn() : _buildCard(i),
        ),
      ],
    );
  }

  Widget _buildAddBtn() {
    return ValueListenableBuilder<bool>(
      valueListenable: _isRecording,
      builder: (_, rec, __) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(padding: EdgeInsets.only(bottom: 4.h, left: 4.w, right: 4.w), child: Text(" ", style: TextStyle(fontSize: 12.sp))),
          Expanded(
            child: AppCard(
              radius: 12, padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h), color: Colors.transparent,
              border: Border.all(color: rec ? Colors.redAccent.withOpacity(0.5) : Colors.white.withOpacity(0.08)),
              onTap: () => rec ? _stopRecording() : _onAdd(),
              child: Row(
                children: [
                  Container(
                    width: 36.w, height: 36.w,
                    decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: rec ? Colors.redAccent : Colors.white30, width: 1.5)),
                    child: Icon(rec ? Icons.stop_rounded : Icons.add_rounded, color: rec ? Colors.redAccent : Colors.white, size: 20.w),
                  ),
                  SizedBox(width: 8.w),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(child: StaticWaveform(isRec: rec)), // Оптимизировано: передаем флаг напрямую
                        SizedBox(height: 4.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(rec ? "REC..." : "00:00", style: TextStyle(color: rec ? Colors.redAccent : Colors.white38, fontSize: 10.sp, fontWeight: FontWeight.w500)),
                            const Text(""),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCard(int i) {
    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 4.h, left: 4.w, right: 4.w),
              child: Row(
                children: [
                  Expanded(child: (_items[i]['title'] ?? '').body(size: 12.sp, maxLines: 1, overflow: TextOverflow.ellipsis)),
                  SizedBox(width: 4.w),
                  GestureDetector(onTap: () => _renameItem(i), child: Icon(Icons.edit, size: 14.w, color: Colors.white54)),
                  SizedBox(width: 24.w),
                ],
              ),
            ),
            Expanded(child: VoicePlayerWidget(controller: _audioController, index: i, audioUrl: _items[i]['path'] ?? '', title: '')),
          ],
        ),
        Positioned(
          top: 0, right: 0,
          child: GestureDetector(
            onTap: () => _remove(i),
            child: Container(
              padding: EdgeInsets.all(4.w), decoration: const BoxDecoration(color: Colors.black45, shape: BoxShape.circle),
              child: Icon(Icons.close, size: 14.w, color: Colors.white70),
            ),
          ),
        ),
      ],
    );
  }
}

class StaticWaveform extends StatelessWidget {
  final bool isRec;
  const StaticWaveform({super.key, required this.isRec}); // ИСПРАВЛЕНО: Никаких тяжелых контекстных поисков

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: List.generate(AudioWaveConfig.list.length, (i) => Expanded(
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 0.5.w),
          child: FractionallySizedBox(
            heightFactor: AudioWaveConfig.list[i], alignment: Alignment.bottomCenter,
            child: DecoratedBox(decoration: BoxDecoration(color: isRec ? Colors.redAccent.withOpacity(0.4) : Colors.white.withOpacity(0.15), borderRadius: BorderRadius.circular(2.r))),
          ),
        ),
      )),
    );
  }
}