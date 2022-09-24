import 'package:owwn_coding_challenge/models/user.dart';

class UserListResponse {
  List<Users>? users;
  int? total;

  UserListResponse({this.users, this.total});

  UserListResponse.fromJson(Map<String, dynamic> json) {
    if (json['users'] != null) {
      users = <Users>[];
      for (final v in json['users'] as List) {
        users!.add(Users.fromJson(v as Map<String, dynamic>));
      }
    }
    total = json['total'] as int;
  }
}


