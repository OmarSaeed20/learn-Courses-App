import '/index.dart';

Column facebookAndGoSign(BuildContext context) => Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0).r,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: _buttonSign(
                  "facebook",
                  icon: FontAwesomeIcons.facebook,
                  onTap: () {},
                  color: Colors.blue.shade600,
                ),
              ),
              Expanded(
                child: _buttonSign(
                  "google",
                  icon: FontAwesomeIcons.google,
                  onTap: () {},
                  color: Colors.red.shade300,
                ),
              ),
              Expanded(
                child: _buttonSign(
                  "apple",
                  icon: FontAwesomeIcons.apple,
                  onTap: () {},
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        TextWidget(
          "Or use your email account to login",
          style: styleNormal(color: AppColors.textGray2),
        ),
        Divider(indent: 20.r, endIndent: 20.r),
      ],
    );

// COMPONENTS WIDGETS
Widget _buttonSign(
  String lable, {
  required IconData icon,
  required void Function()? onTap,
  double margin = 8.0,
  Color color = Colors.blue,
}) =>
    Padding(
      padding: EdgeInsets.all(margin).r,
      child: FloatingActionButton(
        heroTag: lable,
        elevation: 0,
        onPressed: onTap,
        backgroundColor: color,
        shape: RoundedRectangleBorder(borderRadius: AppConatant.borderRa),
        child: FaIcon(icon, color: Colors.white, semanticLabel: lable),
      ),
    );
