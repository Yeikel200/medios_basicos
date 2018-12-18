import 'basic_prop_register.dart';

class Ups extends BasicPropRegister {
  String _idUps;

  Ups(String numInv, String marca, String modelo, String tipo, String detalle)
      : super(numInv, marca, modelo, tipo, detalle);

  String get idUps => _idUps;

  set idUps(String value) {
    _idUps = value;
  }

  @override
  String toString() {
    return 'Ups{_idUps: $_idUps, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle}';
  }


}