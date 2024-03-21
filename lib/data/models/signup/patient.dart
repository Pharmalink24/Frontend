class Patient {
  late int id;
  late String fname;
  late String lname;
  late String username;
  late String birthdate;
  late String email;
  late String phone;
  late String gender;
  late List<String> chronicDisease;
  late String image;

  Patient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fname = json['fname'];
    lname = json['lname'];
    username = json['username'];
    birthdate = json['birthdate'];
    email = json['email'];
    phone = json['phone'];
    gender = json['gender'];
    chronicDisease = json['chronic_disease'].cast<String>();
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['fname'] = fname;
    data['lname'] = lname;
    data['username'] = username;
    data['birthdate'] = birthdate;
    data['email'] = email;
    data['phone'] = phone;
    data['gender'] = gender;
    data['chronic_disease'] = chronicDisease;
    data['image'] = image;
    return data;
  }
}
