import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:spa_booking/Components/rounded_button.dart';
import 'package:spa_booking/Screens/Login/login_screen.dart';
import 'package:spa_booking/common/themhelper.dart';
import 'package:intl/intl.dart';
import 'package:spa_booking/controller/register.dart';


class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
    _BodyState createState() => _BodyState();
}
class _BodyState extends State<Body> {
  DateTime selectedDate = DateTime.now();
final format = DateFormat("yyyy-MM-dd");
TextEditingController emailController = TextEditingController();
  TextEditingController fullnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  
  final RegisterController _controller = Get.find<RegisterController>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: const BoxConstraints.expand(),
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/spa_girl.png",
                        ),
                        fit: BoxFit.contain)),
                height: MediaQuery.of(context).size.height * .15,
              ),
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Text("Create an account!",style: TextStyle(color: Colors.green,fontSize: 24,fontStyle: FontStyle.normal),),),
              Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: TextField(
                        controller: emailController,
                          decoration: ThemeHelper().textInputDecoration("Email","Input email... "),
                      ),
              ), 
              Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: TextField(
                        controller: fullnameController,
                          decoration: ThemeHelper().textInputDecoration("FullName","Input fullname... "),
                      ),
              ),
              Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: TextField(
                        controller: usernameController,
                          decoration: ThemeHelper().textInputDecoration("username","Input username... "),
                      ),
              ),  
              Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: TextField(
                          controller: passwordController,
                          decoration: ThemeHelper().textInputPasswordDecoration("password", "Input password"),                     
                              obscureText: true,  
                      ),      
              ),
              Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: TextField(
                          controller: addressController,
                          decoration: ThemeHelper().textInputDecoration("Address","Input address... "),
                      ),
              ),
              
              Padding(
                
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: TextField(
                        controller: phoneController,
                          decoration: ThemeHelper().textInputDecoration("Phone","InputPhone... "),
                      ),
              ),
              Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: Column(
                        children: <Widget>[
                        Text('DOB: (${format.pattern})'),
                      
                        DateTimeField(
                          controller: dobController,
                          format: format,
                          onShowPicker: (context, currentValue) {
                            return showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2100));
                          },
                        ),
                        ]
                      ),           
              ),
              RoundedButton(
              text: "Create Account",
              color: (Colors.red[300])!,
              press: ()=> _controller.addRegister(emailController,fullnameController,usernameController,passwordController,addressController,dobController,phoneController),
              textColor: Colors.white,
            ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  child: Container(
                    height: 130,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(35, 20, 0, 30),
                          child: Text.rich(
                            TextSpan(
                              children: [
                                const TextSpan( text: "Are you have account? ",style: const TextStyle(color: Colors.black, fontSize: 16)),
                                TextSpan(
                                  text: "Login now!",
                                  style: const TextStyle(color: Colors.blueAccent, fontSize: 16,fontWeight: FontWeight.bold),
                                  recognizer: TapGestureRecognizer()
                                  ..onTap = (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                                    return const LoginScreen(); //Routing Home Page in here
                                    }));
                                  }
                                ),                               
                              ]
                            )
                          ),
                        
                        ),
                        
                      ],
                    ),
                  )),  
            ],
          ),
        ),
      ),
    );
  }

  
  }