import 'package:learn/index.dart';

class LoginController {
  final BuildContext context;

  LoginController(this.context);

  void handleLogin(String type) {
    try {
      if (type == "email") {
        final state = context.read<LoginBloc>().state;
        String email = state.email;
        String password = state.password;

        if (email.isEmpty) {}
        if (password.isEmpty) {}
      }
    } catch (e) {}
  }
}
