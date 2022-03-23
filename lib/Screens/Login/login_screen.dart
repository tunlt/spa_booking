import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:spa_booking/Screens/Login/components/body.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

@override
  _LoginScreenState createState() => _LoginScreenState();
} 
  class _LoginScreenState extends State<LoginScreen> {

  Future<FirebaseApp> _initializeFirebase() async{
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: _initializeFirebase(),
        builder: (context, snapshot){
          if(snapshot.connectionState == ConnectionState.done){
            return const Body();
          }
           return const Center(
            child: CircularProgressIndicator(),
           );
        },
      ),
      // body: Body(),
      // resizeToAvoidBottomInset: false,

    );
  }

  
}
