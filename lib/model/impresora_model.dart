import 'basic_prop_register.dart';

class Impresora extends BasicPropRegister {
  String _idImpresora;

  Impresora(this._idImpresora, String numInv, String marca, String modelo, String tipo, String detalle)
      : super(numInv, marca, modelo, tipo, detalle);

  String get idImpresora => _idImpresora;

  set idImpresora(String value) {
    _idImpresora = value;
  }

  @override
  String toString() {
    return 'Impresora{_idImpresora: $_idImpresora, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle}';
  }

}