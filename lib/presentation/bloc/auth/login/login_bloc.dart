import 'dart:async';
import 'package:equatable/equatable.dart';

import '../../../../index.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginInitial> {
  final UserLoginUseCase _useCase;
  LoginBloc(this._useCase) : super(const LoginInitial()) {
    on<PasswordEvent>(passwordEvent);
    on<EmailEvent>(emailEvent);
  }

  void emailEvent(EmailEvent event,Emitter<LoginInitial> emit) =>
    emit(state.copywith(email: event.email));

  void passwordEvent(PasswordEvent event,Emitter<LoginInitial> emit) =>
    emit(state.copywith(password: event.password));

}
