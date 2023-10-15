import '/index.dart';

class CustomTextFailed extends StatelessWidget {
  const CustomTextFailed({
    super.key,
    required this.tx,
    this.controller,
    this.onChanged,
    this.obscureText = false,
    this.hintText,
    this.type,
    this.icon = false,
    this.onTap,
    this.prefixIcon,
  });

  final String tx;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String? hintText;
  final bool obscureText;
  final bool icon;
  final TextInputType? type;
  final IconData? prefixIcon;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 325.w,
      padding: paddingSymme(vertical: 4),
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
          SizedBox(
            height: 50.h,
            child: TextFormField(
              controller: controller,
              onChanged: onChanged,
              obscureText: obscureText,
              keyboardType: type,
              decoration: InputDecoration(
                contentPadding: paddingOnly(lf: 10),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(const Radius.circular(5).r),
                  borderSide: const BorderSide(color: AppColors.grey),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grey, width: .5),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.primaryElement),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grey),
                ),
                hintText: (hintText ?? tx).toLowerCase(),
                hintStyle: styleNormal(
                  color: AppColors.textGray1,
                  fontFamily: "Avenir",
                ),
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
                prefixIcon: Icon(
                  prefixIcon ?? Icons.abc_outlined,
                  color: AppColors.primar300,
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a correct $tx';
                }
                return null;
              },
            ),
          ),
        ],
      ),
    );
  }
}
