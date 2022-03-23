import 'package:flutter/material.dart';
import 'package:spa_booking/utils/constants.dart';

class ServiceAndProduct extends StatelessWidget {
  String name ;
  String image;
  Function() onTap;
  ServiceAndProduct(
      {required this.name, required this.image, required this.onTap});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(StrConstants.imgPath+image,width: size.width * 0.4,height: size.width * 0.3,fit: BoxFit.fill,),

          SizedBox(
            height: 5,
          ),
          Text(
            name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 25,
          ),
        ],
      ),
      onTap: onTap,
    );
  }
}
