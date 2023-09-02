import '/index.dart';

Expanded dividerChecker(ButtonState state, bool index) => Expanded(
      flex: 1,
      child: Divider(
        thickness: 4,
        indent: 5,
        endIndent: 5,
        color: state == ButtonState.success
            ? Colors.green.shade400
            : index
                ? Colors.blue
                : Colors.grey,
      ),
    );
