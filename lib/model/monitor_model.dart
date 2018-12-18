import 'basic_prop_register.dart';

class Monitor extends BasicPropRegister {
  String _idMonitor;

  Monitor(this._idMonitor, String numInv, String marca, String modelo, String tipo, String detalle) :
        super(numInv, marca, modelo, tipo, detalle);

  String get idMonitor => _idMonitor;

  set idMonitor(String value) {
    _idMonitor = value;
  }

  @override
  String toString() {
    return 'Monitor{_idMonitor: $_idMonitor, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle}';
  }


}