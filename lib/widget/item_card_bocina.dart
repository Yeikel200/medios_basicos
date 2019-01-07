import 'package:flutter/material.dart';

import 'package:medios_basicos/constants.dart';
import 'package:medios_basicos/model/bocina_model.dart';
import 'package:medios_basicos/util.dart';
import 'package:medios_basicos/widget/header_left_card.dart';
import 'package:medios_basicos/widget/text_data_base_item.dart';

class ItemCardBocina extends StatelessWidget {

  Bocina bocina;

  ItemCardBocina(this.bocina);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 280.0,
      width: 370.0,
      child: Stack(children: <Widget>[
        Positioned(
            top: 45.0,
            child: Container(
              height: 230.0,
              width: 370.0,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(8.0),
              ),
              child: Card(
                color: Colors.blue[100],
                elevation: 4.0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(8.0),
                    )),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 30.0,
                    bottom: 15.0,
                    left: 25.0,
                  ),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: TextDataBaseItem(NUM_INVENTARIO, '${bocina.numInv}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: TextDataBaseItem(MARCA, '${bocina.marca}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: TextDataBaseItem(MODELO, '${bocina.modelo}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: TextDataBaseItem(TIPO, '${bocina.tipo}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: TextDataBaseItem(DETALLES, '${bocina.detalle}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: TextDataBaseItem(ESTADO, '${bocina.estado}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: TextDataBaseItem(CONST_FECHA, '${bocina.fecha}'),
                      ),
                      Expanded(child: Container())
                    ],
                  ),
                ),
              ),
            )),
        Positioned(
          left: 0.0,
          child: HeaderLeft(
            headerName: CONST_BOCINA,
            iconData: Icons.speaker,
            gradientColor: gradientBlueColor,
          ),
        ),
      ]),
    );
  }
}