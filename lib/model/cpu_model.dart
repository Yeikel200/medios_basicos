import 'package:uuid/uuid.dart';

import 'basic_prop_register.dart';

class Cpu extends BasicPropRegister {
  String _idCpu;
  Uuid _randomId = Uuid();

  Cpu(String numInv, String marca, String modelo, String tipo, String detalle, String fecha)
      : super(numInv, marca, modelo, tipo, detalle, fecha){
    this._idCpu = _randomId.v1().toString().substring(24, 36);
  }

  Uuid get randomId => _randomId;

  set randomId(Uuid value) {
    _randomId = value;
  }

  String get idCpu => _idCpu;

  set idCpu(String value) {
    _idCpu = value;
  }


}