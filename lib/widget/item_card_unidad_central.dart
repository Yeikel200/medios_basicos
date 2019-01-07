import 'package:flutter/material.dart';
import 'package:medios_basicos/constants.dart';
import 'package:medios_basicos/data/database_helper.dart';
import 'package:medios_basicos/model/unidad_central_model.dart';
import 'package:medios_basicos/util.dart';
import 'package:medios_basicos/widget/header_left_card.dart';
import 'package:medios_basicos/widget/text_data_base_item.dart';

Future<UnidadCentral> getUnidadCentralFromDB(Future<String> idUnidadCentral) async {
  var _dbHelper = DBHelper();
  String id = await idUnidadCentral;
  print('ID_UNIDAD CENTRAL: $id');
  return await UnidadCentral.getUnidadCentral(_dbHelper.db, id);
}

class ItemCardUnidadCentral extends StatefulWidget {
  Future<String> idUnidadCentral;

  ItemCardUnidadCentral({@required this.idUnidadCentral});

  @override
  _ItemCardUnidadCentralState createState() => _ItemCardUnidadCentralState(this.idUnidadCentral);
}

class _ItemCardUnidadCentralState extends State<ItemCardUnidadCentral> {

  Future<String> idUnidadCentral;
  UnidadCentral unidadCentral;

  _ItemCardUnidadCentralState(this.idUnidadCentral);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: 200.0,
      width: 370.0,
      child: Stack(children: <Widget>[
        Positioned(
            top: 45.0,
            child: Container(
              height: 150.0,
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
                  child: FutureBuilder<UnidadCentral>(
                      future: getUnidadCentralFromDB(idUnidadCentral),
                      builder: (contex, snapshot) {
                        if (snapshot.data != null) {
                          if (snapshot.hasData != null) {
                            return Column(
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: TextDataBaseItem(NUM_INVENTARIO, '${snapshot.data.numInv}'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 4.0),
                                  child: TextDataBaseItem(NUM_SELLO, '${snapshot.data.sello}'),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: TextDataBaseItem(CONST_FECHA, '${snapshot.data.fecha}'),
                                ),
                                Expanded(child: Container())
                              ],
                            );
                          }
                        }
                        return Container(
                          alignment: AlignmentDirectional.center,
                          child: CircularProgressIndicator(),
                        );
                      }),

                ),
              ),
            )),
        Positioned(
          child: HeaderLeft(
            headerName: CONST_UNIDAD_CENTRAL,
            iconData: Icons.crop_portrait,
            gradientColor: gradientGreemColor,
          ),
          left: 0.0,
        ),
      ]),
    );
  }
}
