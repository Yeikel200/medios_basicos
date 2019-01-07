import 'package:flutter/material.dart';
import 'package:medios_basicos/model/memoria_model.dart';

class ItemCardListMemoria extends StatefulWidget {
  final Memoria memoria;

  const ItemCardListMemoria({Key key, this.memoria}) : super(key: key);

  @override
  _ItemCardListMemoriaState createState() => _ItemCardListMemoriaState(memoria);
}

class _ItemCardListMemoriaState extends State<ItemCardListMemoria> {
  Memoria memoria;

  _ItemCardListMemoriaState(this.memoria);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: InkWell(
        onTap: () {
          print('${memoria.numInv}');
        },
        child: Container(
          height: 125.0,
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
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(12.0),
    ),
      width: 350.0,
      height: 115.0,
      child: Card(
        color: Colors.orange[100],
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        )),
        //elevation: 4.0,
        //shape: CircleBorder(side: BorderSide(width: 15.0)),
        child: Padding(
          padding: const EdgeInsets.only(
            //top: 8.0,
            bottom: 8.0,
            left: 64.0,
          ),
          child: Column(
           // crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 36.0),
                child: Row(children: [
                  Text(
                    'Marca: ',
                    style: primaryTextStyle(),
                  ),
                  Text(
                    '${widget.memoria.marca}',
                    style: secondaryTextStyle(),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 36.0),
                child: Row(children: [
                  Text(
                    'Nº de Inventario: ',
                    style: primaryTextStyle(),
                  ),
                  Text(
                    '${widget.memoria.numInv}',
                    style: secondaryTextStyle(),
                  ),
                ]),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 36.0),
                child: Row(children: [
                  Text(
                    'Encargado: ',
                    style: primaryTextStyle(),
                  ),
                  Text(
                    '${widget.memoria.encargadoMemoria}',
                    style: secondaryTextStyle(),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextStyle primaryTextStyle() {
    return TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  );
  }

  TextStyle secondaryTextStyle() {
    return TextStyle(
                    color: Colors.black54,
                    fontWeight: FontWeight.w300,
                    fontSize: 16.0,
                  );
  }

  Widget get _imageCard {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
        Colors.orange[500],
        Colors.orange[400],
        Colors.orange[200],
        Colors.orange[100],
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(12.0),
      ),
      height: 105.0,
      width: 105.0,
      child: Center(
          child: Icon(
        Icons.sd_storage,
        size: 60,
        color: Colors.white,
      )),
    );
  }
}
