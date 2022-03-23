
import 'package:flutter/material.dart';
import 'package:spa_booking/Screens/Register/components/body.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

@override
  _RegisterScreenState createState() => _RegisterScreenState();
} 
  class _RegisterScreenState extends State<RegisterScreen> {

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }

}
