import 'package:equatable/equatable.dart';
import 'package:learn/data/model/user_model/user_model.dart';

import '/index.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc(this._loginUseCase ) : super(const AuthState()) {
    on<SwitchSignType>((event, emit) => _switch(emit, event));
    on<OnChangee>((event, emit) => _onChangee(emit, event));
    on<SignInEv>((event, emit) => _signIn(emit, event));
  }
  final UserLoginUseCase _loginUseCase; 
  
  void _switch(Emitter<AuthState> emit, SwitchSignType event) =>
      emit(AuthState(isSignUp: event.isSignUp));

  void _signIn(Emitter<AuthState> emit, SignInEv event) async {
    if (state.isSignUp) {
      emit(AuthState(isSignUp: state.isSignUp));
    }
  }

  void _onChangee(Emitter<AuthState> emit, OnChangee event) async {
    // indicators logic
    int count = 0;

    // We check how many fields have data
    if (event.emailCon.text.isNotEmpty) count++;
    if (event.passwordCon.text.isNotEmpty) count++;
    // we reset all the variables in the list
    for (var i = 0; i < event.formComplete.length; i++) {
      event.formComplete[i] = false;
    }
    // we indicate the number of fields with data
    for (var i = 0; i < count; i++) {
      event.formComplete[i] = true;
    }
    final result = await _loginUseCase(CreateUserUseCaseParams(
      paassword: event.passwordCon.text,
      email: event.emailCon.text,
    ));

    result.fold(
      (l) =>
          emit(state.copyWith(reqState: ButtonState.fail, message: l.message)),
      (r) => emit(
        state.copyWith(userModel: r, reqState: ButtonState.success),
      ),
    );
  }

 }
