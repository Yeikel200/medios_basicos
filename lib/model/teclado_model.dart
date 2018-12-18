import 'basic_prop_register.dart';

class Teclado extends BasicPropRegister {
  String _idTeclado;

  Teclado(this._idTeclado, String numInv, String marca, String modelo, String tipo, String detalle)
      : super(numInv, marca, modelo, tipo, detalle);

  String get idTeclado => _idTeclado;

  set idTeclado(String value) {
    _idTeclado = value;
  }

  @override
  String toString() {
    return 'Teclado{_idTeclado: $_idTeclado, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle}';
  }


}