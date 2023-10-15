import '/index.dart';

/// Copyright 2022 Logica Booleana Authors

class SignUpForms extends StatefulWidget {
  const SignUpForms({Key? key}) : super(key: key);
  @override
  SignUpFormsState createState() => SignUpFormsState();
}

class SignUpFormsState extends State<SignUpForms> {
  bool isSelct = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConatant.scafoldBg,
      appBar: appbar,
      body: body(context),
    );
  }

  // MAIN WIDGETS
  PreferredSizeWidget get appbar {
    return AppBar(
      title: TextWidget(
        'Welcome Back',
        style: styleLarg(fontWeight: FontWeight.w900),
      ),
      leadingWidth: 0,
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  Widget body(BuildContext context) => SingleChildScrollView(
        restorationId: "sign",
        child: Column(
          children: [
            // button : Registrarse con otras cuentas
            facebookAndGoSign(context),
            //
            BlocBuilder<AuthBloc, AuthState>(
              builder: (context, state) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        choseSignType(
                          "sign in",
                          isSelct,
                          () => setState(() => isSelct = true),
                        ),
                        choseSignType(
                          "sign up",
                          !isSelct,
                          () => setState(() => isSelct = false),
                        ),
                      ],
                    ),
                    if (isSelct)
                      const SignInFormBody()
                    else
                      const SignUpFormBody()
                          .animate()
                          .shimmer(duration: const Duration(seconds: 2)),
                    15.sH,
                  ],
                );
              },
            ),
            // Divider
            Padding(
              padding: paddingSymme(horizontal: 20, vertical: 5),
              child: const Divider(),
            ),

            Align(
              alignment: Alignment.centerRight,
              child: TxtBtn(
                TextWidget(
                  'Forget account?',
                  textAlign: TextAlign.center,
                  style: styleNormal(
                    decoration: TextDecoration.underline,
                    color: AppColors.primaryElement,
                  ),
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      );

  choseSignType(String tx, bool isSelcted, VoidCallback onTap) => Hero(
        tag: '${tx}heroTag',
        child: GestureDetector(
          onTap: onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            curve: Curves.decelerate,
            alignment: Alignment.center,
            margin: paddingSymme(vertical: 5),
            decoration: BoxDecoration(
              color: isSelcted ? AppColors.primaryElement : AppColors.grey,
              borderRadius: BorderRadius.circular(5.r),
            ),
            padding: paddingSymme(horizontal: 40, vertical: 11),
            child: TextWidget(
              tx,
              style: styleSimTit(color: AppColors.white),
            ),
          ),
        ),
      );
}
