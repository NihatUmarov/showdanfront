import 'package:flutter/material.dart';
import '../storage/secure_storage.dart';

class SessionManager extends ChangeNotifier {
  final SecureStorage _storage;

  String _currentRole = 'c';

  SessionManager(this._storage);

  String get currentRole => _currentRole;
  bool get isClient => _currentRole == 'c';
  bool get isPerformer => _currentRole != 'c';

  Future<void> init() async {
    _currentRole = await _storage.getUserRole();
    notifyListeners();
  }

  void updateRole(String newRole) {
    _currentRole = newRole;
    notifyListeners();
  }
}