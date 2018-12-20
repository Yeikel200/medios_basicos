import 'basic_prop_register.dart';
import 'package:uuid/uuid.dart';

class Hdd extends BasicPropRegister {
  String _idHdd;
  Uuid _randomId = Uuid();

  Hdd( String numInv, String marca, String modelo, String tipo, String detalle,String estado, String fecha)
      : super(numInv, marca, modelo, tipo, detalle,estado, fecha){
    this._idHdd = _randomId.v1().toString().substring(24, 36);

  }

  String get idHdd => _idHdd;

  set idHdd(String value) {
    _idHdd = value;
  }

  @override
  String toString() {
    return 'Hdd{_idHdd: $_idHdd,_numInv: $numInv, _marca: $marca, _modelo: $modelo, _tipo: $tipo, _detalle: $detalle, _estado: $estado, _fecha: $fecha}';
  }


}