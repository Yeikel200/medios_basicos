import 'package:flutter/material.dart';

import 'package:medios_basicos/data/database_helper.dart';
import 'package:medios_basicos/model/laptop_model.dart';
import 'package:medios_basicos/widget/item_card_estacion.dart';

Future<List<Laptop>> getLaptopFromDB() async {
  var _dbHelper = DBHelper();
  Future<List<Laptop>> listLaptop = Laptop.getAllLaptops(_dbHelper.db);
  return listLaptop;
}

class EstacionList extends StatefulWidget {

  EstacionList({Key key }) : super(key: key);

  @override
  _EstacionListState createState() => _EstacionListState();
}

class _EstacionListState extends State<EstacionList> {

  _EstacionListState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles '),
      ),
      body: ItemCardListEstacion(),
//
    );
  }
}
