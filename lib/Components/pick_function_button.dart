import 'package:flutter/material.dart';
import 'package:spa_booking/Screens/Appointment/appointment_upcoming_screen.dart';
import 'package:spa_booking/utils/constants.dart';
class PickFuntionButton extends StatefulWidget{
  String text;
  String selected;
  Function() func;

  double sizeButton;
  PickFuntionButton({required this.text, required this.selected, required this.func,required this.sizeButton});
  @override
  State<StatefulWidget> createState() {
    return _PickFuntionButton();
  }

}
class _PickFuntionButton extends State<PickFuntionButton>{
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;

      if (widget.selected != widget.text) {
        return Container(
            width: widget.sizeButton,
            height: 35,
            child: RaisedButton(
              onPressed: widget.func,
              child: Text(widget.text),
              textColor: ColorConstants.textColorBold,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Color.fromRGBO(237, 153, 153, 1))),
            ));
      } else {
        return Container(
          width: widget.sizeButton,
          height: 35,
          child: RaisedButton(
            onPressed: null,
            child: Text(widget.text),
            disabledTextColor: Colors.white,
            disabledColor: ColorConstants.textColorBold,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                side: BorderSide(color: Color.fromRGBO(237, 153, 153, 1))),
          ),
        );
      }
    }
}


