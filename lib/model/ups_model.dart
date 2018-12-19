import 'basic_prop_register.dart';

import 'package:uuid/uuid.dart';

class Ups extends BasicPropRegister {
  String _idUps;

  Uuid _randomId = Uuid();

  Ups(String numInv, String marca, String modelo, String tipo, String detalle, String fecha)
      : super(numInv, marca, modelo, tipo, detalle, fecha){
    this._idUps = _randomId.v1().toString().substring(24, 36);
  }

  String get idUps => _idUps;

  set idUps(String value) {
    _idUps = value;
  }

  @override
  String toString() {
    return 'Ups{_idUps: $_idUps, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle, _fecha: $fecha}';
  }


}