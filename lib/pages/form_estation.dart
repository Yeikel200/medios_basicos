import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:medios_basicos/constants.dart';

import 'package:medios_basicos/model/estacion_model.dart';
import 'package:medios_basicos/model/monitor_model.dart';
import 'package:medios_basicos/model/teclado_model.dart';
import 'package:medios_basicos/model/bocina_model.dart';
import 'package:medios_basicos/model/mouse_model.dart';
import 'package:medios_basicos/model/ups_model.dart';
import 'package:medios_basicos/model/scanner_model.dart';
import 'package:medios_basicos/model/impresora_model.dart';
import 'package:medios_basicos/model/unidad_central_model.dart';

import 'package:medios_basicos/model/motherboard_model.dart';
import 'package:medios_basicos/model/hdd_model.dart';
import 'package:medios_basicos/model/ram_model.dart';
import 'package:medios_basicos/model/dvd_rw_model.dart';

class StepperForm extends StatefulWidget {
  final List<String> listSteps;

  const StepperForm({Key key, this.listSteps}) : super(key: key);

  @override
  _StepperFormState createState() => _StepperFormState(listSteps);
}

class _StepperFormState extends State<StepperForm> {
  List<String> buildListSteps = List();

  _StepperFormState(this.buildListSteps);

  DateTime _dateTime = new DateTime.now();
  DateFormat _dateFormat = new DateFormat.yMEd();

  int _currentStep = 0;

  List<Step> listSteps = List();

  /// Foromulario  UNIDAD CENTRAL
  final formKeyUnidadCentral = new GlobalKey<FormState>();
  String _nombreUnidadCentral,
      _numInvUnidadCentral,
      _numSelloUnidadCentral,
      _areaUnidadCentral,
      _encargadoUnidadCentral,
      _fechaUnidadCentral;

  final TextEditingController controllerNombreUnidadCentral =
      new TextEditingController();
  final TextEditingController controllerNumInventarioUnidadCentral =
      new TextEditingController();
  final TextEditingController controllerSelloUnidadCentral =
      new TextEditingController();
  final TextEditingController controllerAreaUnidadCentral =
      new TextEditingController();
  final TextEditingController controllerEncargadoUnidadCentral =
      new TextEditingController();
  final TextEditingController controllerFechaUnidadCentral =
      new TextEditingController();

  /// Foromulario  MOTHERBOARD
  final formKeyMotherboard = new GlobalKey<FormState>();
  String _numInvMotherboard,
      _marcaMotherboard,
      _modeloMotherboard,
      _tipoMotherboard,
      _detallesMotherboard,
      _encargadoMotherboard,
      _fechaMotherboard;

  final TextEditingController controllerNumInventarioMotherboard =
      new TextEditingController();
  final TextEditingController controllerMarcaMotherboard =
      new TextEditingController();
  final TextEditingController controllerModeloMotherboard =
      new TextEditingController();
  final TextEditingController controllerTipoMotherboard =
      new TextEditingController();
  final TextEditingController controllerDetallesMotherboard =
      new TextEditingController();
  final TextEditingController controllerEncargadoMotherboard =
      new TextEditingController();
  final TextEditingController controllerFechaMotherboard =
      new TextEditingController();

  /// Foromulario  RAM
  final formKeyRam = new GlobalKey<FormState>();
  String _numInvRam, _marcaRam, _modeloRam, _tipoRam, _detallesRam, _fechaRam;

  final TextEditingController controllerNumInventarioRam =
      new TextEditingController();
  final TextEditingController controllerMarcaRam = new TextEditingController();
  final TextEditingController controllerModeloRam = new TextEditingController();
  final TextEditingController controllerTipoRam = new TextEditingController();
  final TextEditingController controllerDetallesRam =
      new TextEditingController();
  final TextEditingController controllerFechaRam = new TextEditingController();

  /// Foromulario  HDD
  final formKeyHdd = new GlobalKey<FormState>();
  String _numInvHdd, _marcaHdd, _modeloHdd, _tipoHdd, _detallesHdd, _fechaHdd;

  final TextEditingController controllerNumInventarioHdd =
      new TextEditingController();
  final TextEditingController controllerMarcaHdd = new TextEditingController();
  final TextEditingController controllerModeloHdd = new TextEditingController();
  final TextEditingController controllerTipoHdd = new TextEditingController();
  final TextEditingController controllerDetallesHdd =
      new TextEditingController();
  final TextEditingController controllerFechaHdd = new TextEditingController();

  /// Foromulario  MONITOR
  final formKeyMonitor = new GlobalKey<FormState>();
  String _numInvMonitor,
      _marcaMonitor,
      _modeloMonitor,
      _tipoMonitor,
      _detallesMonitor,
      _fechaMonitor;

  final TextEditingController controllerNumInventarioMonitor =
      new TextEditingController();
  final TextEditingController controllerMarcaMonitor =
      new TextEditingController();
  final TextEditingController controllerModeloMonitor =
      new TextEditingController();
  final TextEditingController controllerTipoMonitor =
      new TextEditingController();
  final TextEditingController controllerDetallesMonitor =
      new TextEditingController();
  final TextEditingController controllerFechaMonitor =
      new TextEditingController();

  /// Foromulario  TECLADO
  final formKeyTeclado = new GlobalKey<FormState>();
  String _numInvTeclado,
      _marcaTeclado,
      _modeloTeclado,
      _tipoTeclado,
      _detallesTeclado,
      _fechaTeclado;

