import 'package:flutter/material.dart';
import 'package:medios_basicos/model/laptop_model.dart';
import 'package:medios_basicos/pages/laptop_list.dart';
import 'package:medios_basicos/pages/form_estation.dart';
import 'package:medios_basicos/widget/item_card.dart';
import 'package:medios_basicos/home.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var myLaptop = Laptop('686468464', 'TOSHIBA', 'Satellite', 'Moderna', '17 pulgadas', 'Yeikel Uriarte');

    return MaterialApp(
      title: 'Pantalla de pruebas',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(title:'Inicio'),
      // SelectionComponentPC(),
//      home: Scaffold(
//        appBar: AppBar(
//          title: Text('Pantalla de pruebas'),
//        ),
//        body: LaptopList(listLaptop:
//          new List<Laptop>.generate(50,
//              (i) => new Laptop('${i*5353347}', '${i*154617}', 'TOSHIBA', 'Satellite', 'Moderna', '17 pulgadas', 'Yeikel Uriarte')
//          )
//          ,),
//      ),
      //home: MyHomePage(title:'Home'),
    );
  }
}
