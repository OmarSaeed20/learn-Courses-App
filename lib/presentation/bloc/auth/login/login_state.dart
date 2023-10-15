part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  const LoginState({
    this.buttonState = ButtonState.idle,
    this.show = false,
    this.email = '',
    this.password = '',
  });
  final ButtonState buttonState;
  final bool show;
  final String email;
  final String password;

  @override
  List<Object> get props => [buttonState, show, email, password];
}

class LoginInitial extends LoginState {
  const LoginInitial({
    super.buttonState,
    super.show,
    super.email,
    super.password,
  });

  LoginInitial copywith({
    ButtonState? buttonState,
    bool? show,
    String? email,
    String? password,
  }) =>
      LoginInitial(
        buttonState: buttonState ?? this.buttonState,
        show: show ?? this.show,
        email: email ?? this.email,
        password: password ?? this.password,
      );
}
