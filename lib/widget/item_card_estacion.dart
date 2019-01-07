import 'package:flutter/material.dart';
import 'package:medios_basicos/data/database_helper.dart';

import 'package:medios_basicos/util.dart';
import 'package:medios_basicos/constants.dart';

import 'package:medios_basicos/model/bocina_model.dart';
import 'package:medios_basicos/model/cpu_model.dart';
import 'package:medios_basicos/model/dvd_rw_model.dart';
import 'package:medios_basicos/model/estacion_model.dart';
import 'package:medios_basicos/model/hdd_model.dart';
import 'package:medios_basicos/model/impresora_model.dart';
import 'package:medios_basicos/model/monitor_model.dart';
import 'package:medios_basicos/model/motherboard_model.dart';
import 'package:medios_basicos/model/mouse_model.dart';
import 'package:medios_basicos/model/ram_model.dart';
import 'package:medios_basicos/model/scanner_model.dart';
import 'package:medios_basicos/model/teclado_model.dart';
import 'package:medios_basicos/model/unidad_central_model.dart';

import 'package:medios_basicos/widget/header_card_name.dart';
import 'package:medios_basicos/widget/item_card_bocina.dart';
import 'package:medios_basicos/widget/item_card_cpu.dart';
import 'package:medios_basicos/widget/item_card_dvd.dart';
import 'package:medios_basicos/widget/item_card_hdd.dart';
import 'package:medios_basicos/widget/item_card_impresora.dart';
import 'package:medios_basicos/widget/item_card_monitor.dart';
import 'package:medios_basicos/widget/item_card_motherboard.dart';
import 'package:medios_basicos/widget/item_card_mouse.dart';
import 'package:medios_basicos/widget/item_card_ram.dart';
import 'package:medios_basicos/widget/item_card_scanner.dart';
import 'package:medios_basicos/widget/item_card_teclado.dart';
import 'package:medios_basicos/widget/item_card_unidad_central.dart';
import 'package:medios_basicos/widget/text_data_base_item.dart';

//UnidadCentral _unidadCentral;
// = UnidadCentral.clienteLigero(
//    '53108135301',
//    '80313525235',
//    '${_motherboard.idMotherboard}',
//    '${_cpu.idCpu}',
//    '${_ram.idRam}',
//    '${_hdd.idHdd}',
//    //'${_dvdRw.idDvdRw}',
//    '15/5/1018');

//Motherboard _motherboard;
// = Motherboard(
//    '1681556168', 'Asus', 'As787', 'P-1155', 'D-88', 'Bien', '12/01/2018');

Cpu _cpu =
    Cpu('1681714168', 'Intel', 'III', 'Core-I3', 'D-88', 'Bien', '12/01/2018');

Ram _ram =
    Ram('1685528', 'Samsung', 'DDR-3', 'Rpp', 'SSS', 'Bien', '12/01/2018');

Hdd _hdd =
    Hdd('168163168', 'Segate', 'SATA-6', 'Rpp', 'SEE', 'Bien', '12/01/2018');

DvdRw _dvdRw;
//DvdRw('1681686168', 'LG', 'SATA', '32 RP', 'LLL', 'Bien', '12/01/2018');

Monitor _monitor = Monitor(
    '38133513', 'Hanel', 'H505', 'LCD', '15 pulgadas', 'Bien', '16/01/2018');
Teclado _teclado = Teclado(
    '38167513', 'Logitech', 'H505', 'USB', 'Negro', 'Bien', '12/12/2018');
Bocina _bocina = Bocina(
    '38234413', 'Sony', 'SONG', 'AC-DC', 'Blancas', 'Bien', '25/11/2018');
Mouse _mouse =
    Mouse('3822313', 'AOpen', 'AOp', 'PS-2', 'Blanco', 'Bien', '20/01/2018');
Impresora _impresora = Impresora(
    '3823233', 'HP', '90PH', 'Tonel', 'Blancas', 'Bien', '20/05/2018');
Scanner _scanner = Scanner(
    '38234413', 'Hp', 'HP2500', '2001', 'Blancas', 'Bien', '25/09/2018');

const double heightCard = 235.0;
const double heightCardEsta = 100.0;
const double heightCardUc = 155.0;

Future<Estacion> getEstacionFromDB() async {
  var _dbHelper = DBHelper();

  return await Estacion.getEstacion(_dbHelper.db, 'bb8c19086e49');
}

//Future<UnidadCentral> getUnidadCentralFromDB(Future<String> idUnidadCentral) async {
//  var _dbHelper = DBHelper();
//  String id = await idUnidadCentral;
//  print('ID_UNIDAD CENTRAL: $id');
//  return await UnidadCentral.getUnidadCentral(_dbHelper.db, id);
//}


class ItemCardListEstacion extends StatefulWidget {
  final Future<Estacion> estacion;

  const ItemCardListEstacion({Key key, this.estacion}) : super(key: key);

  @override
  _ItemCardListEstacionState createState() =>
      _ItemCardListEstacionState(estacion);
}

class _ItemCardListEstacionState extends State<ItemCardListEstacion> {
  Future<Estacion> estacion;
  UnidadCentral unidadCentral;

  double allHeightCard = 0.0;

  _ItemCardListEstacionState(this.estacion);

  @override
  void initState() {
    estacion = getEstacionFromDB();
    initShearch();
  }

