import 'package:flutter/material.dart';
import 'package:medios_basicos/model/laptop_model.dart';
import 'package:medios_basicos/model/tablet_model.dart';
import 'package:medios_basicos/model/memoria_model.dart';

class ItemCardListTablet extends StatefulWidget {
  final Tablet tablet;


  const ItemCardListTablet({Key key, this.tablet}) : super(key: key);

  @override
  _ItemCardListTabletState createState() => _ItemCardListTabletState(tablet);
}

class _ItemCardListTabletState extends State<ItemCardListTablet> {
  Tablet tablet;


  _ItemCardListTabletState(this.tablet);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal:8.0,
        vertical: 8.0
      ),
      child: InkWell(
        onTap: (){print('${tablet.numInv}');},
        child: Container(
          height: 115.0,
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: 10.0,
                  left: 10.0,
                  child: _bodyCard
              ),
              Positioned(
                left: 0.0,
                  child: _imageCard
              ),
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
              Text('Marca: ${widget.tablet.marca}'),
              Text('Número de Inventario: ${widget.tablet.numInv}'),
              Text('Encargado: ${widget.tablet.encargado}'),
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
        Icons.tablet_android,
        size: 70,
        color: Colors.white,
      )),
    );
  }
}
