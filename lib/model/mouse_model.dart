import 'basic_prop_register.dart';

class Mouse extends BasicPropRegister {
  String _idMouse;

  Mouse(this._idMouse, String numInv, String marca, String modelo, String tipo, String detalle)
      : super(numInv, marca, modelo, tipo, detalle);

  String get idMouse => _idMouse;

  set idMouse(String value) {
    _idMouse = value;
  }

  @override
  String toString() {
    return 'Mouse{_idMouse: $_idMouse, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle}';
  }


}