  initShearch() async {
    unidadCentral = await getUnidadCentralFromDB(estacion.then((est) => est.idUnidadCentral));
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
        child: ListView.builder(
            itemCount: 1,
            itemBuilder: (context, index) {
              return Container(
                height: 2700.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                        top: _sizeHeight(ESTACION),
                        left: 0.0,
                        child: _bodyCard),
                    Positioned(
                        top: _sizeHeight(CONST_UNIDAD_CENTRAL),
                        left: 0.0,
                        child: ItemCardUnidadCentral(
                          idUnidadCentral:
                              estacion.then((est) => est.idUnidadCentral),
                        )),
                    Positioned(
                        left: 0.0,
                        top: _sizeHeight(CONST_MOTHERBOARD),
                        child: ItemCardMotherboard(
                          idMotherboard:
                              unidadCentral.idMotherboard),
                        ),
                    Positioned(
                        top: _sizeHeight(CONST_CPU),
                        left: 0.0,
                        child: ItemCardCpu(_cpu)),
                    Positioned(
                        top: _sizeHeight(CONST_RAM),
                        left: 0.0,
                        child: ItemCardRam(_ram)),
                    Positioned(
                        top: _sizeHeight(CONST_HDD),
                        left: 0.0,
                        child: ItemCardHdd(_hdd)),
                    _dvdRw != null
                        ? Positioned(
                            left: 0.0,
                            top: _sizeHeight(CONST_DVD_RW),
                            child: ItemCardDvdRw(_dvdRw))
                        : Container(),
                    Positioned(
                        top: _sizeHeight(CONST_MONITOR),
                        left: 0.0,
                        child: ItemCardMonitor(_monitor)),
                    Positioned(
                        top: _sizeHeight(CONST_TECLADO),
                        left: 0.0,
                        child: ItemCardTeclado(_teclado)),
                    Positioned(
                        top: _sizeHeight(CONST_BOCINA),
                        left: 0.0,
                        child: ItemCardBocina(_bocina)),
                    Positioned(
                        top: _sizeHeight(CONST_MOUSE),
                        left: 0.0,
                        child: ItemCardMouse(_mouse)),
                    Positioned(
                        top: _sizeHeight(CONST_IMPRESORA),
                        left: 0.0,
                        child: ItemCardImpresora(_impresora)),
                    Positioned(
                        top: _sizeHeight(CONST_SCANNER),
                        left: 0.0,
                        child: ItemCardScanner(_scanner)),
                  ],
                ),
              );
            }));
  }

  double _sizeHeight(String card) {
    switch (card) {
      case ESTACION:
        if (allHeightCard == 0.0) {
          return allHeightCard;
        }
        break;

      case CONST_UNIDAD_CENTRAL:
        return allHeightCard = heightCardEsta;

      case CONST_MOTHERBOARD:
        return allHeightCard = allHeightCard + heightCardUc;

      case CONST_CPU:
        return allHeightCard = allHeightCard + heightCard;

      case CONST_RAM:
        return allHeightCard = allHeightCard + heightCard;

      case CONST_HDD:
        return allHeightCard = allHeightCard + heightCard;

      case CONST_DVD_RW:
        return allHeightCard = allHeightCard + heightCard;

      case CONST_MONITOR:
        return allHeightCard = allHeightCard + heightCard;

      case CONST_TECLADO:
        return allHeightCard = allHeightCard + heightCard;

      case CONST_BOCINA:
        return allHeightCard = allHeightCard + heightCard;

      case CONST_MOUSE:
        return allHeightCard = allHeightCard + heightCard;

      case CONST_IMPRESORA:
        return allHeightCard = allHeightCard + heightCard;

      case CONST_SCANNER:
        return allHeightCard = allHeightCard + heightCard;
//
//      default:
//        return 0.0;
    }
  }

  Widget get _bodyCard {
    return Container(
      height: 140.0,
      width: 370.0,
      //color: Colors.deepPurple,
      child: Stack(children: <Widget>[
        Positioned(
          top: 20.0,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
            ),
            width: 370.0,
            //Crear MediaQuery para tomar el ancho de la pantalla
            height: 120.0,
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
                  children: <Widget>[
                    FutureBuilder<Estacion>(
                        future: getEstacionFromDB(),
                        builder: (contex, snapshot) {
                          if (snapshot.data != null) {
                            if (snapshot.hasData != null) {
                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 4.0),
                                    child: TextDataBaseItem(
                                        AREA_OFICINA, snapshot.data.area),
                                  ),
                                  Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 8.0),
                                      child: TextDataBaseItem(
                                          ENCARGADO, snapshot.data.encargado)),
                                  //Expanded(child: Container()),
                                ],
                              );
                            }
                          }
                          return Container(
                            alignment: AlignmentDirectional.center,
                            child: CircularProgressIndicator(),
                          );
                        }),
                  ],
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 50.0,
          child: FutureBuilder<Estacion>(
              future: getEstacionFromDB(),
              builder: (contex, snapshot) {
                if (snapshot.data != null) {
                  if (snapshot.hasData != null) {
                    return HeaderCardName(
                        snapshot.data.name, gradientBlueColor);
                  }
                }
                return Container(
                  alignment: AlignmentDirectional.center,
                  child: CircularProgressIndicator(),
                );
              }),
        ),
      ]),
    );
  }
}
