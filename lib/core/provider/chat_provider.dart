import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import '../storage/secure_storage.dart';
import '../../data/models/chats_models.dart';
import '../../data/services/chat_service.dart';
import '../../data/signal_r_service/chat_signal_r.dart';

class ChatProvider extends ChangeNotifier {
  final ChatService _chatService;
  final SignalRService _signalRService;
  final SecureStorage _storage; // Передаем хранилище для дискового кэша
  StreamSubscription? _messageSubscription;

  List<ChatPreviewModel> _chats = [];
  bool _isSilentLoading = false;
  bool _hasFetchedOnce = false;

  ChatProvider(this._chatService, this._signalRService, this._storage) {
    _loadFromDisk();
    _initSignalR();
  }
_chats.isEmpty && _isSilentLoading;

  int get totalUnreadCount => _chats.fold<int>(0, (sum, chat) => sum + chat.unreadCount);

        notifyListeners();
      } catch (_) {}
  }

  Future<void> fetchChats() async {
    if (_chats.isEmpty) {
      _isSilentLoading = true;
      notifyListeners();
    }

      debugPrint("Ошибка загрузки чатов: $e");
    } finally {
      _isSilentLoading = false;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    _messageSubscription?.cancel();
    super.dispose();
  }
}