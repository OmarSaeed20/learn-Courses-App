import 'package:equatable/equatable.dart';
import 'package:nb_utils/nb_utils.dart';

import '../../../../domain/usecase/sign_up_usecase.dart';
import '/index.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final SignUpUseCase _useCase;
  RegisterBloc(this._useCase) : super(RegisterState()) {
    on<RegisterEvent>((event, emit) => _signUp(emit, event));
  }

  _signUp(Emitter<RegisterState> emit, RegisterEvent event) async {
    if (state.textWithIconState != ButtonState.idle) {
      emit(state.copyWith(textWithIconState: ButtonState.idle));
    } else {
      final result = await _useCase(
        SignUpParameter(
          name: state.name.text,
          fristName: ' state.frName.text',
          lastName: 'state.lasName.text',
          phone: 'state.phone.text',
          password: state.password.text,
          email: state.email.text,
          gender: 0,
        ),
      );
      result.fold(
        (l) {
          toastLong(l.message, bgColor: AppColors.red);
          emit(
            state.copyWith(
                message: l.message, textWithIconState: ButtonState.fail),
          );
        },
        (_) {
          toast("Register successfully . ");
          sl<NavigationService>().toNamed(Routes.myHomePage);
          emit(state.copyWith(textWithIconState: ButtonState.success));
        },
      );
    }
  }
}
