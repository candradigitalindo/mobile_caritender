class UserModel {
  final int? id;
  final String? name;
  final String? phone;
  final String? expired;
  final String? token;
  final String? password;

  UserModel({
    this.id,
    this.phone,
    this.expired,
    this.name,
    this.token,
    this.password,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['data']['id'],
        name: json['data']['name'],
        phone: json['data']['phone'],
        expired: json['data']['expired'],
        token: json['access_token'],
      );

  UserModel copyWith({
    String? name,
    String? phone,
    String? expired,
    String? password,
  }) =>
      UserModel(
        id: id,
        name: name ?? this.name,
        phone: phone ?? this.phone,
        expired: expired ?? this.expired,
        password: password ?? this.password,
        token: token,
      );
}
