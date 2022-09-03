class SignInFormModel {
  final String? phone;
  final String? password;

  SignInFormModel({
    this.phone,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'phone': phone,
      'password': password,
    };
  }
}
