import 'package:uuid/uuid.dart';

import 'basic_prop_register.dart';
import 'package:medios_basicos/constants.dart';

class Impresora extends BasicPropRegister {
  String _idImpresora;
  Uuid _randomId = Uuid();

  Impresora( String numInv, String marca, String modelo, String tipo, String detalle, String estado, String fecha)
      : super(numInv, marca, modelo, tipo, detalle,estado, fecha){
    this._idImpresora = _randomId.v1().toString().substring(24, 36);
  }

  Impresora.map(dynamic obj) : super.map(obj) {
    this._idImpresora = obj[CAMP_ID_IMPRESORA];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map[CAMP_ID_IMPRESORA] = this._idImpresora;
    map[CAMP_NUM_INVENTARIO] = numInv;
    map[CAMP_MARCA] = marca;
    map[CAMP_MODELO] = modelo;
    map[CAMP_TIPO] = tipo;
    map[CAMP_DETALLES] = detalle;
    map[CAMP_ESTADO] = estado;
    map[CAMP_FECHA] = fecha;
    return map;
  }

  Impresora.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this._idImpresora = map[CAMP_ID_IMPRESORA];
  }


  String get idImpresora => _idImpresora;

  set idImpresora(String value) {
    _idImpresora = value;
  }

  @override
  String toString() {
    return 'Impresora{_idImpresora: $_idImpresora, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle, _estado: $estado, _fecha: $fecha}';
  }
}