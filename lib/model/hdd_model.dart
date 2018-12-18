import 'basic_prop_register.dart';
import 'package:uuid/uuid.dart';

class Hdd extends BasicPropRegister {
  String _idHdd;
  Uuid random;


  Hdd(this._idHdd, String numInv, String marca, String modelo, String tipo, String detalle)
      : super(numInv, marca, modelo, tipo, detalle);

  String get idHdd => _idHdd;

  set idHdd(String value) {
    _idHdd = value;
  }

  @override
  String toString() {
    return 'Hdd{_idHdd: $_idHdd,_numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle}';
  }


}