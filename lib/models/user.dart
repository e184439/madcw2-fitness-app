class User {
  int? id;
  String? firstName;
  String? lastName;
  String? memberNo;
  String? contactNo;
  String? nic;
  String? gender;
  String? email;
  String? dob;
  String? registerDate;
  int? weight;
  int? height;
  double? bmi;
  bool? isStaff;
  bool? isInstructor;
  String? token;

  User(
      {this.token,
      this.id,
      this.firstName,
      this.lastName,
      this.memberNo,
      this.contactNo,
      this.nic,
      this.gender,
      this.email,
      this.dob,
      this.registerDate,
      this.weight,
      this.height,
      this.bmi,
      this.isStaff,
      this.isInstructor});

  User.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    id = json['id'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    memberNo = json['memberNo'];
    contactNo = json['contactNo'];
    nic = json['nic'];
    gender = json['gender'];
    email = json['email'];
    dob = json['dob'];
    registerDate = json['registerDate'];
    weight = json['weight'];
    height = json['height'];
    bmi = json['bmi'];
    isStaff = json['isStaff'];
    isInstructor = json['isInstructor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['token'] = token;
    data['id'] = id;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['memberNo'] = memberNo;
    data['contactNo'] = contactNo;
    data['nic'] = nic;
    data['gender'] = gender;
    data['email'] = email;
    data['dob'] = dob;
    data['registerDate'] = registerDate;
    data['weight'] = weight;
    data['height'] = height;
    data['bmi'] = bmi;
    data['isStaff'] = isStaff;
    data['isInstructor'] = isInstructor;
    return data;
  }
}
