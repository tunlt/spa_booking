import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Component {
  static Widget getActionStepButton(BuildContext context,bool availableBack ,Function() function) {
    return Container(
      child: Column(
        children: [

          SizedBox(height: 20,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if(availableBack)
                RaisedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  color: Colors.red[300],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Text(
                    "BACK",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                    ),
                  ),
                )
              else
                Container(),

              RaisedButton(
                onPressed: function,
                color: Colors.red[300],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "NEXT",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  static Widget getActionStepAnotherButton(
      BuildContext context, Function() function) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RaisedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          color: Colors.red[300],
          child: Text(
            "BACK",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        RaisedButton(
          onPressed: function,
          color: Colors.red[300],
          child: Text(
            "NEXT",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
