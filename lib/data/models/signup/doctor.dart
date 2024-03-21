class Doctor {
  int? id;
  String? fname;
  String? lname;
  String? username;
  String? birthdate;
  String? email;
  String? phone;
  String? gender;
  String? licenseNumber;
  String? specialization;
  String? degree;
  String? graduationDate;
  String? university;
  String? image;

  Doctor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fname = json['fname'];
    lname = json['lname'];
    username = json['username'];
    birthdate = json['birthdate'];
    email = json['email'];
    phone = json['phone'];
    gender = json['gender'];
    licenseNumber = json['license_number'];
    specialization = json['specialization'];
    degree = json['degree'];
    graduationDate = json['graduation_date'];
    university = json['university'];
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
    data['license_number'] = licenseNumber;
    data['specialization'] = specialization;
    data['degree'] = degree;
    data['graduation_date'] = graduationDate;
    data['university'] = university;
    data['image'] = image;
    return data;
  }
}
