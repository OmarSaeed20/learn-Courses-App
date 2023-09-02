import '/index.dart';

class RadioListTileWiget extends StatelessWidget {
  const RadioListTileWiget({
    super.key,
    required this.icon,
    required this.title,
    required this.vlu,
    required this.groupVlu,
    required this.onChanged,
  });
  final IconData icon;
  final String title;
  final Object vlu;
  final Object groupVlu;
  final void Function(Object?) onChanged;
  @override
  Widget build(BuildContext context) {
    return RadioListTile(
      value: vlu,
      groupValue: groupVlu,
      onChanged: onChanged,
      title: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Icon(icon, color: AppColors.secondary3),
            1.sH,
            TextWidget(
              title,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
