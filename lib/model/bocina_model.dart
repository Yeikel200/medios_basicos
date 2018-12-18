import 'basic_prop_register.dart';

class Bocina extends BasicPropRegister {
  String _idBocina;

  Bocina(this._idBocina, String numInv, String marca, String modelo, String tipo, String detalle)
      : super(numInv, marca, modelo, tipo, detalle);

  String get idBocina => _idBocina;

  set idBocina(String value) {
    _idBocina = value;
  }

  @override
  String toString() {
    return 'Bocina{_idBocina: $_idBocina, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle}';
  }


}