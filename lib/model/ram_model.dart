import 'package:uuid/uuid.dart';

import 'basic_prop_register.dart';

class Ram extends BasicPropRegister {
  String _idRam;
  Uuid _randomId = Uuid();

  Ram( String numInv, String marca, String modelo, String tipo, String detalle, String estado, String fecha)
      : super(numInv, marca, modelo, tipo, detalle, estado, fecha){
    this._idRam = _randomId.v1().toString().substring(24, 36);
  }

  String get idRam => _idRam;

  set idRam(String value) {
    _idRam = value;
  }

  @override
  String toString() {
    return 'Ram{_idRam: $_idRam, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle, _estado: $estado, _fecha: $fecha}';
  }


}