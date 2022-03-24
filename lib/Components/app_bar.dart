import 'package:flutter/material.dart';
import 'package:spa_booking/Screens/Login/login_screen.dart';
import 'package:spa_booking/Screens/SpaDetail/ChosenService/chosen_service_screen.dart';
import 'package:spa_booking/models/service.dart';
import 'package:spa_booking/utils/constants.dart';

class TopBar {
  static AppBar getAppBarLocation(Size size, BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(
            onPressed: () {},
            icon: Image.asset("assets/icons/location.png", color: Color.fromRGBO(196, 196, 196, 1),width: size.width * 0.07,),
            iconSize: size.width * 0.08,
          ),
          Container(
            width: size.width * 0.6,
            child: Text(
              "Quận 5, Phường 5, Tp Hồ Chí Minh ",
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          IconButton(
              onPressed: () {
                // Navigator.push(context, MaterialPageRoute(
                //   builder: (context) {
                //     return LoginScreen();
                //   },
                // ));
              },
              icon: Image.asset("assets/icons/bell.png", color: Color.fromRGBO(255, 177, 51, 1),width: size.width * 0.07,),
              iconSize: size.width * 0.08),
        ],
      ),
    );
  }

  static AppBar getAppBarHasBackIcon(
      Size size, BuildContext context, String title, Function() func) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Stack(alignment: Alignment.centerLeft, children: [
        Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  title,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: ColorConstants.textColorBold,
                      fontSize: 18),
                ),
              )
            ],
          ),
        ),
        IconButton(
            onPressed: func,
            icon: Image.asset(
              "assets/icons/back.png",
              width: size.width * 0.07,
            )),
      ]),
      backgroundColor: Colors.red[100],
    );

  }
  static AppBar getAppBarSpaDetail(
      Size size, BuildContext context, String title, Function() func, List<Service2> cart,String lastPage,String searchKey) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: func,
                  icon: Image.asset(
                    "assets/icons/back.png",
                    width: size.width * 0.07,
                  )),
              Container(
                width: size.width*0.5,
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: TextFormField(
                  onFieldSubmitted: (value){
                  },

                  decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(5),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide(color: ColorConstants.textColorBold, width: 1)),
                      hintText: "Search service",
                      hintStyle: TextStyle(
                        color: Colors.red[200],
                      ),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.red[200],
                      )),
                ),
              )

            ],
          ),

          if(cart.isEmpty)
          IconButton(onPressed: (){

          }, icon: Image.asset(StrConstants.iconPath+"cart.png",width: 30,))
          else
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ChosenServicesScreen(cart: cart,lastPage: lastPage,searchKey: searchKey,);
              },));
            }, icon: Image.asset(StrConstants.iconPath+"cartNotNull.png",width: 30,))
        ],
      )
        ,
      backgroundColor: Colors.red[100],
    );
  }

}
