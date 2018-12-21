import 'package:uuid/uuid.dart';

class Estacion {
  String _idEstacion, _name;
  String _area;
  String _encargado;
  Uuid _randomId = Uuid();

  String _idUnidadCentral;
  String _idMonitor;
  String _idTeclado;
  String _idBocina;
  String _idMouse;
  String _idUps;
  String _idScanner;
  String _idImpresora;

  Estacion(this._name, this._area, this._encargado, this._idUnidadCentral) {
    this._idEstacion = _randomId.v1().toString().substring(24, 36);
  }

  Estacion.ucMonitor(this._name, this._area, this._encargado,
      this._idUnidadCentral, this._idMonitor) {
    this._idEstacion = _randomId.v1().toString().substring(24, 36);
  }

  Estacion.ucMonitorTeclado(this._name, this._area, this._encargado,
      this._idUnidadCentral, this._idMonitor, this._idTeclado) {
    this._idEstacion = _randomId.v1().toString().substring(24, 36);
  }

  Estacion.ucMonitorTecladoBicina(this._name, this._area, this._encargado,
      this._idUnidadCentral, this._idMonitor, this._idTeclado, this._idBocina) {
    this._idEstacion = _randomId.v1().toString().substring(24, 36);
  }

  Estacion.ucMonitorTecladoBicinaMouse(
      this._name,
      this._area,
      this._encargado,
      this._idUnidadCentral,
      this._idMonitor,
      this._idTeclado,
      this._idBocina,
      this._idMouse) {
    this._idEstacion = _randomId.v1().toString().substring(24, 36);
  }

  Estacion.ucMonitorTecladoBicinaMouseUps(
      this._name,
      this._area,
      this._encargado,
      this._idUnidadCentral,
      this._idMonitor,
      this._idTeclado,
      this._idBocina,
      this._idMouse,
      this._idUps) {
    this._idEstacion = _randomId.v1().toString().substring(24, 36);
  }
  Estacion.ucMonitorTecladoBicinaMouseImpresora(
      this._name,
      this._area,
      this._encargado,
      this._idUnidadCentral,
      this._idMonitor,
      this._idTeclado,
      this._idBocina,
      this._idMouse,
      this._idImpresora) {
    this._idEstacion = _randomId.v1().toString().substring(24, 36);
  }
  Estacion.ucMonitorTecladoBicinaMouseScanner(
      this._name,
      this._area,
      this._encargado,
      this._idUnidadCentral,
      this._idMonitor,
      this._idTeclado,
      this._idBocina,
      this._idMouse,
      this._idScanner) {
    this._idEstacion = _randomId.v1().toString().substring(24, 36);
  }
  Estacion.ucMonitorTecladoBicinaMouseUpsScanner(
      this._name,
      this._area,
      this._encargado,
      this._idUnidadCentral,
      this._idMonitor,
      this._idTeclado,
      this._idBocina,
      this._idMouse,
      this._idUps,
      this._idScanner) {
    this._idEstacion = _randomId.v1().toString().substring(24, 36);
  }
  Estacion.ucMonitorTecladoBicinaMouseUpsImpresora(
      this._name,
      this._area,
      this._encargado,
      this._idUnidadCentral,
      this._idMonitor,
      this._idTeclado,
      this._idBocina,
      this._idMouse,
      this._idUps,
      this._idImpresora) {
    this._idEstacion = _randomId.v1().toString().substring(24, 36);
  }

  String get encargado => _encargado;

  set encargado(String value) {
    _encargado = value;
  }

  String get area => _area;

  set area(String value) {
    _area = value;
  }

  get name => _name;

  set name(value) {
    _name = value;
  }

  String get idEstacion => _idEstacion;

  set idEstacion(String value) {
    _idEstacion = value;
  }

  String get idUnidadCentral => _idUnidadCentral;

  set idUnidadCentral(String value) {
    _idUnidadCentral = value;
  }

  String get idMonitor => _idMonitor;

  set idMonitor(String value) {
    _idMonitor = value;
  }

  String get idTeclado => _idTeclado;

  set idTeclado(String value) {
    _idTeclado = value;
  }

  String get idBocina => _idBocina;

  set idBocina(String value) {
    _idBocina = value;
  }

  String get idMouse => _idMouse;

  set idMouse(String value) {
    _idMouse = value;
  }

  String get idUps => _idUps;

  set idUps(String value) {
    _idUps = value;
  }

  String get idScanner => _idScanner;

  set idScanner(String value) {
    _idScanner = value;
  }

  String get idImpresora => _idImpresora;

  set idImpresora(String value) {
    _idImpresora = value;
  }

  @override
  String toString() {
    return 'Estacion{_idEstacion: $_idEstacion, _name: $_name, _area: $_area, _encargado: $_encargado, _randomId: $_randomId, _idUnidadCentral: $_idUnidadCentral, _idMonitor: $_idMonitor, _idTeclado: $_idTeclado, _idBocina: $_idBocina, _idMouse: $_idMouse, _idUps: $_idUps, _idScanner: $_idScanner, _idImpresora: $_idImpresora}';
  }
}
