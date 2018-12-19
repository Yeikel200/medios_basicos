import 'basic_prop_register.dart';

import 'package:uuid/uuid.dart';

class Scanner extends BasicPropRegister {
  String _idScanner;

  Uuid _randomId = Uuid();

  Scanner(
      String numInv, String marca, String modelo, String tipo, String detalle, String fecha)
      : super(numInv, marca, modelo, tipo, detalle, fecha) {
    this._idScanner = _randomId.v1().toString().substring(24, 36);
  }

  String get idScanner => _idScanner;

  set idScanner(String value) {
    _idScanner = value;
  }

  @override
  String toString() {
    return 'Scanner{_idScanner: $_idScanner, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle, _fecha: $fecha}';
  }
}
