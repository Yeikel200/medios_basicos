import 'package:uuid/uuid.dart';

import 'basic_prop_register.dart';

class Tablet extends BasicPropRegister {
  String _idTablet, _encargado;
  Uuid _randomId = new Uuid();

  Tablet(String numInv, String marca, String modelo, String tipo, String detalle, this._encargado, String fecha)
      : super(numInv, marca, modelo, tipo, detalle, fecha){
    this._idTablet = _randomId.v1().toString().substring(24, 36);
  }

  get encargado => _encargado;

  set encargado(value) {
    _encargado = value;
  }

  String get idTablet => _idTablet;

  set idTablet(String value) {
    _idTablet = value;
  }

  @override
  String toString() {
    return 'Tablet{_idTablet: $_idTablet, _encargado: $_encargado, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle, _fecha: $fecha}';
  }


}