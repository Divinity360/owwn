class Users {
  String? id;
  String? name;
  String? email;
  String? gender;
  String? status;
  String? partnerId;
  String? createdAt;
  List<int>? statistics;

  Users(
      {this.id,
      this.name,
      this.email,
      this.gender,
      this.status,
      this.partnerId,
      this.createdAt,
      this.statistics});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    name = json['name'] as String;
    if (json['email'] != null) {
      email = json['email'] as String;
    }
    gender = json['gender'] as String;
    status = json['status'] as String;
    partnerId = json['partner_id'] as String;
    createdAt = json['created_at'] as String;
    if (json['statistics'] != null) {
      statistics = (json['statistics'] as List).cast<int>();
    }
  }
}
