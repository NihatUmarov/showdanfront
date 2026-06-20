import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../The
      isAnimated: true,
    ));
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppBackground(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(
              left: 12.w,
              right: 12.w,
              top: 12.w,
              bottom: 12.h,
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () => Navigator.of(con
                  color: msg.isUser ? null : Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14.r),
          itemBuilder: (context, index) {
            final artist = performers[index];
            return Container(
              margin: EdgeInsets.only(right: cardSpacing),
              child: ArtistCard(
                imageUrl: artist.photoUrl ?? '',
                name: artist.nickname,

class _TypewriterTextState extends State<_TypewriterText> {
  String _displayedText = "";
  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    _timer = Timer.periodic(const Duration(milliseconds: 15), (timer) {
      if (_currentIndex < widget.text.length)cator> with TickerProviderStateMixin {
  late List<AnimationController> _controllers;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();
    _controllers = List.generate(3, (index) {
      return AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 600),
    for (var controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
      ),
    );
  }
}в