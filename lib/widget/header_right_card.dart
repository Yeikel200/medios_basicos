import 'package:flutter/material.dart';
import 'package:medios_basicos/widget/header_card_name.dart';

class HeaderRight extends StatelessWidget {
  String headerName;
  IconData iconData;
  LinearGradient gradientColor;

  HeaderRight(
      {@required this.headerName,
        @required this.iconData,
        @required this.gradientColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: 280.0,
      height: 80.0,
      child: Stack(
        children: <Widget>[
          Positioned(
              right: 60.0,
              top: 20.0,
              child: HeaderCardName(headerName, gradientColor)),
          Positioned(
            right: 0.0,
            top: 2.0,
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(35.0),
                  )),
              child: CircleAvatar(
                  backgroundColor: Colors.green[400],
                  radius: 35,
                  child: Icon(
                    iconData,
                    color: Colors.white,
                    size: 35,
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
