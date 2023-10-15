part of 'auth_bloc.dart';

class AuthState extends Equatable {
  final bool isSignUp;

  final UserModel? userModel;
  final ButtonState reqState;
  final String message;
  final String email;
  final String password;

  const AuthState({
    this.isSignUp = true,
    this.userModel,
    this.reqState = ButtonState.loading,
    this.message = '',
    this.email = '',
    this.password = '',
  });

  AuthState copyWith({
    bool? isSignUp,
    UserModel? userModel,
    ButtonState? reqState,
    String? message,
    String? email,
    String? password,
  }) =>
      AuthState(
        isSignUp: isSignUp ?? this.isSignUp,
        userModel: userModel ?? this.userModel,
        reqState: reqState ?? this.reqState,
        message: message ?? this.message,
        email: email ?? this.email,
        password: password ?? this.password,
      );

  @override
  List<Object?> get props =>
      [isSignUp, message, email, password, reqState, userModel];
}



/* final class LearnLoadingState extends LearnState {
  const LearnLoadingState() : super(count: 0);
}

final class LearnSuccessState extends LearnState {
  const LearnSuccessState({required super.count}) ;
}

final class LearnFealirState extends LearnState {
  const LearnFealirState() : super(count: 0);
}
 */
/* enum RequestState {
  loading,
  loaded,
  error,
} */
