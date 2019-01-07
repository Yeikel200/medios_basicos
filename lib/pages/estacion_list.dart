import 'package:flutter/material.dart';

import 'package:medios_basicos/data/database_helper.dart';
import 'package:medios_basicos/model/estacion_model.dart';
import 'package:medios_basicos/widget/item_card_estacion.dart';

//Future<Estacion> getEstacionFromDB() async {
//  var _dbHelper = DBHelper();
//  return Estacion.getEstacion(_dbHelper.db, 'b1031905da5a');
//}

class EstacionList extends StatefulWidget {

  EstacionList({Key key }) : super(key: key);

  @override
  _EstacionListState createState() => _EstacionListState();
}

class _EstacionListState extends State<EstacionList> {

  _EstacionListState();

  //ID ESTACION 5fff023e64ba - 77e57749cf9e - b1031905da5a

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles '),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.bug_report), onPressed: (){
            var dbHelp = DBHelper();
            Estacion.getEstacion(dbHelp.db, 'b1031905da5a');
          })
        ],
      ),
      body: ItemCardListEstacion(),
//
    );
  }
}
