class User {
  String? id;
  String? email;
  String? username;
  String? phoneNumber;
  String? nidaNumber;
  String? registrationNumber;
  String? password;

  User({
    this.id,
    this.email,
    this.username,
    this.phoneNumber,
    this.nidaNumber,
    this.registrationNumber,
    this.password,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    username = json['username'];
    phoneNumber = json['phone_number'];
    nidaNumber = json['nida_number'];
    registrationNumber = json['registration_number'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['username'] = this.username;
    data['phone_number'] = this.phoneNumber;
    data['nida_number'] = this.nidaNumber;
    data['registration_number'] = this.registrationNumber;
    data['password'] = this.password;
    return data;
  }
}
