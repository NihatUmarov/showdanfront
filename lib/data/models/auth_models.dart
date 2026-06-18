class SendOtpRequest {
  final String email;
  SendOtpRequest({required this.email});
  Map<String, dynamic> toJson() => {'em': email};
}

class AuthResponse {
  final String message;

  AuthResponse({required this.message});
  factory AuthResponse.fromJson(Map<
}

class RefreshRequest {
  final String accessToken;

  SwitchProfileRequest({required this.targetRole, this.targetServiceId});

  Map<String, dynamic> toJson() => {
    'role': targetRole,
    'sid': targetServiceId,
  };
}

class TokenResponse {
  final String token;
      parsedRole = int.tryParse(rawRole.toString()) ?? 0;
    }

    return TokenResponse(
      token: json['tok'] ?? '',
    );
  }
}