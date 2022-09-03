class SignUpFormModel {
  final String? name;
  final String? phone;
  final String? password;

  SignUpFormModel({
    this.name,
    this.phone,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'phone': phone,
      'password': password,
    };
  }
}
