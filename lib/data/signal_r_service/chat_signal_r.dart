import 'dart:async';
import 'package:signalr_netcore/signalr_client.dart';
import '../../core/provider/session_provider.dart'; // Импортируем провайдер вместо стораджа
import '../models/chats_models.dart';
class SignalRService {

    await _ensureConnection();
  }

  Future<void> _ensureConnection() async {
    if (_hubConnection == null) {
      await initHub();
  }

  Future<bool> sendMessage(int toUserId, String text, {int? orderId}) asy
    }
    return false;
  }в
}