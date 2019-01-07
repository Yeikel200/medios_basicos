import 'package:flutter/material.dart';

import 'package:medios_basicos/constants.dart';
import 'package:medios_basicos/model/cpu_model.dart';
import 'package:medios_basicos/util.dart';
import 'package:medios_basicos/widget/header_right_card.dart';
import 'package:medios_basicos/widget/text_data_base_item.dart';

class ItemCardCpu extends StatelessWidget {

  Cpu cpu;

  ItemCardCpu(this.cpu);

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
                    top: 25.0,
                    bottom: 15.0,
                    left: 25.0,
                  ),
                  child: Column(
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: TextDataBaseItem(NUM_INVENTARIO, '${cpu.numInv}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: TextDataBaseItem(MARCA, '${cpu.marca}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: TextDataBaseItem(MODELO, '${cpu.modelo}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: TextDataBaseItem(TIPO, '${cpu.tipo}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: TextDataBaseItem(DETALLES, '${cpu.detalle}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: TextDataBaseItem(ESTADO, '${cpu.estado}'),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 4.0),
                        child: TextDataBaseItem(CONST_FECHA, '${cpu.fecha}'),
                      ),
                      Expanded(child: Container())
                    ],
                  ),
                ),
              ),
            )),
        Positioned(
          right: 0.0,
          child: HeaderRight(
            headerName: CONST_CPU,
            iconData: Icons.straighten,
            gradientColor: gradientGreemColor,
          ),
        ),
      ]),
    );
  }
}