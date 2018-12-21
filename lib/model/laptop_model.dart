import 'package:uuid/uuid.dart';

import 'basic_prop_register.dart';
import 'package:medios_basicos/constants.dart';

class Laptop extends BasicPropRegister {
  String _idLaptop,
  _encargado;
  Uuid _randomId = Uuid();

  Laptop(String numInv, String marca, String modelo, String tipo, String detalle, String estado, this._encargado, String fecha)
      : super(numInv, marca, modelo, tipo, detalle, estado, fecha){
    //this._idLsptop = _randomId.v1().toString();
    this._idLaptop = _randomId.v1().toString().substring(24, 36);
    //6009d8e0-e440-11e8-e459-ef36ab52cf1b

  }

  Laptop.map(dynamic obj) : super.map(obj){
    this._idLaptop = obj[CAMP_ID_LAPTOP];
    this._encargado = obj[CAMP_ENCARGADO];
  }

  Map<String, dynamic> toMap(){
    var map = Map<String, dynamic>();
    map[CAMP_ID_LAPTOP] = this._idLaptop;
    map[CAMP_NUM_INVENTARIO] = numInv;
    map[CAMP_MARCA] = marca;
    map[CAMP_MODELO] = modelo;
    map[CAMP_TIPO] = tipo;
    map[CAMP_DETALLES] = detalle;
    map[CAMP_ESTADO] = estado;
    map[CAMP_ENCARGADO] = this._encargado;
    map[CAMP_FECHA] = fecha;
  }

  Laptop.fromMap(Map<String, dynamic> map) : super.fromMap(map) {
    this._idLaptop = map[CAMP_ID_LAPTOP];
    this._encargado = map[CAMP_ENCARGADO];
  }

  get encargado => _encargado;

  set encargado(value) {
    _encargado = value;
  }

  String get idLaptop => _idLaptop;

  set idLaptop(String value) {
    _idLaptop = value;
  }

  @override
  String toString() {
    return 'Laptop{_idLaptop: $_idLaptop, _encargado: $_encargado, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle, _estado: $estado, _fecha: $fecha}';
  }


}