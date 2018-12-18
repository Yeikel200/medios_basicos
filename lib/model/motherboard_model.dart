import 'basic_prop_register.dart';

class Motherboard extends BasicPropRegister {
  String _idMotherboard;

  Motherboard(this._idMotherboard, String numInv, String marca, String modelo, String tipo, String detalle)
      : super(numInv, marca, modelo, tipo, detalle);

  String get idMotherboard => _idMotherboard;

  set idMotherboard(String value) {
    _idMotherboard = value;
  }

  @override
  String toString() {
    return 'Motherboard{_idMotherboard: $_idMotherboard, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle}';
  }


}