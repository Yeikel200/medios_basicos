import 'package:flutter/material.dart';
import 'package:medios_basicos/util.dart';

class HeaderCardName extends StatelessWidget {
  String nameHeader;
  LinearGradient gradientColor;

  HeaderCardName(this.nameHeader, this.gradientColor);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      color: Colors.orange[100],
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          )),
      child: Container(
        //width: 230.0,
        decoration: BoxDecoration(
          gradient: gradientColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                child: Text(
                  '$nameHeader',
                  textAlign: TextAlign.center,
                  style: primaryTextStyle(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: InkWell(
                  onTap: () {
                    print('Editando');
                  },
                  child: Icon(
                    Icons.edit,
                    size: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}