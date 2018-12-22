import 'basic_prop_register.dart';
import 'package:uuid/uuid.dart';
import 'package:medios_basicos/constants.dart';

class Hdd extends BasicPropRegister {
  String _idHdd;
  Uuid _randomId = Uuid();

  Hdd( String numInv, String marca, String modelo, String tipo, String detalle,String estado, String fecha)
      : super(numInv, marca, modelo, tipo, detalle,estado, fecha){
    this._idHdd = _randomId.v1().toString().substring(24, 36);
  }

  Hdd.map(dynamic obj) : super.map(obj) {
    this._idHdd = obj[CAMP_ID_HDD];
  }

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>();
    map[CAMP_ID_HDD] = this._idHdd;
    map[CAMP_NUM_INVENTARIO] = numInv;
    map[CAMP_MARCA] = marca;
    map[CAMP_MODELO] = modelo;
    map[CAMP_TIPO] = tipo;
    map[CAMP_DETALLES] = detalle;
    map[CAMP_ESTADO] = estado;
    map[CAMP_FECHA] = fecha;
    return map;
  }

  Hdd.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this._idHdd = map[CAMP_ID_HDD];
  }


  String get idHdd => _idHdd;

  set idHdd(String value) {
    _idHdd = value;
  }

  @override
  String toString() {
    return 'Hdd{_idHdd: $_idHdd,_numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle, _estado: $estado, _fecha: $fecha}';
  }


}