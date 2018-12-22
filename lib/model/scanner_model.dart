import 'basic_prop_register.dart';

import 'package:uuid/uuid.dart';
import 'package:medios_basicos/constants.dart';

class Scanner extends BasicPropRegister {
  String _idScanner;

  Uuid _randomId = Uuid();

  Scanner(
      String numInv, String marca, String modelo, String tipo, String detalle,String estado, String fecha)
      : super(numInv, marca, modelo, tipo, detalle, estado, fecha) {
    this._idScanner = _randomId.v1().toString().substring(24, 36);
  }

  Scanner.map(dynamic obj) : super.map(obj) {
    this._idScanner = obj[CAMP_ID_SCANNER];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map[CAMP_ID_SCANNER] = this._idScanner;
    map[CAMP_NUM_INVENTARIO] = numInv;
    map[CAMP_MARCA] = marca;
    map[CAMP_MODELO] = modelo;
    map[CAMP_TIPO] = tipo;
    map[CAMP_DETALLES] = detalle;
    map[CAMP_ESTADO] = estado;
    map[CAMP_FECHA] = fecha;
    return map;
  }

  Scanner.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this._idScanner = map[CAMP_ID_SCANNER];
  }


  String get idScanner => _idScanner;

  set idScanner(String value) {
    _idScanner = value;
  }

  @override
  String toString() {
    return 'Scanner{_idScanner: $_idScanner, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle, _estado: $estado, _fecha: $fecha}';
  }
}
