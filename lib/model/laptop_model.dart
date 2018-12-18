import 'basic_prop_register.dart';

class Laptop extends BasicPropRegister {
  String _idLsptop,
  _encargado;

  Laptop(this._idLsptop, String numInv, String marca, String modelo, String tipo, String detalle, this._encargado)
      : super(numInv, marca, modelo, tipo, detalle);

  get encargado => _encargado;

  set encargado(value) {
    _encargado = value;
  }

  String get idLsptop => _idLsptop;

  set idLsptop(String value) {
    _idLsptop = value;
  }

  @override
  String toString() {
    return 'Laptop{_idLsptop: $_idLsptop, _encargado: $_encargado, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle}';
  }


}