import 'package:flutter/material.dart';
import 'package:medios_basicos/model/laptop_model.dart';
import 'package:medios_basicos/widget/item_card.dart';


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
      body: ListView.builder(
        itemCount: listLaptop.length,
        itemBuilder: (context, index) {
          return ItemCardList(laptop: listLaptop[index],)  ;
        },
      ),
    );
  }
}
