import 'package:flutter/material.dart';

class ThemeHelper{
  InputDecoration textInputDecoration([String lableText="", String hintText =""]){
    return InputDecoration(
      labelText: lableText.toUpperCase(),
      labelStyle: TextStyle(fontSize: 15, color: Colors.blueGrey[800]),
      hintText: hintText,
      fillColor: Colors.red[200],
      filled: true,
      contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red.shade300,style: BorderStyle.solid)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red.shade300, style: BorderStyle.solid)),
    );
  }
  InputDecoration textInputPasswordDecoration([String lableText="", String hintText ="", bool _isObscure = false]){
    return InputDecoration(
      labelText: lableText.toUpperCase(),
      hintText: hintText,
      labelStyle: TextStyle(fontSize: 15, color: Colors.blueGrey[800]),
      fillColor: Colors.red[200],
      filled: true,
       contentPadding: EdgeInsets.fromLTRB(20, 10, 20, 10),
     focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red.shade300,style: BorderStyle.solid)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(100.0), borderSide: BorderSide(color: Colors.red.shade300, style: BorderStyle.solid)),
      suffixIcon: IconButton(
                    icon: Icon(
                        _isObscure ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {                     
                        _isObscure = !_isObscure;                   
                    }),
     );
  }
  
}