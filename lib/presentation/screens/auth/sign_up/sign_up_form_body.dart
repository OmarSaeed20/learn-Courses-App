import '/index.dart';

class SignUpFormBody extends StatefulWidget {
  const SignUpFormBody({super.key});

  @override
  State<SignUpFormBody> createState() => _SignUpFormBodyState();
}

class _SignUpFormBodyState extends State<SignUpFormBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool obscureText = true;
  final List formComplete = [false, false, false];
  final TextEditingController nameTextEditCon = TextEditingController();
  final TextEditingController emailTextEditingCon = TextEditingController();
  final TextEditingController passwordEditingCon = TextEditingController();
  ButtonState textWithIconState = ButtonState.idle;

  @override
  void dispose() {
    // Limpia el controlador cuando el widget se elimine del árbol de widgets
    nameTextEditCon.dispose();
    emailTextEditingCon.dispose();
    passwordEditingCon.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          // textfield : nombre
          textField(
            "Name",
            controller: nameTextEditCon,
            onChanged: (value) => setState(() => loadIndicator()),
          ),
          // textfield : email
          textField(
            "email",
            controller: emailTextEditingCon,
            onChanged: (value) => setState(() => loadIndicator()),
            hintText: "example@mail.com",
          ),
          // textfield : password
          textField(
            "password",
            controller: passwordEditingCon,
            onChanged: (value) => setState(() => loadIndicator()),
            hintText: "at least 8 characters",
            obscureText: obscureText,
            icon: true,
            onTap: () => setState(() => obscureText = !obscureText),
          ),
          // lines
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20).r,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                dividerChecker(textWithIconState, formComplete[0]),
                dividerChecker(textWithIconState, formComplete[1]),
                dividerChecker(textWithIconState, formComplete[2]),
              ],
            ),
          ),
          // button : Sign Up
          ButtonSignBtn("Sign Up",onTap: save, state: textWithIconState),
        ],
      ),
    );
  }

  // Functions
  void loadIndicator() {
    // indicators logic

    int count = 0;
    // We check how many fields have data
    if (nameTextEditCon.text != '') count++;
    if (emailTextEditingCon.text != '') count++;
    if (passwordEditingCon.text != '') count++;
    // we reset all the variables in the list
    for (var i = 0; i < formComplete.length; i++) {
      formComplete[i] = false;
    }
    // we indicate the number of fields with data
    for (var i = 0; i < count; i++) {
      formComplete[i] = true;
    }
  }

  void save() {
    switch (textWithIconState) {
      case ButtonState.idle:
        textWithIconState = ButtonState.loading;

        if (_formKey.currentState!.validate()) {
          onSignUpTaped();
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
        loadIndicator();
        break;
    }
    setState(() {
      textWithIconState = textWithIconState;
    });
  }

  Future<void> onSignUpTaped() {
    return Future.delayed(const Duration(seconds: 1), () {
      setState(() => textWithIconState = ButtonState.success);
      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          // set : default values
          _formKey.currentState?.reset();
          nameTextEditCon.clear();
          emailTextEditingCon.clear();
          passwordEditingCon.clear();
          textWithIconState = ButtonState.idle;
          loadIndicator();
        });
      });
    });
  }
}
