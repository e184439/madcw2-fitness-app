import 'package:hive_flutter/hive_flutter.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  int? id;
  @HiveField(1)
  String? userName;
  @HiveField(2)
  String? firstName;
  @HiveField(3)
  String? lastName;
  @HiveField(4)
  String? address;
  @HiveField(5)
  String? contactNo;
  @HiveField(6)
  String? email;
  @HiveField(7)
  String? nic;
  @HiveField(8)
  int? rollId;
  @HiveField(9)
  String? instituteId;
  @HiveField(10)
  String? activeStatus;

  User({
    this.id,
    this.userName,
    this.firstName,
    this.lastName,
    this.address,
    this.contactNo,
    this.email,
    this.nic,
    this.rollId,
    this.instituteId,
    this.activeStatus,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['user_name'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    address = json['address'];
    contactNo = json['contact_no'];
    email = json['email'];
    nic = json['nic'];
    rollId = json['roll_id'];
    instituteId = json['institute_Id'];
    activeStatus = json['activeStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_name'] = userName;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['address'] = address;
    data['contact_no'] = contactNo;
    data['email'] = email;
    data['nic'] = nic;
    data['roll_id'] = rollId;
    data['institute_Id'] = instituteId;
    data['activeStatus'] = activeStatus;
    return data;
  }
}
