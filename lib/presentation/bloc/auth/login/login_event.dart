part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent({this.email = '', this.show = false, this.password = ''});
  final String email;
  final String password;
  final bool show;

  @override
  List<Object> get props => [email, password];
}

class EmailEvent extends LoginEvent {
  const EmailEvent({required super.email});
}

class PasswordEvent extends LoginEvent {
  const PasswordEvent({required super.password});
}

class ShowPasswordEvent extends LoginEvent {
  const ShowPasswordEvent({required super.show});
}

class OnLoginTapedEvent extends LoginEvent {
  const OnLoginTapedEvent();
}
