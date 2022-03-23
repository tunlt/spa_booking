import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
        //margin: EdgeInsets.symmetric(vertical: size.height*0.04),
        height: size.height*0.08,
        width: size.width * 0.8,
        child: Row(
          children: <Widget>[
            buildDivider(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 14),
              child: Text(
                "OR",
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
            ),
            buildDivider(),
          ],
        ));
  }
  Expanded buildDivider(){
    return  const Expanded(
      child: Divider(
        color: Colors.white,

      ),
    );
  }
}