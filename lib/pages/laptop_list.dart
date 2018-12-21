import 'package:flutter/material.dart';
import 'package:medios_basicos/data/database_helper.dart';
import 'package:medios_basicos/model/laptop_model.dart';
import 'package:medios_basicos/widget/item_card.dart';

Future<List<Laptop>> getLaptopFromDB() async {
  var dbHelper = DBHelper();
  Future<List<Laptop>> listLaptop = dbHelper.getAllLaptops();
  return listLaptop;
}

class LaptopList extends StatefulWidget {
  final List<Laptop> listLaptop;

  LaptopList({Key key, @required this.listLaptop}) : super(key: key);

  @override
  _LaptopListState createState() => _LaptopListState(listLaptop);
}

class _LaptopListState extends State<LaptopList> {
  final List<Laptop> listLaptop;

  _LaptopListState(this.listLaptop);

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
                      return ItemCardList(
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
