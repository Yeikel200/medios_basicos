import 'basic_prop_register.dart';

class DvdRw extends BasicPropRegister {
  String _idDvdRw;

  DvdRw(this._idDvdRw, String numInv, String marca, String modelo, String tipo, String detalle)
      : super(numInv, marca, modelo, tipo, detalle);

  String get idDvdRw => _idDvdRw;

  set idDvdRw(String value) {
    _idDvdRw = value;
  }

  @override
  String toString() {
    return 'DvdRw{_idDvdRw: $_idDvdRw, _numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle}';
  }


}