import 'package:uuid/uuid.dart';

import 'basic_prop_register.dart';

class Teclado extends BasicPropRegister {
  String _idTeclado;
  Uuid _randomId = new Uuid();

  Teclado( String numInv, String marca, String modelo, String tipo, String detalle, String estado, String fecha)
      : super(numInv, marca, modelo, tipo, detalle, estado, fecha){

    this._idTeclado = _randomId.v1().toString().substring(24, 36);
  }

  String get idTeclado => _idTeclado;

  set idTeclado(String value) {
    _idTeclado = value;
  }

  @override
  String toString() {
    return 'Teclado{_idTeclado: $_idTeclado, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle, _fecha: $fecha}';
  }


}