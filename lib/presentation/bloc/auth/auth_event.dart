part of 'auth_bloc.dart';

class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class SwitchSignType extends AuthEvent {
  final bool isSignUp;

  SwitchSignType({required this.isSignUp});
  @override
  List<Object?> get props => [isSignUp];
}

class OnChangee extends AuthEvent {
  final List<bool> formComplete;
  final TextEditingController emailCon;
  final TextEditingController passwordCon;

  OnChangee({
    required this.formComplete,
    required this.emailCon,
    required this.passwordCon,
  });
  @override
  List<Object?> get props => [formComplete, emailCon, passwordCon];
}

class SignInEv extends AuthEvent {
  final bool obscureText;
  final ButtonState textWithIconState;

  final String email;
  final String password;

  SignInEv({
    this.obscureText = true,
    this.textWithIconState = ButtonState.idle,
    required this.email,
    required this.password,
  });
  @override
  List<Object?> get props => [obscureText, textWithIconState, email, password];
}

class SignUp extends AuthEvent {}

class ForgetPassword extends AuthEvent {}
