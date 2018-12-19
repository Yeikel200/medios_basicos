import 'basic_prop_register.dart';
import 'package:uuid/uuid.dart';

class Monitor extends BasicPropRegister {
  String _idMonitor;

  Uuid _randomId = new Uuid();

  Monitor (String numInv, String marca, String modelo, String tipo, String detalle, String fecha)
      :  super(numInv, marca, modelo, tipo, detalle, fecha){
    this._idMonitor = _randomId.v1().toString().substring(24, 36);
  }

  String get idMonitor => _idMonitor;

  set idMonitor(String value) {
    _idMonitor = value;
  }

  @override
  String toString() {
    return 'Monitor{_idMonitor: $_idMonitor, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle, _fecha: $fecha}';
  }


}