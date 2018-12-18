import 'package:uuid/uuid.dart';

import 'basic_prop_register.dart';

class Laptop extends BasicPropRegister {
  String _idLsptop,
  _encargado;
  Uuid _randomId = Uuid();

  Laptop(String numInv, String marca, String modelo, String tipo, String detalle, this._encargado)
      : super(numInv, marca, modelo, tipo, detalle){
    //this._idLsptop = _randomId.v1().toString();
    this._idLsptop = _randomId.v1().toString().substring(24, 36);
    //6009d8e0-e440-11e8-e459-ef36ab52cf1b

  }

  get encargado => _encargado;

  set encargado(value) {
    _encargado = value;
  }

  String get idLsptop => _idLsptop;

  set idLsptop(String value) {
    _idLsptop = value;
  }

  @override
  String toString() {
    return 'Laptop{_idLsptop: $_idLsptop, _encargado: $_encargado, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle}';
  }


}