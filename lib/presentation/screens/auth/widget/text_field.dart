import '/index.dart';

Padding textField(
  String tx, {
  TextEditingController? controller,
  void Function(String)? onChanged,
  String? hintText,
  bool obscureText = false,
  bool icon = false,
  TextInputType? type,
  void Function()? onTap,
}) =>
    Padding(
      padding: paddingSymme(horizontal: 20, vertical: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: paddingOnly(botm: 5),
            child: TextWidget(
              tx,
              style: styleNormal(fontWeight: FontWeight.bold),
            ),
          ),
          // TextFormField
          TextFormField(
            controller: controller,
            onChanged: onChanged,
            obscureText: obscureText,
            keyboardType: type,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.all(const Radius.circular(5).r),
              ),
              hintText: (hintText ?? tx).toLowerCase(),
              hintStyle:
                  styleNormal(color: AppColors.textGray1, fontFamily: "Avenir"),
              suffixIcon: IconButton(
                padding: paddingOnly(),
                onPressed: onTap,
                icon: icon
                    ? Icon(
                        obscureText == true
                            ? Icons.remove_red_eye
                            : Icons.remove_red_eye_outlined,
                      )
                    : const SizedBox(),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a correct $tx';
              }
              return null;
            },
          ),
        ],
      ),
    );
