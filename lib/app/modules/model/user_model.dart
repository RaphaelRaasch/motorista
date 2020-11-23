import 'package:hive/hive.dart';


@HiveType(typeId: 1)
class UserModel extends HiveObject{
  @HiveField(0)
  String token;
  @HiveField(1)
  int userId;
  @HiveField(2)
  String firstName;
  @HiveField(3)
  String lastName;
  @HiveField(4)
  String email;
  @HiveField(5)
  String fone;
  @HiveField(6)
  String type;

  UserModel(
      {this.token,
      this.userId,
      this.firstName,
      this.lastName,
      this.email,
      this.fone,
      this.type});

  UserModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    fone = json['fone'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    data['user_id'] = this.userId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['fone'] = this.fone;
    data['type'] = this.type;
    return data;
  }
}
