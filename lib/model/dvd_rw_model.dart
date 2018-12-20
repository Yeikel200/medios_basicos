import 'package:uuid/uuid.dart';

import 'basic_prop_register.dart';

class DvdRw extends BasicPropRegister {
  String _idDvdRw;
  Uuid _randomId = Uuid();

  DvdRw( String numInv, String marca, String modelo, String tipo, String detalle, String estado, String fecha)
      : super(numInv, marca, modelo, tipo, detalle, estado, fecha){
    this._idDvdRw = _randomId.v1().toString().substring(24, 36);

  }

  String get idDvdRw => _idDvdRw;

  set idDvdRw(String value) {
    _idDvdRw = value;
  }

  @override
  String toString() {
    return 'DvdRw{_idDvdRw: $_idDvdRw, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle, _fecha: $fecha}';
  }


}