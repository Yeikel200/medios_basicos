import 'package:uuid/uuid.dart';

import 'basic_prop_register.dart';

class Bocina extends BasicPropRegister {
  String _idBocina;
  Uuid _randomId = Uuid();

  Bocina( String numInv, String marca, String modelo, String tipo, String detalle, String estado, String fecha)
      : super(numInv, marca, modelo, tipo, detalle, estado, fecha){
    this._idBocina = _randomId.v1().toString().substring(24, 36);

  }

  String get idBocina => _idBocina;

  set idBocina(String value) {
    _idBocina = value;
  }

  @override
  String toString() {
    return 'Bocina{_idBocina: $_idBocina, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle, _fecha: $fecha}';
  }


}