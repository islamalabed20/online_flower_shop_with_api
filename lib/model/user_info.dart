// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserInfo {
  String token;

  bool isLoggedIn;
  UserInfo({
    required this.token,
    required this.isLoggedIn,
  });

  factory UserInfo.fromMap(Map<String, dynamic> data) {
    return UserInfo(
      token: data['access_token'] ?? "",
      isLoggedIn: data['is_logged_in'] ?? false,
    );
  }
  Map<String, dynamic> toMap() {
    return Map<String, dynamic>.from(
      {
        'token': token,
        'is_logged_in': isLoggedIn,
      },
    );
  }

  void clearData() {
    isLoggedIn = false;
    token = "";
  }

  @override
  String toString() {
    return "{token: $token, logged_in: $isLoggedIn}";
  }
}
