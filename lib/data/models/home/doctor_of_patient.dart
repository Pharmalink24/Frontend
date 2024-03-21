class DoctorOfPatient {
  int? id;
  String? image;

  DoctorOfPatient({this.id, this.image});

  DoctorOfPatient.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}