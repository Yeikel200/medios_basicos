import 'basic_prop_register.dart';

class Ram extends BasicPropRegister {
  String _idRam;

  Ram(this._idRam, String numInv, String marca, String modelo, String tipo, String detalle)
      : super(numInv, marca, modelo, tipo, detalle);

  String get idRam => _idRam;

  set idRam(String value) {
    _idRam = value;
  }

  @override
  String toString() {
    return 'Ram{_idRam: $_idRam, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle}';
  }


}