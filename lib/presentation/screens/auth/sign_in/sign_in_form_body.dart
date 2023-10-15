import '/index.dart';

class SignInFormBody extends StatefulWidget {
  const SignInFormBody({super.key});

  @override
  State<SignInFormBody> createState() => _SignInFormBodyState();
}

class _SignInFormBodyState extends State<SignInFormBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool obscureText = true;
  final List<bool> formComplete = <bool>[false, false];
  final TextEditingController emailTextEditingCon = TextEditingController();
  final TextEditingController passwordEditingCon = TextEditingController();
  ButtonState textWithIconState = ButtonState.idle;

  @override
  void dispose() {
    emailTextEditingCon.dispose();
    passwordEditingCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        LoginBloc bloc = BlocProvider.of<LoginBloc>(context);
        return Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextFailed(
                tx: "email",
                type: TextInputType.emailAddress,
                prefixIcon: Icons.email_outlined,
                controller: emailTextEditingCon,
                onChanged: (value) => bloc.add(EmailEvent(email: value)),
                hintText: "example@mail.com",
              ),
              // CustomTextFailed(

              CustomTextFailed(
                tx: "password",
                type: TextInputType.visiblePassword,
                prefixIcon: Icons.lock_outline_rounded,
                controller: passwordEditingCon,
                onChanged: (value) => bloc.add(PasswordEvent(password: value)),
                hintText: "at least 8 characters",
                obscureText: state.show,
                icon: true,
                onTap: () => bloc.add(ShowPasswordEvent(show: state.show)),
                // onTap: () => setState(() => obscureText = !obscureText),
              ),
              // lines
              Padding(
                padding: paddingSymme(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    dividerChecker(textWithIconState, formComplete[0]),
                    dividerChecker(textWithIconState, formComplete[1]),
                  ],
                ),
              ),
              // button : Sign Up
              ButtonSignBtn(
                "Sign In",
                onTap: () => onTapedSignIn(bloc),
                state: textWithIconState,
              ),
            ],
          ),
        );
      },
    );
  }

  // Functions
  void _onChange(LoginBloc bloc) {
    debugPrint('??????>>>>>>>>>>> void _onChange <<<<<<<<<<<,,,, ');
    /*   bloc.add(OnChangee(
      formComplete: formComplete,
      emailCon: emailTextEditingCon,
      passwordCon: passwordEditingCon,
    )); */
    /*   // indicators logic
    int count = 0;

    // We check how many fields have data
    if (emailTextEditingCon.text.isNotEmpty) count++;
    if (passwordEditingCon.text.isNotEmpty) count++;
    // we reset all the variables in the list
    for (var i = 0; i < formComplete.length; i++) {
      formComplete[i] = false;
    }
    // we indicate the number of fields with data
    for (var i = 0; i < count; i++) {
      formComplete[i] = true;
    } */
  }

  void onTapedSignIn(LoginBloc bloc) {
    switch (textWithIconState) {
      case ButtonState.idle:
        textWithIconState = ButtonState.loading;

        if (_formKey.currentState!.validate()) {
          // onSignUpTaped(bloc);
        } else {
          // el formulario es invalido
          textWithIconState = ButtonState.fail;
        }
        break;
      case ButtonState.loading:
        break;
      case ButtonState.success:
        textWithIconState = ButtonState.idle;
        break;
      case ButtonState.fail:
        textWithIconState = ButtonState.idle;
        _formKey.currentState?.reset();
        _onChange(bloc);
        break;
    }
    setState(() {
      textWithIconState = textWithIconState;
    });
  }

  Future<void> onSignUpTaped(LoginBloc bloc) {
    return Future.delayed(const Duration(seconds: 0), () {
      // setState(() => textWithIconState = ButtonState.success);
      /* Future.delayed(const Duration(seconds: 3), () {
       
      }); */
      setState(() {
        // set : default values
        _formKey.currentState?.reset();

        emailTextEditingCon.clear();
        passwordEditingCon.clear();
        textWithIconState = bloc.state.buttonState;
        // textWithIconState = ButtonState.idle;
        _onChange(bloc);
      });
    });
  }
}
