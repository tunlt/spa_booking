import 'package:flutter/material.dart';
import 'package:spa_booking/Components/app_bar.dart';
import 'package:spa_booking/Screens/SpaDetail/spa_detail_screen.dart';
import 'package:spa_booking/models/service.dart';
import 'package:spa_booking/utils/constants.dart';

class ChosenServicesScreen extends StatefulWidget {
  List<Service2> cart;
  String searchKey = "";
  String lastPage = "";
  ChosenServicesScreen({required this.cart,required this.lastPage, required this.searchKey,});


  @override
  State<StatefulWidget> createState() {
    return _ChosenServicesScreen();
  }
}
class _ChosenServicesScreen extends State<ChosenServicesScreen>{
  String title = "Chosen Services";
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: TopBar.getAppBarHasBackIcon(
          size, context, title,
              (){
            // Navigator.push(context, MaterialPageRoute(builder: (context) {
            //   return SpaDetailScreen( spa: widget.cart[0].spa, cartForward: widget.cart,lastPage: widget.lastPage,searchKey: widget.searchKey,);
            // },));
          }
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 25, bottom: 0),
        child: Padding(
          padding: EdgeInsets.only(left: 12, right: 12, top: 15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                for(Service2 service in widget.cart)
                  getServiceBox(service, "spa1.png"),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget getServiceBox(Service2 service, String image, ){
    Size size=MediaQuery.of(context).size;

    String description = service.name +
        " " +
        service.cateType +
        " is your beauty care service. Make you feel comfortable, relieve stress after work.";
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: GestureDetector(
        // onTap: func,
        child: Stack(
          children: [
            Center(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: ColorConstants.mainColor),
                width: size.width * 0.85,
                height: size.width * 0.3 / 4 * 3 + 30,
                child: Padding(
                  padding: EdgeInsets.only(left: 5, right: 5, top: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (service.sale > 0)
                        Stack(
                          children: [
                            Image.asset(
                              StrConstants.imgPath + image,
                              width: size.width * 0.27,
                              height: size.width * 0.3 / 4 * 3,
                              fit: BoxFit.fill,
                            ),
                            Text(
                              "Sale ${service.sale}%",
                              style: TextStyle(
                                  backgroundColor: Colors.red[100],
                                  color: Colors.red,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      else
                        Image.asset(
                          StrConstants.imgPath + image,
                          width: size.width * 0.27,
                          height: size.width * 0.3 / 4 * 3,
                          fit: BoxFit.fill,
                        ),
                      SizedBox(
                        width: 5,
                      ),
                      Container(
                        width: size.width * 0.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              service.name + " " + service.cateType,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: ColorConstants.mainColorBold),
                            ),
                            Text(
                              description,
                              style: TextStyle(fontSize: 12),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 4,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(top: size.width * 0.3 / 4 * 3 + 30 - 10),
                child: Row(
                  children: [
                    Container(
                      width: size.width * 0.85,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            width: size.width * 0.25,
                            height: 25,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                border: Border.all(
                                    width: 2, color: ColorConstants.mainColorBold),
                                color: Colors.white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                if (service.sale > 0)
                                  Text(
                                    "\$${service.price}",
                                    style: TextStyle(
                                        fontSize: 10,
                                        color: ColorConstants.mainColorBold,
                                        decoration: TextDecoration.lineThrough),
                                  ),
                                Text(
                                  "\$${service.price * (100 - service.sale) / 100}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, color: Colors.red,fontSize: 12),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                )
            ),
            Padding(
              padding: EdgeInsets.only(top: size.width * 0.3 / 4 * 3 + 30 - 10),
              child: Center(
                  child: Container(
                    child: RaisedButton(
                      onPressed: () {
                        setState(() {
                          widget.cart.remove(service);
                        });
                      },
                      color: Colors.orange,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5))
                      ),
                      child: Text(
                        "Cancel",
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold),
                      ),
                    ),
                    height: 25,
                    width: 80,
                  )),
            )
          ],
        ),
      ),
    );
  }

}
