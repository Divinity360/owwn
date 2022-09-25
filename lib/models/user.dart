enum Gender { male, female, other }

enum Status { active, inactive }

class Users {
  String? id;
  int? parentIndex;
  String? name;
  String? email;
  Gender? gender;
  Status? status;
  String? partnerId;
  String? createdAt;
  List<int>? statistics;

  Users({
    this.id,
    this.parentIndex,
    this.name,
    this.email,
    this.gender,
    this.status,
    this.partnerId,
    this.createdAt,
    this.statistics,
  });

  Users copyWith({
    String? id,
    int? parentIndex,
    String? name,
    String? email,
    Gender? gender,
    Status? status,
    String? partnerId,
    String? createdAt,
    List<int>? statistics,
  }) {
    return Users(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      parentIndex: parentIndex ?? this.parentIndex,
      gender: gender ?? this.gender,
      status: status ?? this.status,
      partnerId: partnerId ?? this.partnerId,
      createdAt: createdAt ?? this.createdAt,
      statistics: statistics ?? this.statistics,
    );
  }

  Users.fromJson(Map<String, dynamic> json) {
    id = json['id'] as String;
    name = json['name'] as String;
    if (json['parentIndex'] != null) {
      parentIndex = json['parentIndex'] as int;
    }
    if (json['email'] != null) {
      email = json['email'] as String;
    }
    gender = json['gender'] == "male"
        ? Gender.male
        : json['gender'] == "female"
            ? Gender.female
            : Gender.other;
    status = json['status'] == "active" ? Status.active : Status.inactive;
    partnerId = json['partner_id'] as String;
    createdAt = json['created_at'] as String;
    if (json['statistics'] != null) {
      statistics = (json['statistics'] as List).cast<int>();
    }
  }

}
