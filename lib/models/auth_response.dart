class AuthResponse {
  String? accessToken;
  String? refreshToken;

  AuthResponse({this.accessToken, this.refreshToken});

  AuthResponse.fromJson(Map json) {
    accessToken = json['access_token'] as String;
    refreshToken = json['refresh_token'] as String;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    return data;
  }
}
