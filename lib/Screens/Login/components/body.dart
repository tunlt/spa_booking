import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:spa_booking/Components/rounded_button.dart';
import 'package:spa_booking/Screens/Home/home_screen.dart';
import 'package:spa_booking/Screens/Login/components/background.dart';
import 'package:spa_booking/Screens/Register/register_screen.dart';
import 'package:spa_booking/controller/login.dart';
import 'package:spa_booking/controller/register.dart';

import 'or_divider.dart';
class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
    _BodyState createState() => _BodyState();
}
  
  final GoogleSignIn _googleSignIn = GoogleSignIn(
      scopes: [
        "email"
      ]
  );

class _BodyState extends State<Body> {

  GoogleSignInAccount? _currentUser;
  final LoginController _controller = Get.find<LoginController>();
 @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {
        _currentUser = account;
      });
    });
    _googleSignIn.signInSilently();
    super.initState();
  }
//login with google func
  void signOut(){
    _googleSignIn.disconnect();
  }
  
  Future<void> signIn() async {
    try{
      GoogleSignInAccount? user = _currentUser;
      await _googleSignIn.signIn();
       print("haha1");
       if(user != null){
         print("haha");
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MainScreen(); //Routing Home Page in here
                }));
        }
    }catch (e){
      print('Error signing in $e');
    }
  }
//login function 
static Future<User?> loginUsingEmailPassword({required String email, required String password, required BuildContext context}) async {
FirebaseAuth auth = FirebaseAuth.instance;
User? user;
try {
  UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
  user = userCredential.user;
}on FirebaseAuthException catch (e){
  if(e.code == "user-not-found"){
    print("No User found for that email");
  }
}

return user;
}
  
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "assets/images/spa_girl.png",
              width: size.width * 0.8,
            ),
            const Text(
              "Welcome Back",
              style: TextStyle(
                  fontFamily: 'Roboto',
                  letterSpacing: 1.2,
                  color: Colors.white,
                  fontSize: 20),
            ),
            const Text(
              "Please, Log in.",
              style: TextStyle(
                  fontFamily: 'Roboto',
                  letterSpacing: 1.2,
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.width * 0.06),
            TextField(
              controller: _emailController,
   
              decoration:  const InputDecoration(
              prefixIcon: Icon(Icons.mail,
                  color: Colors.black
              ),
              hintText: "Username or Email",
              border: InputBorder.none),
            ),
             TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                
              icon: Icon(Icons.lock,
                  color: Colors.black,
              ),
              hintText: "Password",
              border: InputBorder.none),
            ),
            // RoundedInputField(
                
            //     hintText: "Username and Gmail",
            //     icon: Icons.assignment_ind_outlined,
            //     onChanged: (value) {}),
            // RoundedPasswordField(onChanged: (value) {}),
            SizedBox(height: size.width * 0.03),
    //         Container(
    //             margin: const EdgeInsets.symmetric(vertical: 7),
    //             width: size.width * 0.8,
    //             child: ClipRRect(
    //             borderRadius: BorderRadius.circular(25),
    //             child: FlatButton(
    //              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 40),
    //              color: Colors.red[300],
    //               onPressed: () async {
    //                 // ignore: unused_local_variable
    //                 User? user = await loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
    //               },
    //               child: const Text(
    //                "Login",
    //                style: TextStyle(
    //             color: Colors.white, letterSpacing: 1.4, fontFamily: 'Roboto'),
    //       ),

    //     ),
    //   ),
    // );
            RoundedButton(
              text: "Login",
              color: (Colors.red[300])!,
              press: () => _controller.LoginCustomer(_emailController,_passwordController),
              // press: () async {
              //   // test app
              //   User? user = await loginUsingEmailPassword(email: _emailController.text, password: _passwordController.text, context: context);
              //   if(user != null){
              //       Navigator.push(context, MaterialPageRoute(builder: (context) {
              //     return MainScreen(); //Routing Home Page in here
              //   }));
              //   }
                
              // },
              textColor: Colors.white,
            ),
            // RoundedButton(
            //   text: "Login with google",
            //   color: (Colors.red[300])!,
            //   press: () async {
            //     // test app
            //    GoogleSignInAccount? user = _currentUser;
            //     if(user == null){
            //     //     Navigator.push(context, MaterialPageRoute(builder: (context) {
            //     //   return MainScreen(); //Routing Home Page in here
            //     // }));
            //     print("heeh");
            //     onPressed: signIn;
            //     }
                
            //   },
            //   textColor: Colors.white,
            // ),
            // ElevatedButton(
            //     onPressed: signIn,
            //     child: const Padding(
            //       padding: EdgeInsets.all(8.0),
            //       child: Text('Sign in', style: TextStyle(fontSize: 30)),
            //     )
            // ),
            
            Container(
              
              margin: const EdgeInsets.symmetric(vertical: 7),
              width: size.width * 0.8,
              child: ClipRRect(
               borderRadius: BorderRadius.circular(25),
              child: FlatButton(
              padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 40),
              color: Colors.red[300],
              onPressed: signIn,
              child: const Text(    
                "Sign In with google",
              style: TextStyle(
              color: Colors.white, letterSpacing: 1.4, fontFamily: 'Roboto'),
                 ),

               ),
              ),
          ),
            const OrDivider(),
            RoundedButton(
              text: "Create An Account",
              color: (Colors.red[300])!,
              press: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return RegisterScreen(); //Routing Home Page in here
                }));
              },
              textColor: Colors.white,
            ),
          ],
        ),
      ),
    );
    
  }

}

