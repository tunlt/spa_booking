import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spa_booking/utils/constants.dart';

class ReviewBox extends StatelessWidget {
  String name;
  String cmt;
  String date;
  int rate;

  ReviewBox(
      {required this.name, required this.cmt, required this.date, required this.rate});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
        padding: EdgeInsets.only(left: 10, right: 10, bottom:12),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.red[100],
          borderRadius: BorderRadius.all(Radius.circular(10))
        ),
        child: Padding(padding: EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ClipOval(
                      child: Image.asset(StrConstants.imgPath+"reviewer.png", width: size.width * 0.12, height: size.width * 0.12,fit: BoxFit.cover,),
                    ),
                    SizedBox(width: 8,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          name,
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          date,
                          style: TextStyle(
                              fontSize: 12,fontStyle: FontStyle.italic
                          ),
                        )
                      ],
                    )
                  ],
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 1; i <= rate; i++)
                      Image.asset(
                        StrConstants.iconPath+"starColor.png",
                        width: size.width * 0.04,
                      ),
                    for (int i = 1; i <= 5 - rate; i++)
                      Image.asset(
                        StrConstants.iconPath+"starNoColor.png",
                        width: size.width * 0.04,
                      )
                  ],
                )
              ],
            ),
            SizedBox(height: 5,),
            Text(
              cmt,
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
        ),
      ),
    );
  }
}
