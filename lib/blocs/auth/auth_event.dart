part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AuthCheckPhone extends AuthEvent {
  final String phone;
  const AuthCheckPhone(this.phone);

  @override
  List<Object> get props => [phone];
}

class AuthRegister extends AuthEvent {
  final SignUpFormModel data;
  const AuthRegister(this.data);
  @override
  List<Object> get props => [data];
}

class AuthLogin extends AuthEvent {
  final SignInFormModel data;
  const AuthLogin(this.data);
  @override
  List<Object> get props => [data];
}

class AuthCurrentUser extends AuthEvent {}

class AuthLogout extends AuthEvent {}
