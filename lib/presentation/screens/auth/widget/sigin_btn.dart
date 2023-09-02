import '/index.dart';

class ButtonSignBtn extends StatelessWidget {
  const ButtonSignBtn(
    this.name, {
    super.key,
    required this.onTap,
    required this.state,
  });
  final Function onTap;
  final ButtonState state;
  final String name;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.fastOutSlowIn,
      margin: paddingSymme(horizontal: 20),
      height: 50.h,
      width: state == ButtonState.loading ? 60.w : 300.w,
      child: Hero(
        tag: name,
        child: ProgressButton.icon(
          radius: 5.r,
          textStyle: styleNormal(color: AppColors.white),
          iconedButtons: {
            ButtonState.idle: IconedButton(
              text: name,
              icon: const Icon(Icons.person, color: AppColors.white),
              color: AppColors.primary,
            ),
            ButtonState.loading: IconedButton(
              text: "wait a minute",
              color: Colors.blue.shade700,
            ),
            ButtonState.fail: IconedButton(
              text: "could not save",
              icon: const Icon(Icons.cancel, color: Colors.white),
              color: Colors.red.shade300,
            ),
            ButtonState.success: IconedButton(
              icon: const Icon(Icons.check_circle, color: Colors.white),
              color: Colors.green.shade400,
              text: 'Saved successfully',
            ),
          },
          onPressed: onTap,
          state: state,
          minWidthStates: const [ButtonState.loading, ButtonState.success],
        ),
      ),
    );
  }
}
