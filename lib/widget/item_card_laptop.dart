import 'package:flutter/material.dart';
import 'package:medios_basicos/model/laptop_model.dart';

class ItemCardListLaptop extends StatefulWidget {
  final Laptop laptop;

  const ItemCardListLaptop({Key key, this.laptop}) : super(key: key);

  @override
  _ItemCardListLaptopState createState() => _ItemCardListLaptopState(laptop);
}

class _ItemCardListLaptopState extends State<ItemCardListLaptop> {
  Laptop laptop;

  _ItemCardListLaptopState(this.laptop);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
      child: InkWell(
        onTap: () {
          print('${laptop.numInv}');
        },
        child: Container(
          height: 115.0,
          child: Stack(
            children: <Widget>[
              Positioned(top: 10.0, left: 10.0, child: _bodyCard),
              Positioned(left: 0.0, child: _imageCard),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _bodyCard {
    return Container(
      width: 350.0,
      height: 115.0,
      child: Card(
        color: Colors.white30,
        //elevation: 4.0,
        //shape: CircleBorder(side: BorderSide(width: 15.0)),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            left: 64.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text('Marca: ${widget.laptop.marca}'),
              Text('Número de Inventario: ${widget.laptop.numInv}'),
              Text('Encargado: ${widget.laptop.encargado}'),
            ],
          ),
        ),
      ),
    );
  }

  Widget get _imageCard {
    return Container(
      decoration: BoxDecoration(
        color: Colors.orangeAccent,
        borderRadius: BorderRadius.circular(15.0),
      ),
      height: 95.0,
      width: 95.0,
      child: Center(
          child: Icon(
        Icons.laptop,
        size: 70,
        color: Colors.white,
      )),
    );
  }
}
