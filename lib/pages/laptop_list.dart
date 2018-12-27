import 'package:flutter/material.dart';
import 'package:medios_basicos/data/database_helper.dart';
import 'package:medios_basicos/model/laptop_model.dart';
import 'package:medios_basicos/widget/item_card_laptop.dart';
import 'package:sqflite/sqflite.dart';

Future<List<Laptop>> getLaptopFromDB() async {
  var _dbHelper = DBHelper();
  Future<List<Laptop>> listLaptop = Laptop.getAllLaptops(_dbHelper.db);
  return listLaptop;
}

class LaptopList extends StatefulWidget {

  LaptopList({Key key }) : super(key: key);

  @override
  _LaptopListState createState() => _LaptopListState();
}

class _LaptopListState extends State<LaptopList> {

  _LaptopListState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Laptops'),
      ),
      body: Container(
        padding: EdgeInsets.all(4.0),
        child: FutureBuilder<List<Laptop>>(
          future: getLaptopFromDB(),
          builder: (contex, snapshot) {
            if (snapshot.data != null) {
              if (snapshot.hasData != null) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return ItemCardListLaptop(
                        laptop: snapshot.data[index],
                      );
                    });
              }
            }

            return Container(
              alignment: AlignmentDirectional.center,
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('Lista de Laptops'),
//      ),
//      body: ListView.builder(
//        itemCount: listLaptop.length,
//        itemBuilder: (context, index) {
//          return ItemCardList(laptop: listLaptop[index],)  ;
//        },
//      ),
//    );
//  }
}
