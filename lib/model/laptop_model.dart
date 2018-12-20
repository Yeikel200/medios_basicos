import 'package:uuid/uuid.dart';

import 'basic_prop_register.dart';

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