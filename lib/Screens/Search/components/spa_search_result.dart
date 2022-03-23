import 'package:flutter/material.dart';
import 'package:spa_booking/Screens/SpaDetail/spa_detail_screen.dart';
import 'package:spa_booking/utils/constants.dart';

class SpaResult extends StatelessWidget {
  String searchKey="";

  SpaResult(
      {
      required this.searchKey});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double widthImage=size.width*0.35;
    double widthInfoText=size.width*0.5;
    return GestureDetector(
      // onTap: () {
      //   Navigator.push(context, MaterialPageRoute(
      //     builder: (context) {
      //       return SpaDetailScreen(lastPage: "search",searchKey: searchKey,);
      //     },
      //   ));
      // },
      // child: Column(
      //   children: [
      //     Container(
      //       decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10)), color:ColorConstants.mainColor ),
      //       child: Padding(
      //         padding: EdgeInsets.all(8),
      //         child: Row(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             Image.asset(
      //               "assets/images/spa3.png",
      //               width: widthImage,fit: BoxFit.fill,height: 95,
      //             ),
      //             Padding(
      //               padding: EdgeInsets.only(left: 10),
      //               child: Container(
      //                 width: widthInfoText,
      //                 child: Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Text(
      //                       name,
      //                       style: TextStyle(
      //                           fontWeight: FontWeight.bold,
      //                           fontStyle: FontStyle.italic,
      //                           fontSize: 16,
      //                           color: ColorConstants.textColorBold),
      //                       overflow: TextOverflow.ellipsis,
      //                     ),
      //                     SizedBox(
      //                       height: 5,
      //                     ),
      //                     Text(
      //                       "Address: $address",
      //                       style: TextStyle(fontSize: 12, color: ColorConstants.textColor),
      //                       overflow: TextOverflow.ellipsis,
      //                     ),
      //                     SizedBox(
      //                       height: 5,
      //                     ),
      //                     Text(
      //                       "Price: \$$priceBegin~$priceEnd",
      //                       style: TextStyle(fontSize: 12, color: ColorConstants.textColor),
      //                       overflow: TextOverflow.ellipsis,
      //                     ),
      //                     SizedBox(
      //                       height: 5,
      //                     ),
      //                     Text(
      //                       "Feature: Facial, Massage, ...",
      //                       style: TextStyle(fontSize: 12, color: ColorConstants.textColor),
      //                       overflow: TextOverflow.ellipsis,
      //                     ),
      //                     SizedBox(
      //                       height: 5,
      //                     ),
      //                     Text(
      //                       "Rating: $rating ($totalRate rates)",
      //                       style: TextStyle(fontSize: 12, color: ColorConstants.textColor),
      //                       overflow: TextOverflow.ellipsis,
      //                     ),
      //
      //                   ],
      //                 ),
      //               ),
      //             )
      //           ],
      //         ),
      //       ),
      //     ),
      //     SizedBox(height: 8,)
      //   ],
      // )

    );
  }
}
