import '/index.dart';

class SignUpFormBody extends StatefulWidget {
  const SignUpFormBody({super.key});
  @override
  State<SignUpFormBody> createState() => _SignUpFormBodyState();
}

class _SignUpFormBodyState extends State<SignUpFormBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final List formComplete = [false, false, false];
/*   bool obscureText = true;
  final TextEditingController nameTextEditCon = TextEditingController();
  final TextEditingController emailTextEditingCon = TextEditingController();
  final TextEditingController passwordEditingCon = TextEditingController();
  ButtonState textWithIconState = ButtonState.idle; */

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        final bloc = BlocProvider.of<RegisterBloc>(context);
        return Form(
          key: _formKey,
          child: Column(
            children: [
              // textfield : nombre
              CustomTextFailed(
                tx: "Name",
                controller: state.name,
                prefixIcon: Icons.person_outline,
                onChanged: (value) => setState(() => loadIndicator(state)),
              ),
              // textfield : email
              CustomTextFailed(
                tx: "email",
                prefixIcon: Icons.email_outlined,
                controller: state.email,
                onChanged: (value) => setState(() => loadIndicator(state)),
                hintText: "example@mail.com",
              ),
              // textfield : password
              CustomTextFailed(
                tx: "password",
                controller: state.password,
                prefixIcon: Icons.lock_outline_rounded,
                onChanged: (value) => setState(() => loadIndicator(state)),
                hintText: "at least 8 characters",
                obscureText: state.obscureText!,
                icon: true,
                onTap: () =>
                    setState(() => state.obscureText = !state.obscureText!),
              ),
              // lines
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20).r,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    dividerChecker(state.textWithIconState, formComplete[0]),
                    dividerChecker(state.textWithIconState, formComplete[1]),
                    dividerChecker(state.textWithIconState, formComplete[2]),
                  ],
                ),
              ),
              // button : Sign Up
              ButtonSignBtn(
                "Sign Up",
                onTap: () => setState(() => bloc.add(const RegisterEvent())),
                state: state.textWithIconState,
              ),
            ],
          ),
        );
      },
    );
  }

  // Functions
  void loadIndicator(RegisterState state) {
    // indicators logic

    int count = 0;
    // We check how many fields have data
    if (state.name.text != '') count++;
    if (state.email.text != '') count++;
    if (state.password.text != '') count++;
    // we reset all the variables in the list
    for (var i = 0; i < formComplete.length; i++) {
      formComplete[i] = false;
    }
    // we indicate the number of fields with data
    for (var i = 0; i < count; i++) {
      formComplete[i] = true;
    }
  }

  void save(RegisterState state) {
    switch (state.textWithIconState) {
      case ButtonState.idle:
        state.textWithIconState = ButtonState.loading;

        if (_formKey.currentState!.validate()) {
          // onSignUpTaped();
        } else {
          // el formulario es invalido
          state.textWithIconState = ButtonState.fail;
        }
        break;
      case ButtonState.loading:
        break;
      case ButtonState.success:
        state.textWithIconState = ButtonState.idle;
        break;
      case ButtonState.fail:
        state.textWithIconState = ButtonState.idle;
        _formKey.currentState?.reset();
        loadIndicator(state);
        break;
    }
    setState(() {
      state.textWithIconState = state.textWithIconState;
    });
  }

  Future<void> onSignUpTaped(RegisterState state) {
    return Future.delayed(const Duration(seconds: 1), () {
      setState(() => state.textWithIconState = ButtonState.success);
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          // set : default values
          _formKey.currentState?.reset();
          state.name.clear();
          state.email.clear();
          state.password.clear();
          state.textWithIconState = ButtonState.idle;
          loadIndicator(state);
        });
      });
    });
  }
}
