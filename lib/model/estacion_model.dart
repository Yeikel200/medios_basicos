import 'monitor_model.dart';
import 'teclado_model.dart';
import 'bocina_model.dart';
import 'mouse_model.dart';
import 'ups_model.dart';
import 'scanner_model.dart';
import 'impresora_model.dart';
import 'unidad_central_model.dart';

class Estacion {
  String _idEstacion;
  UnidadCentral _unidadCentral;
  Monitor _monitor;
  Teclado _teclado;
  Bocina _bocina;
  Mouse _mouse;
  Ups _ups;
  Scanner _scanner;
  Impresora _impresora;

  Estacion(this._idEstacion, this._unidadCentral, this._monitor, this._teclado,
      this._bocina, this._mouse);

  Estacion.Ups(this._idEstacion, this._unidadCentral, this._monitor,
      this._teclado, this._bocina, this._mouse, this._ups);

  Estacion.Impresora(this._idEstacion, this._unidadCentral, this._monitor,
      this._teclado, this._bocina, this._mouse, this._impresora);

  Estacion.Scanner(this._idEstacion, this._unidadCentral, this._monitor,
      this._teclado, this._bocina, this._mouse, this._scanner);

  Estacion.UpsImpresora(this._idEstacion, this._unidadCentral, this._monitor,
      this._teclado, this._bocina, this._mouse, this._ups, this._impresora);

  Estacion.ImpresoraScanner(this._idEstacion, this._unidadCentral,this._monitor,
      this._teclado, this._bocina, this._mouse, this._scanner, this._impresora);

  Estacion.UpsImpresoraScanner(this._idEstacion, this._unidadCentral,
      this._monitor, this._teclado, this._bocina, this._mouse, this._ups,
      this._scanner, this._impresora);

  Impresora get impresora => _impresora;

  set impresora(Impresora value) {
    _impresora = value;
  }

  Scanner get scanner => _scanner;

  set scanner(Scanner value) {
    _scanner = value;
  }

  Ups get ups => _ups;

  set ups(Ups value) {
    _ups = value;
  }

  Mouse get mouse => _mouse;

  set mouse(Mouse value) {
    _mouse = value;
  }

  Bocina get bocina => _bocina;

  set bocina(Bocina value) {
    _bocina = value;
  }

  Teclado get teclado => _teclado;

  set teclado(Teclado value) {
    _teclado = value;
  }

  Monitor get monitor => _monitor;

  set monitor(Monitor value) {
    _monitor = value;
  }

  UnidadCentral get unidadCentral => _unidadCentral;

  set unidadCentral(UnidadCentral value) {
    _unidadCentral = value;
  }

  String get idEstacion => _idEstacion;

  set idEstacion(String value) {
    _idEstacion = value;
  }

  @override
  String toString() {
    return '''Estacion{
        _idEstacion: $_idEstacion, 
        _unidadCentral: $_unidadCentral, 
        _monitor: $_monitor,
         _teclado: $_teclado, 
         _bocina: $_bocina, 
         _mouse: $_mouse, 
         _ups: $_ups, 
         _scanner: $_scanner, 
         _impresora: $_impresora
     }''';
  }


}