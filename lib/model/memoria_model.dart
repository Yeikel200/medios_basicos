import 'package:uuid/uuid.dart';

import 'basic_prop_register.dart';
import 'package:medios_basicos/constants.dart';

class Memoria extends BasicPropRegister {
  String _idMemoria, _encargadoMemoria;
  Uuid _randomId = Uuid();

  Memoria( String numInv, String marca, String modelo, String tipo, String detalle, String estado, this._encargadoMemoria, String fecha)
      : super(numInv, marca, modelo, tipo, detalle, estado, fecha){
    this._idMemoria = _randomId.v1().toString().substring(24, 36);

  }

  Memoria.map(dynamic obj) : super.map(obj) {
    this._idMemoria = obj[CAMP_ID_MEMORIA];
    this._encargadoMemoria = obj[CAMP_ENCARGADO];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map[CAMP_ID_TABLET] = this._idMemoria;
    map[CAMP_NUM_INVENTARIO] = numInv;
    map[CAMP_MARCA] = marca;
    map[CAMP_MODELO] = modelo;
    map[CAMP_TIPO] = tipo;
    map[CAMP_DETALLES] = detalle;
    map[CAMP_ESTADO] = estado;
    map[CAMP_ENCARGADO] = this._encargadoMemoria;
    map[CAMP_FECHA] = fecha;
  }

  Memoria.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this._idMemoria = map[CAMP_ID_MEMORIA];
    this._encargadoMemoria = map[CAMP_ENCARGADO];
  }

  get encargadoMemoria => _encargadoMemoria;

  set encargadoMemoria(value) {
    _encargadoMemoria = value;
  }

  String get idMemoria => _idMemoria;

  set idMemoria(String value) {
    _idMemoria = value;
  }

  @override
  String toString() {
    return 'Memoria{_idMemoria: $_idMemoria, _encargadoMemoria: $_encargadoMemoria, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle, _estado: $estado, _fecha: $fecha}';
  }


}