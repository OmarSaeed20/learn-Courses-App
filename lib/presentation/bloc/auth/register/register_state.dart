part of 'register_bloc.dart';

class RegisterState extends Equatable {
  late final bool? obscureText;
  late final ButtonState textWithIconState;

  final String? message;

  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();

  RegisterState({
    this.obscureText = true,
    this.message = '',
    this.textWithIconState = ButtonState.idle,
  });
  RegisterState copyWith({
    String? message,
    bool? obscureText,
    ButtonState? textWithIconState,
  }) =>
      RegisterState(
        message: message ?? this.message,
        obscureText: obscureText ?? this.obscureText,
        textWithIconState: textWithIconState ?? this.textWithIconState,
      );
  @override
  List<Object?> get props =>
      [obscureText, textWithIconState, name, email, password];
}

/* final class RegisterInitial extends RegisterState {
  RegisterInitial({
    required super.obscureText,
    required super.message,
    required super.textWithIconState,
  });
} */
