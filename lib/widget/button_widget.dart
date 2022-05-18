import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  var height;

  var width;

  ButtonWidget({
    
    Key key,
    
    @required this.text,
    @required this.onClicked,
    @required this.height,
   @required this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
          onTap: onClicked,
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(36),
              boxShadow: [
                BoxShadow(
                  color: Colors.deepOrange.withOpacity(0.5),
                  spreadRadius: 5,
                  blurRadius: 7,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: Center(
              child: Text(
                text,

                style: 
                 TextStyle(
                  color: Colors.green,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        );
  }
}
