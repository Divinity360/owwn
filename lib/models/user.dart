class Users {
  String? id;
  String? name;
  String? gender;
  String? status;
  String? partnerId;
  String? createdAt;
  List<int>? statistics;

  Users(
      {this.id,
        this.name,
        this.gender,
        this.status,
        this.partnerId,
        this.createdAt,
        this.statistics});

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    name = json['name'] as String;
    gender = json['gender'] as String;
    status = json['status'] as String;
    partnerId = json['partner_id'] as String;
    createdAt = json['created_at'] as String;
    statistics = (json['statistics'] as List).cast<int>();
  }
}