  final TextEditingController controllerNumInventarioTeclado =
      new TextEditingController();
  final TextEditingController controllerMarcaTeclado =
      new TextEditingController();
  final TextEditingController controllerModeloTeclado =
      new TextEditingController();
  final TextEditingController controllerTipoTeclado =
      new TextEditingController();
  final TextEditingController controllerDetallesTeclado =
      new TextEditingController();
  final TextEditingController controllerFechaTeclado =
      new TextEditingController();

  /// Foromulario  BOCINA
  final formKeyBocina = new GlobalKey<FormState>();
  String _numInvBocina,
      _marcaBocina,
      _modeloBocina,
      _tipoBocina,
      _detallesBocina,
      _fechaBocina;

  final TextEditingController controllerNumInventarioBocina =
      new TextEditingController();
  final TextEditingController controllerMarcaBocina =
      new TextEditingController();
  final TextEditingController controllerModeloBocina =
      new TextEditingController();
  final TextEditingController controllerTipoBocina =
      new TextEditingController();
  final TextEditingController controllerDetallesBocina =
      new TextEditingController();
  final TextEditingController controllerFechaBocina =
      new TextEditingController();

  /// Foromulario  MOUSE
  final formKeyMouse = new GlobalKey<FormState>();
  String _numInvMouse,
      _marcaMouse,
      _modeloMouse,
      _tipoMouse,
      _detallesMouse,
      _fechaMouse;

  final TextEditingController controllerNumInventarioMouse =
      new TextEditingController();
  final TextEditingController controllerMarcaMouse =
      new TextEditingController();
  final TextEditingController controllerModeloMouse =
      new TextEditingController();
  final TextEditingController controllerTipoMouse = new TextEditingController();
  final TextEditingController controllerDetallesMouse =
      new TextEditingController();
  final TextEditingController controllerFechaMouse =
      new TextEditingController();

  /// Foromulario  UPS
  final formKeyUps = new GlobalKey<FormState>();
  String _numInvUps, _marcaUps, _modeloUps, _tipoUps, _detallesUps, _fechaUps;

  final TextEditingController controllerNumInventarioUps =
      new TextEditingController();
  final TextEditingController controllerMarcaUps = new TextEditingController();
  final TextEditingController controllerModeloUps = new TextEditingController();
  final TextEditingController controllerTipoUps = new TextEditingController();
  final TextEditingController controllerDetallesUps =
      new TextEditingController();
  final TextEditingController controllerFechaUps = new TextEditingController();

  /// Foromulario  SCANNER
  final formKeyScanner = new GlobalKey<FormState>();
  String _numInvScanner,
      _marcaScanner,
      _modeloScanner,
      _tipoScanner,
      _detallesScanner,
      _fechaScanner;

  final TextEditingController controllerNumInventarioScanner =
      new TextEditingController();
  final TextEditingController controllerMarcaScanner =
      new TextEditingController();
  final TextEditingController controllerModeloScanner =
      new TextEditingController();
  final TextEditingController controllerTipoScanner =
      new TextEditingController();
  final TextEditingController controllerDetallesScanner =
      new TextEditingController();
  final TextEditingController controllerFechaScanner =
      new TextEditingController();

  /// Foromulario  IMPRESORA
  final formKeyImpresora = new GlobalKey<FormState>();
  String _numInvImpresora,
      _marcaImpresora,
      _modeloImpresora,
      _tipoImpresora,
      _detallesImpresora,
      _fechaImpresora;

  final TextEditingController controllerNumInventarioImpresora =
      new TextEditingController();
  final TextEditingController controllerMarcaImpresora =
      new TextEditingController();
  final TextEditingController controllerModeloImpresora =
      new TextEditingController();
  final TextEditingController controllerTipoImpresora =
      new TextEditingController();
  final TextEditingController controllerDetallesImpresora =
      new TextEditingController();
  final TextEditingController controllerFechaImpresora =
      new TextEditingController();

  /// Foromulario  TABLET
  final formKeyTablet = new GlobalKey<FormState>();
  String _numInvTablet,
      _marcaTablet,
      _modeloTablet,
      _tipoTablet,
      _detallesTablet,
      _encargadoTablet,
      _fechaTablet;

  final TextEditingController controllerNumInventarioTablet =
      new TextEditingController();
  final TextEditingController controllerMarcaTablet =
      new TextEditingController();
  final TextEditingController controllerModeloTablet =
      new TextEditingController();
  final TextEditingController controllerTipoTablet =
      new TextEditingController();
  final TextEditingController controllerDetallesTablet =
      new TextEditingController();
  final TextEditingController controllerEncargadoTablet =
      new TextEditingController();
  final TextEditingController controllerFechaTablet =
      new TextEditingController();

  /// Foromulario  LAPTOP
  final formKeyLaptop = new GlobalKey<FormState>();
  String _numInvLaptop,
      _marcaLaptop,
      _modeloLaptop,
      _tipoLaptop,
      _detallesLaptop,
      _encargadoLaptop,
      _fechaLaptop;

  final TextEditingController controllerNumInventarioLaptop =
      new TextEditingController();
  final TextEditingController controllerMarcaLaptop =
      new TextEditingController();
  final TextEditingController controllerModeloLaptop =
      new TextEditingController();
  final TextEditingController controllerTipoLaptop =
      new TextEditingController();
  final TextEditingController controllerDetallesLaptop =
      new TextEditingController();
  final TextEditingController controllerEncargadoLaptop =
      new TextEditingController();
  final TextEditingController controllerFechaLaptop =
      new TextEditingController();

  /// Foromulario  MEMORIA
  final formKeyMemoria = new GlobalKey<FormState>();
  String _numInvMemoria,
      _marcaMemoria,
      _modeloMemoria,
      _tipoMemoria,
      _detallesMemoria,
      _encargadoMemoria,
      _fechaMemoria;

