import 'package:uuid/uuid.dart';

import 'basic_prop_register.dart';

class Mouse extends BasicPropRegister {
  String _idMouse;
  Uuid _randomId = Uuid();

  Mouse( String numInv, String marca, String modelo, String tipo, String detalle)
      : super(numInv, marca, modelo, tipo, detalle){
    this._idMouse = _randomId.v1().toString().substring(24, 36);

  }

  String get idMouse => _idMouse;

  set idMouse(String value) {
    _idMouse = value;
  }

  @override
  String toString() {
    return 'Mouse{_idMouse: $_idMouse, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle}';
  }


}