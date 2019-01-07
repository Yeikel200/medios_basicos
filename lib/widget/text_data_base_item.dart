import 'package:flutter/material.dart';
import 'package:medios_basicos/util.dart';

class TextDataBaseItem extends StatefulWidget {
  String primaryText, secondaryText;

  TextDataBaseItem(this.primaryText, this.secondaryText);

  @override
  _TextDataBaseItemState createState() => _TextDataBaseItemState(
      primaryText: primaryText, secondaryText: secondaryText);
}

class _TextDataBaseItemState extends State<TextDataBaseItem> {
  String primaryText, secondaryText;

  _TextDataBaseItemState({
    @required this.primaryText,
    @required this.secondaryText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(
        '$primaryText: ',
        style: primaryTextStyle(),
      ),
      Text(
        '$secondaryText',
        style: secondaryTextStyle(),
      ),
    ]);
  }
}