  final TextEditingController controllerNumInventarioMemoria =
      new TextEditingController();
  final TextEditingController controllerMarcaMemoria =
      new TextEditingController();
  final TextEditingController controllerModeloMemoria =
      new TextEditingController();
  final TextEditingController controllerTipoMemoria =
      new TextEditingController();
  final TextEditingController controllerDetallesMemoria =
      new TextEditingController();
  final TextEditingController controllerEncargadoMemoria =
      new TextEditingController();
  final TextEditingController controllerFechaMemoria =
      new TextEditingController();

  Estacion _estacion;
  UnidadCentral _unidadCentral;
  Motherboard _motherboard;
  Ram _ram;
  Hdd _hdd;

  Monitor _monitor;
  Teclado _teclado;
  Bocina _bocina;
  Mouse _mouse;
  Ups _ups;
  Scanner _scanner;
  Impresora _impresora;

  @override
  void initState() {
    super.initState();

    _addsItemsInToLists();

    _fechaUnidadCentral = _dateFormat.format(_dateTime);
    _fechaMotherboard = _dateFormat.format(_dateTime);
    _fechaRam = _dateFormat.format(_dateTime);
    _fechaHdd = _dateFormat.format(_dateTime);
    _fechaMonitor = _dateFormat.format(_dateTime);
    _fechaTeclado = _dateFormat.format(_dateTime);
    _fechaBocina = _dateFormat.format(_dateTime);
    _fechaMouse = _dateFormat.format(_dateTime);
    _fechaScanner = _dateFormat.format(_dateTime);
    _fechaImpresora = _dateFormat.format(_dateTime);
    _fechaTablet = _dateFormat.format(_dateTime);
    _fechaLaptop = _dateFormat.format(_dateTime);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario'),
      ),
      body: Container(
        child: Stepper(
          steps: listSteps,
          currentStep: this._currentStep,
          onStepContinue: () {
            setState(() {
              if (_currentStep < listSteps.length - 1) {
                print('Escalon: $_currentStep');
                _debugValidatorFrom(buildListSteps[_currentStep]);
              } else {
                //_currentStep = 0;
                // Este es el ultimo escalon de la lista
                //Aqui implementamos la accion de guardar los datos recogidos en los formularios
                print('Fin del la lista. Este es el ultimo elemento');

                buildListSteps.forEach((value) {
                 // _buildObjectForDB(value);
                });
              }
            });
          },
          onStepTapped: (i) {
            setState(() {
              if (i < _currentStep) {
                _currentStep = i;
              }
            });
          },
        ),
      ),
    );
  }



  void _debugValidatorFrom(String caseValite) {
    var formUc = formKeyUnidadCentral.currentState;
    var formMotherboard = formKeyMotherboard.currentState;
    var formRam = formKeyRam.currentState;
    var formHdd = formKeyHdd.currentState;
    var formMonitor = formKeyMonitor.currentState;
    var formTeclado = formKeyTeclado.currentState;
    var formBocina = formKeyBocina.currentState;
    var formMouse = formKeyMouse.currentState;
    var formUps = formKeyUps.currentState;
    var formScanner = formKeyScanner.currentState;
    var formImpresora = formKeyImpresora.currentState;
    var formTablet = formKeyTablet.currentState;
    var formLaptop = formKeyLaptop.currentState;
    var formMemoria = formKeyMemoria.currentState;

//    print('-- $marca -- ');
    print('Folmulario acontinuacion es: ' + buildListSteps[_currentStep + 1]);
    int size = buildListSteps.length;

    switch (caseValite) {
      case CONST_UNIDAD_CENTRAL:
        if (formUc.validate()) {
          formUc.save();

          //_unidadCentral = UnidadCentral.cliente(_idUCentral, _numInv, _sello, _area, _responsable, _motherboard, _ram, _hdd)
          _currentStep = _currentStep + 1;
        }
        break;
      case CONST_MOTHERBOARD:
        if (formMotherboard.validate()) {
          formMotherboard.save();
          printForm(
              _numInvMotherboard,
              _marcaMotherboard,
              _modeloMotherboard,
              _tipoMotherboard,
              _detallesMotherboard,
              "encargado",
              _fechaMotherboard);
          _currentStep = _currentStep + 1;
        }
        break;
      case CONST_RAM:
        if (formRam.validate()) {
          formRam.save();

          _currentStep = _currentStep + 1;
        }
        break;
      case CONST_HDD:
        if (formHdd.validate()) {
          formHdd.save();
          printForm(
              _numInvHdd,
              _marcaHdd,
              _modeloHdd,
              _tipoHdd,
              _detallesHdd,
              "encargado",
              _fechaHdd);
          _currentStep = _currentStep + 1;
        }
        break;
      case CONST_MONITOR:
        if (formMonitor.validate()) {
          formMonitor.save();
          printForm(
              _numInvMonitor,
              _marcaMonitor,
              _modeloMonitor,
              _tipoMonitor,
              _detallesMonitor,
              "encargado",
              _fechaMonitor);
          _currentStep = _currentStep + 1;
        }
        break;
      case CONST_TECLADO:
        if (formTeclado.validate()) {
          formTeclado.save();
          printForm(
              _numInvTeclado,
              _marcaTeclado,
              _modeloTeclado,
              _tipoTeclado,
              _detallesTeclado,
              "encargado",
              _fechaTeclado);
          _currentStep = _currentStep + 1;
        }
        break;
      case CONST_BOCINA:
        if (formBocina.validate()) {
          formBocina.save();
          printForm(
              _numInvBocina,
              _marcaBocina,
              _modeloBocina,
              _tipoBocina,
              _detallesBocina,
              "encargado",
              _fechaBocina);
          _currentStep = _currentStep + 1;
        }
        break;
        case CONST_MOUSE:
          if (formMouse.validate()) {
            formMouse.save();
            printForm(
                _numInvMouse,
                _marcaMouse,
                _modeloMouse,
                _tipoMouse,
                _detallesMouse,
                "encargado",
                _fechaMouse);
            _currentStep = _currentStep + 1;
          }
        break;
      case CONST_UPS:
        if (formUps.validate()) {
          formUps.save();
          printForm(
              _numInvUps,
              _marcaUps,
              _modeloUps,
              _tipoUps,
              _detallesUps,
              "encargado",
              _fechaUps);
          _currentStep = _currentStep + 1;
        }
        break;
        case CONST_SCANNER:
          if (formScanner.validate()) {
            formScanner.save();
            printForm(
                _numInvScanner,
                _marcaScanner,
                _modeloScanner,
                _tipoScanner,
                _detallesScanner,
                "encargado",
                _fechaScanner);
            _currentStep = _currentStep + 1;
          }
        break;
      case CONST_IMPRESORA:
        if (formImpresora.validate()) {
          formImpresora.save();
          printForm(
              _numInvImpresora,
              _marcaImpresora,
              _modeloImpresora,
              _tipoImpresora,
              _detallesImpresora,
              "encargado",
              _fechaImpresora);
          _currentStep = _currentStep + 1;
        }
        break;
        case CONST_TABLET:
          if (formTablet.validate()) {
            formTablet.save();
            printForm(
                _numInvTablet,
                _marcaTablet,
                _modeloTablet,
                _tipoTablet,
                _detallesTablet,
                "encargado",
                _fechaTablet);
            _currentStep = _currentStep + 1;
          }
        break;
        case CONST_LAPTOP:
          if (formLaptop.validate()) {
            formLaptop.save();
            printForm(
                _numInvLaptop,
                _marcaLaptop,
                _modeloLaptop,
                _tipoLaptop,
                _detallesLaptop,
                "encargado",
                _fechaLaptop);
            _currentStep = _currentStep + 1;
          }
        break;
      case CONST_MEMORIAS_USB_SD:
        if (formMemoria.validate()) {
          formMemoria.save();
          printForm(
              _numInvMemoria,
              _marcaMemoria,
              _modeloMemoria,
              _tipoMemoria,
              _detallesMemoria,
              "encargado",
              _fechaMemoria);
          _currentStep = _currentStep + 1;
        }
        break;

    }
  }

  /*Object _buildObjectForDB(String value){
    switch (value) {
      case CONST_UNIDAD_CENTRAL:
        return _unidadCentral = UnidadCentral.cliente("id pendiente", _numInvUnidadCentral, _numSelloUnidadCentral, _areaUnidadCentral, _encargadoUnidadCentral, _motherboard, _ram, _hdd);
        break;
      case CONST_MOTHERBOARD:

        break;
      case CONST_RAM:

        break;
      case CONST_HDD:

        break;
      case CONST_MONITOR:

        break;
      case CONST_TECLADO:

        break;
      case CONST_BOCINA:

        break;
      case CONST_MOUSE:

        break;
      case CONST_UPS:

        break;
      case CONST_SCANNER:

        break;
      case CONST_IMPRESORA:

        break;
      case CONST_TABLET:

        break;
      case CONST_LAPTOP:

        break;
      case CONST_MEMORIAS_USB_SD:


        break;
    }*/

  void printForm(
      String _numInv, _marca, _modelo, _tipo, _detalles, _encargado, _fecha) {
    print('''
           Valores de los campos
         $_numInv
         $_marca -
         $_modelo -
         $_tipo -
         $_detalles -
         $_encargado -
         $_fecha -
               ''');
  }

  void _addsItemsInToLists() {
    buildListSteps.forEach((value) {
      //_listTab.add(_buildTab(value));
      listSteps.add(_buildStepsView(value));
    });
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime piked = await showDatePicker(
        context: context,
        initialDate: _dateTime,
        firstDate: new DateTime(2010),
        lastDate: new DateTime(2025));

    if (piked != null && piked != _dateTime) {
      setState(() {
        print(_dateFormat.format(piked));
        _dateTime = piked;
        _fechaUnidadCentral = _dateFormat.format(piked);
        controllerFechaUnidadCentral.text = _fechaMonitor;

        _fechaMotherboard = _dateFormat.format(piked);
        controllerFechaMotherboard.text = _fechaMotherboard;
        _fechaRam = _dateFormat.format(piked);
        controllerFechaRam.text = _fechaRam;
        _fechaHdd = _dateFormat.format(piked);
        controllerFechaHdd.text = _fechaHdd;

        _fechaMonitor = _dateFormat.format(piked);
        controllerFechaMonitor.text = _fechaMonitor;
        _fechaTeclado = _dateFormat.format(piked);
        controllerFechaTeclado.text = _fechaTeclado;
        _fechaBocina = _dateFormat.format(piked);
        controllerFechaBocina.text = _fechaBocina;
        _fechaMouse = _dateFormat.format(piked);
        controllerFechaMouse.text = _fechaMouse;
        _fechaScanner = _dateFormat.format(piked);
        controllerFechaScanner.text = _fechaScanner;
        _fechaImpresora = _dateFormat.format(piked);
        controllerFechaImpresora.text = _fechaImpresora;

        _fechaTablet = _dateFormat.format(piked);
        controllerFechaTablet.text = _fechaTablet;
        _fechaLaptop = _dateFormat.format(piked);
        controllerFechaLaptop.text = _fechaLaptop;
        _fechaMemoria = _dateFormat.format(piked);
        controllerFechaMemoria.text = _fechaMemoria;
      });
    }
  }

  Step _buildStepsView(String value) {
    switch (value) {
      case CONST_UNIDAD_CENTRAL:
        return _defaulFromUnidadCentral();

      case CONST_MOTHERBOARD:
        return _formMotherboard();

      case CONST_RAM:
        return _formRam();

      case CONST_HDD:
        return _formHdd();

      case CONST_MONITOR:
        return _formMonitor();

      case CONST_TECLADO:
        return _formTeclado();

      case CONST_BOCINA:
        return _formBocina();

      case CONST_MOUSE:
        return _formMouse();

      case CONST_UPS:
        return _formUps();

      case CONST_SCANNER:
        return _formScanner();

      case CONST_IMPRESORA:
        return _formImpresora();

      case CONST_TABLET:
        return _formTablet();

      case CONST_LAPTOP:
        return _formLaptop();

      case CONST_MEMORIAS_USB_SD:
        return _formMemoria();

    }
  }

  Step _defaulFromUnidadCentral() {
    return Step(
      title: Text(
        CONST_UNIDAD_CENTRAL,
        style: TextStyle(
          color: Colors.black45,
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Form(
          key: formKeyUnidadCentral,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextFormField(
                    autocorrect: false,
                    decoration: _defaulImputDecoration(
                        NOMBRE_ESTACION, Icons.short_text),
                    validator: (val) =>
                        val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                    onSaved: (value) => _nombreUnidadCentral = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextFormField(
                    autocorrect: false,
                    decoration: _defaulImputDecoration(
                        NUM_INVENTARIO, Icons.drag_handle),
                    validator: (val) =>
                        val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                    onSaved: (value) => _numInvUnidadCentral = value,
                    keyboardType: TextInputType.numberWithOptions(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextFormField(
                    autocorrect: false,
                    decoration:
                        _defaulImputDecoration(NUM_SELLO, Icons.payment),
                    validator: (val) =>
                        val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                    onSaved: (value) => _numSelloUnidadCentral = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextFormField(
                    autocorrect: false,
                    decoration:
                        _defaulImputDecoration(AREA_OFICINA, Icons.location_on),
                    validator: (val) =>
                        val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                    onSaved: (value) => _areaUnidadCentral = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextFormField(
                    autocorrect: false,
                    decoration:
                        _defaulImputDecoration(NOMBRE_ENCARGADO, Icons.person),
                    validator: (val) =>
                        val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                    onSaved: (value) => _encargadoUnidadCentral = value,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextFormField(
                    autocorrect: false,
                    controller: controllerFechaUnidadCentral,
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                          icon: Icon(Icons.date_range),
                          onPressed: () {
                            _selectDate(context);
                            setState(() {
                              //_saveDate = new DateFormat.yMd(_dateTime)
                            });
                          }),
                      contentPadding: EdgeInsets.all(16.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                      ),
                      labelText: CONST_FECHA,
                      labelStyle: TextStyle(
                          color: Colors.black54,
                          fontSize: 16.0,
                          decorationStyle: TextDecorationStyle.wavy),
                    ),
                    validator: (val) =>
                        val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                    onSaved: (value) => _fechaUnidadCentral = value,
                    //initialValue: '$_fechaMonitor',
                  ),
                ),
              ],
            ),
          )),
    );
  }

  Step _formMotherboard() {
    return Step(
        title: Text(
          CONST_MOTHERBOARD,
          style: TextStyle(
            color: Colors.black45,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Form(
            key: formKeyMotherboard,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerNumInventarioMotherboard,
                      autocorrect: false,
                      decoration: _defaulImputDecoration(
                          NUM_INVENTARIO, Icons.drag_handle),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _numInvMotherboard = value,
                      autovalidate: true,
                      keyboardType: TextInputType.numberWithOptions(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerMarcaMotherboard,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(MARCA, Icons.drag_handle),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _marcaMotherboard = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerModeloMotherboard,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(MODELO, Icons.drag_handle),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _modeloMotherboard = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerTipoMotherboard,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(TIPO, Icons.drag_handle),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _tipoMotherboard = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerDetallesMotherboard,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(DETALLES, Icons.drag_handle),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _detallesMotherboard = value,
                      //onSaved: (value) => valueSaveMotherboard( saveDetalles: value),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerEncargadoMotherboard,
                      autocorrect: false,
                      decoration: _defaulImputDecoration(
                          NOMBRE_ENCARGADO, Icons.person),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _encargadoMotherboard = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      autocorrect: false,
                      controller: controllerFechaMotherboard,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(Icons.date_range),
                            onPressed: () {
                              _selectDate(context);
                              setState(() {
                                //_saveDate = new DateFormat.yMd(_dateTime)
                              });
                            }),
                        contentPadding: EdgeInsets.all(16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelText: 'Fecha',
                        labelStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                            decorationStyle: TextDecorationStyle.wavy),
                      ),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _fechaMotherboard = value,
                      //initialValue: '$_fechaMonitor',
                    ),
                  ),
                ],
              ),
            )));
  }

  Step _formRam() {
    return Step(
        title: Text(
          CONST_RAM,
          style: TextStyle(
            color: Colors.black45,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Form(
            key: formKeyRam,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerNumInventarioRam,
                      autocorrect: false,
                      decoration: _defaulImputDecoration(
                          NUM_INVENTARIO, Icons.drag_handle),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _numInvRam = value,
                      autovalidate: true,
                      keyboardType: TextInputType.numberWithOptions(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerMarcaRam,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(MARCA, Icons.drag_handle),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _marcaRam = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerModeloRam,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(MODELO, Icons.drag_handle),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _modeloRam = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerTipoRam,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(TIPO, Icons.drag_handle),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _tipoRam = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerDetallesRam,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(DETALLES, Icons.drag_handle),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _detallesRam = value,
                      //onSaved: (value) => valueSaveMotherboard( saveDetalles: value),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      autocorrect: false,
                      controller: controllerFechaRam,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(Icons.date_range),
                            onPressed: () {
                              _selectDate(context);
                              setState(() {
                                //_saveDate = new DateFormat.yMd(_dateTime)
                              });
                            }),
                        contentPadding: EdgeInsets.all(16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelText: 'Fecha',
                        labelStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                            decorationStyle: TextDecorationStyle.wavy),
                      ),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _fechaRam = value,
                      //initialValue: '$_fechaMonitor',
                    ),
                  ),
                ],
              ),
            )));
  }

  Step _formHdd() {
    return Step(
        title: Text(
          CONST_HDD,
          style: TextStyle(
            color: Colors.black45,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Form(
            key: formKeyHdd,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerNumInventarioHdd,
                      autocorrect: false,
                      decoration: _defaulImputDecoration(
                          NUM_INVENTARIO, Icons.drag_handle),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _numInvHdd = value,
                      autovalidate: true,
                      keyboardType: TextInputType.numberWithOptions(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerMarcaHdd,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(MARCA, Icons.drag_handle),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _marcaHdd = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerModeloHdd,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(MODELO, Icons.drag_handle),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _modeloHdd = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerTipoHdd,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(TIPO, Icons.drag_handle),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _tipoHdd = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerDetallesHdd,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(DETALLES, Icons.drag_handle),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _detallesHdd = value,
                      //onSaved: (value) => valueSaveMotherboard( saveDetalles: value),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      autocorrect: false,
                      controller: controllerFechaHdd,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(Icons.date_range),
                            onPressed: () {
                              _selectDate(context);
                              setState(() {
                                //_saveDate = new DateFormat.yMd(_dateTime)
                              });
                            }),
                        contentPadding: EdgeInsets.all(16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelText: 'Fecha',
                        labelStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                            decorationStyle: TextDecorationStyle.wavy),
                      ),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _fechaHdd = value,
                      //initialValue: '$_fechaMonitor',
                    ),
                  ),
                ],
              ),
            )));
  }

  Step _formMonitor() {
    return Step(
        title: Text(
          CONST_MONITOR,
          style: TextStyle(
            color: Colors.black45,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Form(
            key: formKeyMonitor,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerNumInventarioMonitor,
                      autocorrect: false,
                      decoration: _defaulImputDecoration(
                          NUM_INVENTARIO, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _numInvMonitor = value,
                      autovalidate: true,
                      keyboardType: TextInputType.numberWithOptions(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerMarcaMonitor,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(MARCA, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _marcaMonitor = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerModeloMonitor,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(MODELO, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _modeloMonitor = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerTipoMonitor,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(TIPO, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _tipoMonitor = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerDetallesMonitor,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(DETALLES, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _detallesMonitor = value,
                      //onSaved: (value) => valueSaveMotherboard( saveDetalles: value),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      autocorrect: false,
                      controller: controllerFechaMonitor,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(Icons.date_range),
                            onPressed: () {
                              _selectDate(context);
                              setState(() {
                                //_saveDate = new DateFormat.yMd(_dateTime)
                              });
                            }),
                        contentPadding: EdgeInsets.all(16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelText: 'Fecha',
                        labelStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                            decorationStyle: TextDecorationStyle.wavy),
                      ),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _fechaMonitor = value,
                      //initialValue: '$_fechaMonitor',
                    ),
                  ),
                ],
              ),
            )));
  }

  Step _formTeclado() {
    return Step(
        title: Text(
          CONST_TECLADO,
          style: TextStyle(
            color: Colors.black45,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Form(
            key: formKeyTeclado,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerNumInventarioTeclado,
                      autocorrect: false,
                      decoration: _defaulImputDecoration(
                          NUM_INVENTARIO, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _numInvTeclado = value,
                      autovalidate: true,
                      keyboardType: TextInputType.numberWithOptions(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerMarcaTeclado,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(MARCA, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _marcaTeclado = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerModeloTeclado,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(MODELO, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _modeloTeclado = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerTipoTeclado,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(TIPO, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _tipoTeclado = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerDetallesTeclado,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(DETALLES, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _detallesTeclado = value,
                      //onSaved: (value) => valueSaveMotherboard( saveDetalles: value),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      autocorrect: false,
                      controller: controllerFechaTeclado,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(Icons.date_range),
                            onPressed: () {
                              _selectDate(context);
                              setState(() {
                                //_saveDate = new DateFormat.yMd(_dateTime)
                              });
                            }),
                        contentPadding: EdgeInsets.all(16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelText: 'Fecha',
                        labelStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                            decorationStyle: TextDecorationStyle.wavy),
                      ),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _fechaTeclado = value,
                      //initialValue: '$_fechaTeclado',
                    ),
                  ),
                ],
              ),
            )));
  }

  Step _formBocina() {
    return Step(
        title: Text(
          CONST_BOCINA,
          style: TextStyle(
            color: Colors.black45,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Form(
            key: formKeyBocina,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerNumInventarioBocina,
                      autocorrect: false,
                      decoration: _defaulImputDecoration(
                          NUM_INVENTARIO, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _numInvBocina = value,
                      autovalidate: true,
                      keyboardType: TextInputType.numberWithOptions(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerMarcaBocina,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(MARCA, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _marcaBocina = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerModeloBocina,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(MODELO, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _modeloBocina = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerTipoBocina,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(TIPO, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _tipoBocina = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerDetallesBocina,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(DETALLES, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _detallesBocina = value,
                      //onSaved: (value) => valueSaveMotherboard( saveDetalles: value),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      autocorrect: false,
                      controller: controllerFechaBocina,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(Icons.date_range),
                            onPressed: () {
                              _selectDate(context);
                              setState(() {
                                //_saveDate = new DateFormat.yMd(_dateTime)
                              });
                            }),
                        contentPadding: EdgeInsets.all(16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelText: 'Fecha',
                        labelStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                            decorationStyle: TextDecorationStyle.wavy),
                      ),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _fechaBocina = value,
                      //initialValue: '$_fechaBocina',
                    ),
                  ),
                ],
              ),
            )));
  }

  Step _formMouse() {
    return Step(
        title: Text(
          CONST_MOUSE,
          style: TextStyle(
            color: Colors.black45,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Form(
            key: formKeyMouse,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerNumInventarioMouse,
                      autocorrect: false,
                      decoration: _defaulImputDecoration(
                          NUM_INVENTARIO, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _numInvMouse = value,
                      autovalidate: true,
                      keyboardType: TextInputType.numberWithOptions(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerMarcaMouse,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(MARCA, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _marcaMouse = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerModeloMouse,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(MODELO, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _modeloMouse = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerTipoMouse,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(TIPO, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _tipoMouse = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerDetallesMouse,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(DETALLES, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _detallesMouse = value,
                      //onSaved: (value) => valueSaveMotherboard( saveDetalles: value),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      autocorrect: false,
                      controller: controllerFechaMouse,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(Icons.date_range),
                            onPressed: () {
                              _selectDate(context);
                              setState(() {
                                //_saveDate = new DateFormat.yMd(_dateTime)
                              });
                            }),
                        contentPadding: EdgeInsets.all(16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelText: 'Fecha',
                        labelStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                            decorationStyle: TextDecorationStyle.wavy),
                      ),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _fechaMouse = value,
                      //initialValue: '$_fechaMouse',
                    ),
                  ),
                ],
              ),
            )));
  }

  Step _formUps() {
    return Step(
        title: Text(
          CONST_UPS,
          style: TextStyle(
            color: Colors.black45,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Form(
            key: formKeyUps,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerNumInventarioUps,
                      autocorrect: false,
                      decoration: _defaulImputDecoration(
                          NUM_INVENTARIO, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _numInvUps = value,
                      autovalidate: true,
                      keyboardType: TextInputType.numberWithOptions(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerMarcaUps,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(MARCA, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _marcaUps = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerModeloUps,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(MODELO, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _modeloUps = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerTipoUps,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(TIPO, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _tipoUps = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerDetallesUps,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(DETALLES, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _detallesUps = value,
                      //onSaved: (value) => valueSaveMotherboard( saveDetalles: value),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      autocorrect: false,
                      controller: controllerFechaUps,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(Icons.date_range),
                            onPressed: () {
                              _selectDate(context);
                              setState(() {
                                //_saveDate = new DateFormat.yMd(_dateTime)
                              });
                            }),
                        contentPadding: EdgeInsets.all(16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelText: 'Fecha',
                        labelStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                            decorationStyle: TextDecorationStyle.wavy),
                      ),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _fechaUps = value,
                      //initialValue: '$_fechaUps',
                    ),
                  ),
                ],
              ),
            )));
  }

  Step _formScanner() {
    return Step(
        title: Text(
          CONST_SCANNER,
          style: TextStyle(
            color: Colors.black45,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Form(
            key: formKeyScanner,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerNumInventarioScanner,
                      autocorrect: false,
                      decoration: _defaulImputDecoration(
                          NUM_INVENTARIO, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _numInvScanner = value,
                      autovalidate: true,
                      keyboardType: TextInputType.numberWithOptions(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerMarcaScanner,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(MARCA, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _marcaScanner = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerModeloScanner,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(MODELO, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _modeloScanner = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerTipoScanner,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(TIPO, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _tipoScanner = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerDetallesScanner,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(DETALLES, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _detallesScanner = value,
                      //onSaved: (value) => valueSaveMotherboard( saveDetalles: value),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      autocorrect: false,
                      controller: controllerFechaScanner,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(Icons.date_range),
                            onPressed: () {
                              _selectDate(context);
                              setState(() {
                                //_saveDate = new DateFormat.yMd(_dateTime)
                              });
                            }),
                        contentPadding: EdgeInsets.all(16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelText: 'Fecha',
                        labelStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                            decorationStyle: TextDecorationStyle.wavy),
                      ),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _fechaScanner = value,
                      //initialValue: '$_fechaScanner',
                    ),
                  ),
                ],
              ),
            )));
  }

  Step _formImpresora() {
    return Step(
        title: Text(
          CONST_IMPRESORA,
          style: TextStyle(
            color: Colors.black45,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Form(
            key: formKeyImpresora,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerNumInventarioImpresora,
                      autocorrect: false,
                      decoration: _defaulImputDecoration(
                          NUM_INVENTARIO, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _numInvImpresora = value,
                      autovalidate: true,
                      keyboardType: TextInputType.numberWithOptions(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerMarcaImpresora,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(MARCA, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _marcaImpresora = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerModeloImpresora,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(MODELO, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _modeloImpresora = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerTipoImpresora,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(TIPO, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _tipoImpresora = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerDetallesImpresora,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(DETALLES, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _detallesImpresora = value,
                      //onSaved: (value) => valueSaveMotherboard( saveDetalles: value),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      autocorrect: false,
                      controller: controllerFechaImpresora,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(Icons.date_range),
                            onPressed: () {
                              _selectDate(context);
                              setState(() {
                                //_saveDate = new DateFormat.yMd(_dateTime)
                              });
                            }),
                        contentPadding: EdgeInsets.all(16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelText: 'Fecha',
                        labelStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                            decorationStyle: TextDecorationStyle.wavy),
                      ),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _fechaImpresora = value,
                      //initialValue: '$_fechaImpresora',
                    ),
                  ),
                ],
              ),
            )));
  }

  Step _formTablet() {
    return Step(
        title: Text(
          CONST_TABLET,
          style: TextStyle(
            color: Colors.black45,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Form(
            key: formKeyTablet,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerNumInventarioTablet,
                      autocorrect: false,
                      decoration: _defaulImputDecoration(
                          NUM_INVENTARIO, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _numInvTablet = value,
                      autovalidate: true,
                      keyboardType: TextInputType.numberWithOptions(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerMarcaTablet,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(MARCA, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _marcaTablet = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerModeloTablet,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(MODELO, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _modeloTablet = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerTipoTablet,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(TIPO, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _tipoTablet = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerDetallesTablet,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(DETALLES, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _detallesTablet = value,
                      //onSaved: (value) => valueSaveMotherboard( saveDetalles: value),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      autocorrect: false,
                      controller: controllerFechaTablet,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(Icons.date_range),
                            onPressed: () {
                              _selectDate(context);
                              setState(() {
                                //_saveDate = new DateFormat.yMd(_dateTime)
                              });
                            }),
                        contentPadding: EdgeInsets.all(16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelText: 'Fecha',
                        labelStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                            decorationStyle: TextDecorationStyle.wavy),
                      ),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _fechaTablet = value,
                      //initialValue: '$_fechaTablet',
                    ),
                  ),
                ],
              ),
            )));
  }

  Step _formLaptop() {
    return Step(
        title: Text(
          CONST_LAPTOP,
          style: TextStyle(
            color: Colors.black45,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Form(
            key: formKeyLaptop,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerNumInventarioLaptop,
                      autocorrect: false,
                      decoration: _defaulImputDecoration(
                          NUM_INVENTARIO, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _numInvLaptop = value,
                      autovalidate: true,
                      keyboardType: TextInputType.numberWithOptions(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerMarcaLaptop,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(MARCA, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _marcaLaptop = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerModeloLaptop,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(MODELO, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _modeloLaptop = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerTipoLaptop,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(TIPO, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _tipoLaptop = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerDetallesLaptop,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(DETALLES, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _detallesLaptop = value,
                      //onSaved: (value) => valueSaveMotherboard( saveDetalles: value),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      autocorrect: false,
                      controller: controllerFechaLaptop,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(Icons.date_range),
                            onPressed: () {
                              _selectDate(context);
                              setState(() {
                                //_saveDate = new DateFormat.yMd(_dateTime)
                              });
                            }),
                        contentPadding: EdgeInsets.all(16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelText: 'Fecha',
                        labelStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                            decorationStyle: TextDecorationStyle.wavy),
                      ),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _fechaLaptop = value,
                      //initialValue: '$_fechaLaptop',
                    ),
                  ),
                ],
              ),
            )));
  }

  Step _formMemoria() {
    return Step(
        title: Text(
          CONST_MEMORIAS_USB_SD,
          style: TextStyle(
            color: Colors.black45,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Form(
            key: formKeyMemoria,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerNumInventarioMemoria,
                      autocorrect: false,
                      decoration: _defaulImputDecoration(
                          NUM_INVENTARIO, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _numInvMemoria = value,
                      autovalidate: true,
                      keyboardType: TextInputType.numberWithOptions(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerMarcaMemoria,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(MARCA, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _marcaMemoria = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerModeloMemoria,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(MODELO, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _modeloMemoria = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerTipoMemoria,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(TIPO, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _tipoMemoria = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerDetallesMemoria,
                      autocorrect: false,
                      decoration:
                      _defaulImputDecoration(DETALLES, Icons.desktop_windows),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _detallesMemoria = value,
                      //onSaved: (value) => valueSaveMotherboard( saveDetalles: value),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      autocorrect: false,
                      controller: controllerFechaMemoria,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            icon: Icon(Icons.date_range),
                            onPressed: () {
                              _selectDate(context);
                              setState(() {
                                //_saveDate = new DateFormat.yMd(_dateTime)
                              });
                            }),
                        contentPadding: EdgeInsets.all(16.0),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                        labelText: 'Fecha',
                        labelStyle: TextStyle(
                            color: Colors.black54,
                            fontSize: 16.0,
                            decorationStyle: TextDecorationStyle.wavy),
                      ),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _fechaMemoria = value,
                      //initialValue: '$_fechaMemoria',
                    ),
                  ),
                ],
              ),
            )));
  }

  InputDecoration _defaulImputDecoration(String _labelText, IconData icon) {
    return InputDecoration(
      suffixIcon: Icon(
        icon,
        //color: Colors.lightBlueAccent,
      ),
      contentPadding: EdgeInsets.all(16.0),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25.0),
      ),
      labelText: _labelText,
      labelStyle: TextStyle(
          color: Colors.black54,
          fontSize: 16.0,
          decorationStyle: TextDecorationStyle.wavy),
    );
  }
}
