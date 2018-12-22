import 'basic_prop_register.dart';
import 'package:uuid/uuid.dart';

import 'package:medios_basicos/constants.dart';

class Monitor extends BasicPropRegister {
  String _idMonitor;

  Uuid _randomId = new Uuid();

  Monitor (String numInv, String marca, String modelo, String tipo, String detalle, String estado, String fecha)
      :  super(numInv, marca, modelo, tipo, detalle, estado, fecha){
    this._idMonitor = _randomId.v1().toString().substring(24, 36);
  }


  Monitor.map(dynamic obj) : super.map(obj) {
    this._idMonitor = obj[CAMP_ID_MONITOR];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map[CAMP_ID_MONITOR] = this._idMonitor;
    map[CAMP_NUM_INVENTARIO] = numInv;
    map[CAMP_MARCA] = marca;
    map[CAMP_MODELO] = modelo;
    map[CAMP_TIPO] = tipo;
    map[CAMP_DETALLES] = detalle;
    map[CAMP_ESTADO] = estado;
    map[CAMP_FECHA] = fecha;
  }

  Monitor.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this._idMonitor = map[CAMP_ID_MONITOR];
  }


  String get idMonitor => _idMonitor;

  set idMonitor(String value) {
    _idMonitor = value;
  }

  @override
  String toString() {
    return 'Monitor{_idMonitor: $_idMonitor, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle, _estado: $estado, _fecha: $fecha}';
  }


}