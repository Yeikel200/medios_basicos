import 'basic_prop_register.dart';

class Scanner extends BasicPropRegister {
  String _idScanner;

  Scanner(this._idScanner, String numInv, String marca, String modelo, String tipo, String detalle)
      : super(numInv, marca, modelo, tipo, detalle);

  String get idScanner => _idScanner;

  set idScanner(String value) {
    _idScanner = value;
  }

  @override
  String toString() {
    return 'Scanner{_idScanner: $_idScanner, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle}';
  }


}