import 'package:flutter/material.dart';
import 'package:spa_booking/Components/text_field_container.dart';

class RoundedPasswordField extends StatelessWidget {
  final ValueChanged<String> onChanged;

  const RoundedPasswordField({Key? key, required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: onChanged,
        obscureText: true,
        decoration: InputDecoration(
          icon: Icon(Icons.vpn_key_outlined, color: Colors.red[100]),
          suffixIcon: Icon(
            Icons.visibility,
            color: Colors.red[100],
          ),
          hintText: "Password",
          border: InputBorder.none,
        ),
      ),
    );
  }
}
