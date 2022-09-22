class AuthResponse {
  String? accessToken;
  String? refreshToken;

  AuthResponse({this.accessToken, this.refreshToken});

  AuthResponse.fromJson(Map<String, String> json) {
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['access_token'] = accessToken;
    data['refresh_token'] = refreshToken;
    return data;
  }
}
