import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'package:medios_basicos/data/database_helper.dart';

import 'package:medios_basicos/constants.dart';
import 'package:medios_basicos/model/cpu_model.dart';

import 'package:medios_basicos/model/estacion_model.dart';
import 'package:medios_basicos/model/laptop_model.dart';
import 'package:medios_basicos/model/memoria_model.dart';
import 'package:medios_basicos/model/monitor_model.dart';
import 'package:medios_basicos/model/tablet_model.dart';
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

  /// Foromulario  ESTACION
  final formKeyEstacion = new GlobalKey<FormState>();
  String _nombreEstacion,
      _areaEstacion,
      _encargadoEstacion;

  final TextEditingController controllerNombreEstacion =
      new TextEditingController();
  final TextEditingController controllerAreaEstacion =
  new TextEditingController();
  final TextEditingController controllerEncargadoEstacion =
  new TextEditingController();

  /// Foromulario  UNIDAD CENTRAL
  final formKeyUnidadCentral = new GlobalKey<FormState>();
  String _numInvUnidadCentral,
      _selloUnidadCentral,
      _estadoUnidadCentral,
      _fechaUnidadCentral;

  final TextEditingController controllerNumInventarioUnidadCentral =
      new TextEditingController();
  final TextEditingController controllerSelloUnidadCentral =
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
      _estadoMotherboard,
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

  /// Foromulario  CPU
  final formKeyCpu = new GlobalKey<FormState>();
  String _numInvCpu,
      _marcaCpu,
      _modeloCpu,
      _tipoCpu,
      _detallesCpu,
      _estadoCpu,
      _fechaCpu;

  final TextEditingController controllerNumInventarioCpu =
      new TextEditingController();
  final TextEditingController controllerMarcaCpu = new TextEditingController();
  final TextEditingController controllerModeloCpu = new TextEditingController();
  final TextEditingController controllerTipoCpu = new TextEditingController();
  final TextEditingController controllerDetallesCpu =
      new TextEditingController();
  final TextEditingController controllerFechaCpu = new TextEditingController();

  /// Foromulario  RAM
  final formKeyRam = new GlobalKey<FormState>();
  String _numInvRam,
      _marcaRam,
      _modeloRam,
      _tipoRam,
      _detallesRam,
      _estadoRam,
      _fechaRam;

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
  String _numInvHdd,
      _marcaHdd,
      _modeloHdd,
      _tipoHdd,
      _detallesHdd,
      _estadoHdd,
      _fechaHdd;

  final TextEditingController controllerNumInventarioHdd =
      new TextEditingController();
  final TextEditingController controllerMarcaHdd = new TextEditingController();
  final TextEditingController controllerModeloHdd = new TextEditingController();
  final TextEditingController controllerTipoHdd = new TextEditingController();
  final TextEditingController controllerDetallesHdd =
      new TextEditingController();
  final TextEditingController controllerFechaHdd = new TextEditingController();

  /// Foromulario  DVD-RW
  final formKeyDvdRw = new GlobalKey<FormState>();
  String _numInvDvdRw,
      _marcaDvdRw,
      _modeloDvdRw,
      _tipoDvdRw,
      _detallesDvdRw,
      _estadoDvdRw,
      _fechaDvdRw;

  final TextEditingController controllerNumInventarioDvdRw =
      new TextEditingController();
  final TextEditingController controllerMarcaDvdRw =
      new TextEditingController();
  final TextEditingController controllerModeloDvdRw =
      new TextEditingController();
  final TextEditingController controllerTipoDvdRw = new TextEditingController();
  final TextEditingController controllerDetallesDvdRw =
      new TextEditingController();
  final TextEditingController controllerFechaDvdRw =
      new TextEditingController();

  /// Foromulario  MONITOR
  final formKeyMonitor = new GlobalKey<FormState>();
  String _numInvMonitor,
      _marcaMonitor,
      _modeloMonitor,
      _tipoMonitor,
      _detallesMonitor,
      _estadoMonitor,
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
      _estadoTeclado,
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
      _estadoBocina,
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
      _estadoMouse,
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
  String _numInvUps,
      _marcaUps,
      _modeloUps,
      _tipoUps,
      _detallesUps,
      _estadoUps,
      _fechaUps;

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
      _estadoScanner,
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
      _estadoImpresora,
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
  String _estadoTablet = 'BIEN';

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
      _estadoLaptop,
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
      _estadoMemoria,
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
  Cpu _cpu;
  Ram _ram;
  Hdd _hdd;
  DvdRw _dvdRw;

  DBHelper dbHelper;
  Future<List<Tablet>> listTablets;

  Monitor _monitor;
  Teclado _teclado;
  Bocina _bocina;
  Mouse _mouse;
  Ups _ups;
  Scanner _scanner;
  Impresora _impresora;

  Tablet _tablet;
  Laptop _laptop;
  Memoria _memoria;

  bool createUc = false;
  bool createEstacion = false;
  bool createMotherboard = false;
  bool createCpu = false;
  bool createRam = false;
  bool createHdd = false;
  bool createDvdRw = false;
  bool createMonitor = false;
  bool createTeclado = false;
  bool createBocina = false;
  bool createMouse = false;
  bool createUps = false;
  bool createScanner = false;
  bool createImpresora = false;
  bool createTablet = false;
  bool createLaptop = false;
  bool createMemoria = false;

  @override
  void initState() {
    super.initState();
    dbHelper = DBHelper();

    _addsItemsInToLists();

    if (controllerFechaUnidadCentral.text.isEmpty) {
      controllerFechaUnidadCentral.text = _dateFormat.format(_dateTime);
    }
    if (controllerFechaMotherboard.text.isEmpty) {
      controllerFechaMotherboard.text = _dateFormat.format(_dateTime);
    }
    if (controllerFechaCpu.text.isEmpty) {
      controllerFechaCpu.text = _dateFormat.format(_dateTime);
    }
    if (controllerFechaRam.text.isEmpty) {
      controllerFechaRam.text = _dateFormat.format(_dateTime);
    }
    if (controllerFechaHdd.text.isEmpty) {
      controllerFechaHdd.text = _dateFormat.format(_dateTime);
    }
    if (controllerFechaDvdRw.text.isEmpty) {
      controllerFechaDvdRw.text = _dateFormat.format(_dateTime);
    }
    if (controllerFechaMonitor.text.isEmpty) {
      controllerFechaMonitor.text = _dateFormat.format(_dateTime);
    }
    if (controllerFechaTeclado.text.isEmpty) {
      controllerFechaTeclado.text = _dateFormat.format(_dateTime);
    }
    if (controllerFechaBocina.text.isEmpty) {
      controllerFechaBocina.text = _dateFormat.format(_dateTime);
    }
    if (controllerFechaMouse.text.isEmpty) {
      controllerFechaMouse.text = _dateFormat.format(_dateTime);
    }
    if (controllerFechaScanner.text.isEmpty) {
      controllerFechaScanner.text = _dateFormat.format(_dateTime);
    }
    if (controllerFechaImpresora.text.isEmpty) {
      controllerFechaImpresora.text = _dateFormat.format(_dateTime);
    }
    if (controllerFechaTablet.text.isEmpty) {
      controllerFechaTablet.text = _dateFormat.format(_dateTime);
    }
    if (controllerFechaLaptop.text.isEmpty) {
      controllerFechaLaptop.text = _dateFormat.format(_dateTime);
    }
    if (controllerFechaMemoria.text.isEmpty) {
      controllerFechaMemoria.text = _dateFormat.format(_dateTime);
    }
//    _fechaCpu = _dateFormat.format(_dateTime);
//    _fechaRam = _dateFormat.format(_dateTime);
//    _fechaHdd = _dateFormat.format(_dateTime);
//    _fechaMonitor = _dateFormat.format(_dateTime);
//    _fechaTeclado = _dateFormat.format(_dateTime);
//    _fechaBocina = _dateFormat.format(_dateTime);
//    _fechaMouse = _dateFormat.format(_dateTime);
//    _fechaScanner = _dateFormat.format(_dateTime);
//    _fechaImpresora = _dateFormat.format(_dateTime);
//    _fechaTablet = _dateFormat.format(_dateTime);
//    _fechaLaptop = _dateFormat.format(_dateTime);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Formulario'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.bug_report),
            onPressed: () {
              dbHelper.getAllTablets();
              //print(listTablets);
            },
          ),
        ],
      ),
      body: Container(
        child: Stepper(
          steps: listSteps,
          //type: StepperType.horizontal,
          currentStep: this._currentStep,
          onStepContinue: () {
            setState(() {
              if (buildListSteps[_currentStep] != CONST_STEP_GUARDAR) {
                print('Escalon: $_currentStep');
                _debugValidatorFrom(buildListSteps[_currentStep]);
              } else {
                //_currentStep = 0;
                // Este es el ultimo escalon de la lista
                //Aqui implementamos la accion de guardar los datos recogidos en los formularios
                print('Fin del la lista. Este es el ultimo elemento');

                /// Reglas para guardar los formularios en DB

                //Creando Tablet Laptop Memoria
                if (createTablet) {
                  print("Construllendo TABLET");
//                  _tablet = Tablet(
//                      _numInvTablet,
//                      _marcaTablet,
//                      _modeloTablet,
//                      _tipoTablet,
//                      _detallesTablet,
//                      _estadoTablet,
//                      _encargadoTablet,
//                      _fechaTablet);
//                  // Guardar en la base de datos
//                  dbHelper.saveTablet(_tablet);
                  //print(_tablet);
                }
                if (createLaptop) {
                  print("Construllendo LAPTOP");
//                  _laptop = Laptop(
//                      _numInvLaptop,
//                      _marcaLaptop,
//                      _modeloLaptop,
//                      _tipoLaptop,
//                      _detallesLaptop,
//                      _estadoLaptop,
//                      _encargadoLaptop,
//                      _fechaLaptop);
//                  // Guardar en la base de datos
//                  //print(_laptop);
//                  dbHelper.saveLaptop(_laptop);
                }
                if (createMemoria) {
                  print("Construllendo MEMORIA");
//                  _memoria = Memoria(
//                      _numInvMemoria,
//                      _marcaMemoria,
//                      _modeloMemoria,
//                      _tipoMemoria,
//                      _detallesMemoria,
//                      _estadoMemoria,
//                      _encargadoMemoria,
//                      _fechaMemoria);
//                  // Guardar en la base de datos
//                  //print(_memoria);
//                  dbHelper.saveMemoria(_memoria);
                }

                /// Creamos la ESTACION despues de saber cuales son las
                /// obciones que seleciono el usuario a guardar
                if (createEstacion && createUc) {
                  buildUnidadCentral();
                  print("         CONSTRUIDA ESTACION DE TRABAJO");
                  print("----------------------END----------------------");
                }else  if(createEstacion && createUc && createMonitor){
                  buildUnidadCentral();
                  buildMonitor();
                  print("         CONSTRUIDA ESTACION DE TRABAJO");
                  print("----------------------END----------------------");
                }else if(createEstacion && createUc && createMonitor
                    && createTeclado){
                  buildUnidadCentral();
                  buildMonitor();
                  buildTeclado();
                  print("         CONSTRUIDA ESTACION DE TRABAJO");
                  print("----------------------END----------------------");
                }else if(createEstacion && createUc && createMonitor
                    && createTeclado && createBocina){
                  buildUnidadCentral();
                  buildMonitor();
                  buildTeclado();
                  buildBocina();
                  print("         CONSTRUIDA ESTACION DE TRABAJO");
                  print("----------------------END----------------------");
                }else if(createEstacion && createUc && createMonitor
                    && createTeclado && createBocina && createMouse){
                  buildUnidadCentral();
                  buildMonitor();
                  buildTeclado();
                  buildBocina();
                  buildMouse();
                  print("         CONSTRUIDA ESTACION DE TRABAJO");
                  print("----------------------END----------------------");
                }else if(createEstacion && createUc && createMonitor
                    && createTeclado && createBocina && createMouse && createUps ){
                  buildUnidadCentral();
                  buildMonitor();
                  buildTeclado();
                  buildBocina();
                  buildMouse();
                  buildUps();
                  print("         CONSTRUIDA ESTACION DE TRABAJO");
                  print("----------------------END----------------------");
                }else if(createEstacion && createUc && createMonitor
                    && createTeclado && createBocina && createMouse && createImpresora ){
                  buildUnidadCentral();
                  buildMonitor();
                  buildTeclado();
                  buildBocina();
                  buildMouse();
                  buildImpresora();
                  print("         CONSTRUIDA ESTACION DE TRABAJO");
                  print("----------------------END----------------------");
                }else if(createEstacion && createUc && createMonitor
                    && createTeclado && createBocina && createMouse && createScanner ){
                  buildUnidadCentral();
                  buildMonitor();
                  buildTeclado();
                  buildBocina();
                  buildMouse();
                  buildScanner();
                  print("         CONSTRUIDA ESTACION DE TRABAJO");
                  print("----------------------END----------------------");
                }else if(createEstacion && createUc && createMonitor
                    && createTeclado && createBocina && createMouse && createUps
                && createScanner){
                  buildUnidadCentral();
                  buildMonitor();
                  buildTeclado();
                  buildBocina();
                  buildMouse();
                  buildUps();
                  buildScanner();
                  print("         CONSTRUIDA ESTACION DE TRABAJO");
                  print("----------------------END----------------------");
                }else if(createEstacion && createUc && createMonitor
                    && createTeclado && createBocina && createMouse && createUps
                    && createImpresora){
                  buildUnidadCentral();
                  buildMonitor();
                  buildTeclado();
                  buildBocina();
                  buildMouse();
                  buildUps();
                  buildImpresora();
                  print("         CONSTRUIDA ESTACION DE TRABAJO");
                  print("----------------------END----------------------");
                }else if(createEstacion && createUc && createMonitor
                    && createTeclado && createBocina && createMouse && createUps
                && createScanner && createImpresora){
                  buildUnidadCentral();
                  buildMonitor();
                  buildTeclado();
                  buildBocina();
                  buildMouse();
                  buildUps();
                  buildScanner();
                  buildImpresora();
                  print("         CONSTRUIDA ESTACION DE TRABAJO");
                  print("----------------------END----------------------");
                }
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

  void buildUnidadCentral() {
    if (createUc &&
        createMotherboard &&
        createCpu &&
        createRam &&
        createHdd &&
        createDvdRw) {
      print("---------------------START---------------------");
      print("    Construllendo UNIDAD CENTRAL COMPLETA");
      buildMotherboardCpuRam();
      buildHdd();
      buildDvdRw();
      print("----------------------END----------------------");
    } else if (createUc &&
        createMotherboard &&
        createCpu &&
        createRam &&
        createHdd &&
        !createDvdRw) {
      print("---------------------START---------------------");
      print("   Construllendo UNIDAD CENTRAL SIN DVD-RW");
      buildMotherboardCpuRam();
      buildHdd();
      print("---------------------------------------------");
    }
    print("         Construida UNIDAD CENTRAL");
    print("----------------------END----------------------");

//    _unidadCentral = UnidadCentral(
//        _numInvUnidadCentral,
//        _selloUnidadCentral,
//        _areaUnidadCentral,
//        _encargadoUnidadCentral,
//        _motherboard.idMotherboard,
//        _cpu.idCpu,
//        _ram.idRam,
//        _hdd.idHdd,
//        _dvdRw.idDvdRw,
//        _fechaUnidadCentral);
  }

  void buildDvdRw() {
    print("Construllendo DVD-RW");
//    _dvdRw = DvdRw(_numInvDvdRw, _marcaDvdRw, _modeloDvdRw, _tipoDvdRw,
//        _detallesDvdRw, _estadoDvdRw, _fechaDvdRw);
  }

  void buildHdd() {
    print("Construllendo HDD");

//    _hdd = Hdd(_numInvHdd, _marcaHdd, _modeloHdd, _tipoHdd, _detallesHdd,
//        _estadoHdd, _fechaHdd);
  }

  void buildMotherboardCpuRam() {
    print("Construllendo MODULO = MOTHERBOARD-RAM-CPU");
    if (createMotherboard && createCpu && createRam) {
      buildMotherboard();
      buildCpu();
      buildRam();
    } else if (createMotherboard && !createCpu && !createRam) {
      print("Construllendo SOLO MOTHERBOARD");
      buildMotherboard();
    } else if (!createMotherboard && createCpu && !createRam) {
      buildCpu();
      print("Construllendo SOLO CPU");
    } else if (!createMotherboard && !createCpu && createRam) {
      buildRam();
      print("Construllendo SOLO RAM");
    }
  }

  void buildRam() {
    print("Construllendo RAM");
//    _ram = Ram(_numInvRam, _marcaRam, _modeloRam, _tipoRam, _detallesRam,
//        _estadoRam, _fechaRam);
  }

  void buildCpu() {
    print("Construllendo CPU");
//    _cpu = Cpu(_numInvCpu, _marcaCpu, _modeloCpu, _tipoCpu, _detallesCpu,
//        _estadoCpu, _fechaCpu);
  }

  void buildMotherboard() {
    print("Construllendo MOTHERBOARD ");
//
//    _motherboard = Motherboard( _numInvMotherboard,
//        _marcaMotherboard, _modeloMotherboard, _tipoMotherboard,
//        _detallesMotherboard, _estadoMotherboard, _fechaMotherboard);
  }

  void buildImpresora() {
    if (createImpresora) {
      print("Construllendo IMPRESORA ");
//      _impresora = Impresora(
//          _numInvImpresora,
//          _marcaImpresora,
//          _modeloImpresora,
//          _tipoImpresora,
//          _detallesImpresora,
//          _estadoImpresora,
//          _fechaImpresora);
    }
  }

  void buildScanner() {
    if (createScanner) {
      print("Construllendo SCANNER ");
//      _scanner = Scanner(_numInvScanner, _marcaScanner, _modeloScanner,
//          _tipoScanner, _detallesScanner, _estadoScanner, _fechaScanner);
    }
  }

  void buildUps() {
    if (createUps) {
      print("Construllendo UPS ");
//      _ups = Ups(_numInvUps, _marcaUps, _modeloUps, _tipoUps, _detallesUps,
//          _estadoUps, _fechaUps);
    }
  }

  void buildMouse() {
    if (createMouse) {
      print("Construllendo MOUSE ");

//      _mouse = Mouse(_numInvMouse, _marcaMouse, _modeloMouse, _tipoMouse,
//          _detallesMouse, _estadoMouse, _fechaMouse);
    }
  }

  void buildBocina() {
    if (createBocina) {
      print("Construllendo BOCINA");
//      _bocina = Bocina(_numInvBocina, _marcaBocina, _modeloBocina, _tipoBocina,
//          _detallesBocina, _estadoBocina, _fechaBocina);
    }
  }

  void buildTeclado() {
    if (createTeclado) {
      print("Construllendo TECLADO");
//      _teclado = Teclado(_numInvTeclado, _marcaTeclado, _modeloTeclado,
//          _tipoTeclado, _detallesTeclado, _estadoTeclado, _fechaTeclado);
    }
  }

  void buildMonitor() {
    if (createMonitor) {
      print("Construllendo MONITOR ");
//      _monitor = Monitor(_numInvMonitor, _marcaMonitor, _modeloMonitor,
//          _tipoMonitor, _detallesMonitor, _estadoMonitor, _fechaMonitor);
    }
  }

  void _debugValidatorFrom(String caseValite) {
    var formEstacion = formKeyEstacion.currentState;
    var formUc = formKeyUnidadCentral.currentState;
    var formMotherboard = formKeyMotherboard.currentState;
    var formCpu = formKeyCpu.currentState;
    var formRam = formKeyRam.currentState;
    var formHdd = formKeyHdd.currentState;
    var formDvdRw = formKeyDvdRw.currentState;
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
    print('Folmulario actual es: ' + buildListSteps[_currentStep + 1]);
    int size = buildListSteps.length;

    switch (caseValite) {
      case CONST_ESTACION:
        if (formEstacion.validate()) {
          formEstacion.save();
          createEstacion = true;
          _currentStep = _currentStep + 1;
        }
        break;
      case CONST_UNIDAD_CENTRAL:
        if (formUc.validate()) {
          formUc.save();
          createUc = true;
          _currentStep = _currentStep + 1;
        }
        break;
      case CONST_MOTHERBOARD:
        if (formMotherboard.validate()) {
          createMotherboard = true;
          _currentStep = _currentStep + 1;
        }
        break;
      case CONST_CPU:
        if (formCpu.validate()) {
          formCpu.save();
          createCpu = true;
          _currentStep = _currentStep + 1;
        }
        break;
      case CONST_RAM:
        if (formRam.validate()) {
          formRam.save();
          createRam = true;
          _currentStep = _currentStep + 1;
        }
        break;
      case CONST_HDD:
        if (formHdd.validate()) {
          formHdd.save();
          createHdd = true;
          _currentStep = _currentStep + 1;
        }
        break;
      case CONST_DVD_RW:
        if (formDvdRw.validate()) {
          formDvdRw.save();
          createDvdRw = true;
          _currentStep = _currentStep + 1;
        }
        break;
      case CONST_MONITOR:
        if (formMonitor.validate()) {
          formMonitor.save();
          createMonitor = true;
          _currentStep = _currentStep + 1;
        }
        break;
      case CONST_TECLADO:
        if (formTeclado.validate()) {
          formTeclado.save();
          createTeclado = true;
          _currentStep = _currentStep + 1;
        }
        break;
      case CONST_BOCINA:
        if (formBocina.validate()) {
          formBocina.save();
          createBocina = true;
          _currentStep = _currentStep + 1;
        }
        break;
      case CONST_MOUSE:
        if (formMouse.validate()) {
          formMouse.save();
          createMouse = true;
          _currentStep = _currentStep + 1;
        }
        break;
      case CONST_UPS:
        if (formUps.validate()) {
          formUps.save();
          createUps = true;
          _currentStep = _currentStep + 1;
        }
        break;
      case CONST_SCANNER:
        if (formScanner.validate()) {
          formScanner.save();
          createScanner = true;
          _currentStep = _currentStep + 1;
        }
        break;
      case CONST_IMPRESORA:
        if (formImpresora.validate()) {
          formImpresora.save();
          createImpresora = true;
          _currentStep = _currentStep + 1;
        }
        break;
      case CONST_TABLET:
        if (formTablet.validate()) {
          formTablet.save();
          createTablet = true;
          _currentStep = _currentStep + 1;
        }
        break;
      case CONST_LAPTOP:
        if (formLaptop.validate()) {
          formLaptop.save();
          createLaptop = true;
          _currentStep = _currentStep + 1;
        }
        break;
      case CONST_MEMORIAS_USB_SD:
        if (formMemoria.validate()) {
          formMemoria.save();
          createMemoria = true;
          _currentStep = _currentStep + 1;
        }
        break;
    }
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
        String textDate = _dateFormat.format(piked);

        if (buildListSteps[_currentStep] == CONST_UNIDAD_CENTRAL) {
          _fechaUnidadCentral = textDate;
          controllerFechaUnidadCentral.text = textDate;
        }
        if (buildListSteps[_currentStep] == CONST_MOTHERBOARD) {
          _fechaMotherboard = textDate;
          controllerFechaMotherboard.text = textDate;
        }
        if (buildListSteps[_currentStep] == CONST_CPU) {
          _fechaCpu = textDate;
          controllerFechaCpu.text = textDate;
        }
        if (buildListSteps[_currentStep] == CONST_RAM) {
          _fechaRam = textDate;
          controllerFechaRam.text = textDate;
        }
        if (buildListSteps[_currentStep] == CONST_HDD) {
          _fechaHdd = _dateFormat.format(piked);
          controllerFechaHdd.text = _fechaHdd;
        }
        if (buildListSteps[_currentStep] == CONST_DVD_RW) {
          _fechaDvdRw = _dateFormat.format(piked);
          controllerFechaDvdRw.text = _fechaDvdRw;
        }
        if (buildListSteps[_currentStep] == CONST_MONITOR) {
          _fechaMonitor = _dateFormat.format(piked);
          controllerFechaMonitor.text = _fechaMonitor;
        }
        if (buildListSteps[_currentStep] == CONST_TECLADO) {
          _fechaTeclado = _dateFormat.format(piked);
          controllerFechaTeclado.text = _fechaTeclado;
        }
        if (buildListSteps[_currentStep] == CONST_BOCINA) {
          _fechaBocina = _dateFormat.format(piked);
          controllerFechaBocina.text = _fechaBocina;
        }
        if (buildListSteps[_currentStep] == CONST_MOUSE) {
          _fechaMouse = _dateFormat.format(piked);
          controllerFechaMouse.text = _fechaMouse;
        }
        if (buildListSteps[_currentStep] == CONST_SCANNER) {
          _fechaScanner = _dateFormat.format(piked);
          controllerFechaScanner.text = _fechaScanner;
        }
        if (buildListSteps[_currentStep] == CONST_IMPRESORA) {
          _fechaImpresora = _dateFormat.format(piked);
          controllerFechaImpresora.text = _fechaImpresora;
        }
        if (buildListSteps[_currentStep] == CONST_TABLET) {
          _fechaTablet = _dateFormat.format(piked);
          controllerFechaTablet.text = _fechaTablet;
        }
        if (buildListSteps[_currentStep] == CONST_LAPTOP) {
          _fechaLaptop = _dateFormat.format(piked);
          controllerFechaLaptop.text = _fechaLaptop;
        }
        if (buildListSteps[_currentStep] == CONST_MEMORIAS_USB_SD) {
          _fechaMemoria = _dateFormat.format(piked);
          controllerFechaMemoria.text.isEmpty;
        }
      });
    }
  }

  Step _buildStepsView(String value) {
    switch (value) {
      case CONST_ESTACION:
        return _formEstacion();

      case CONST_UNIDAD_CENTRAL:
        return _defaulFromUnidadCentral();

      case CONST_MOTHERBOARD:
        return _formMotherboard();

      case CONST_CPU:
        return _formCpu();

      case CONST_RAM:
        return _formRam();

      case CONST_HDD:
        return _formHdd();

      case CONST_DVD_RW:
        return _formDvdRw();

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

      case CONST_STEP_GUARDAR:
        return _formGuardar();
    }
  }

  Step _formEstacion() {
    return Step(
        title: Text(
          CONST_ESTACION,
          style: TextStyle(
            color: Colors.black45,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Form(
            key: formKeyEstacion,
            child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerNombreEstacion,
                      autocorrect: false,
                      decoration: _defaulImputDecoration(
                          NOMBRE_ESTACION, Icons.short_text),
                      validator: (val) =>
                          val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _nombreEstacion = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      autocorrect: false,
                      controller: controllerAreaEstacion,
                      decoration:
                      _defaulImputDecoration(AREA_OFICINA, Icons.location_on),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _areaEstacion = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      autocorrect: false,
                      controller: controllerEncargadoEstacion,
                      decoration:
                      _defaulImputDecoration(NOMBRE_ENCARGADO, Icons.person),
                      validator: (val) =>
                      val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _encargadoEstacion = value,
                    ),
                  ),
                ]))));
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
                    controller: controllerNumInventarioUnidadCentral,
                    autocorrect: false,
                    decoration: _defaulImputDecoration(
                        NUM_INVENTARIO, Icons.drag_handle),
                    validator: (val) =>
                        val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                    onSaved: (value) => _numInvUnidadCentral = value,
                    keyboardType: TextInputType.number,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TextFormField(
                    controller: controllerSelloUnidadCentral,
                    autocorrect: false,
                    decoration:
                        _defaulImputDecoration(NUM_SELLO, Icons.payment),
                    validator: (val) =>
                        val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                    onSaved: (value) => _selloUnidadCentral = value,
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
                          NUM_INVENTARIO, Icons.developer_board),
                      validator: (val) =>
                          val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _numInvMotherboard = value,
                      autovalidate: false,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerMarcaMotherboard,
                      autocorrect: false,
                      decoration:
                          _defaulImputDecoration(MARCA, Icons.developer_board),
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
                          _defaulImputDecoration(MODELO, Icons.developer_board),
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
                          _defaulImputDecoration(TIPO, Icons.developer_board),
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
                      decoration: _defaulImputDecoration(
                          DETALLES, Icons.developer_board),
                      validator: (val) =>
                          val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _detallesMotherboard = value,
                      //onSaved: (value) => valueSaveMotherboard( saveDetalles: value),
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

  Step _formCpu() {
    return Step(
        title: Text(
          CONST_CPU,
          style: TextStyle(
            color: Colors.black45,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Form(
            key: formKeyCpu,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerNumInventarioCpu,
                      autocorrect: false,
                      decoration: _defaulImputDecoration(
                          NUM_INVENTARIO, Icons.straighten),
                      validator: (val) =>
                          val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _numInvCpu = value,
                      autovalidate: false,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerMarcaCpu,
                      autocorrect: false,
                      decoration:
                          _defaulImputDecoration(MARCA, Icons.straighten),
                      validator: (val) =>
                          val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _marcaCpu = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerModeloCpu,
                      autocorrect: false,
                      decoration:
                          _defaulImputDecoration(MODELO, Icons.straighten),
                      validator: (val) =>
                          val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _modeloCpu = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerTipoCpu,
                      autocorrect: false,
                      decoration:
                          _defaulImputDecoration(TIPO, Icons.straighten),
                      validator: (val) =>
                          val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _tipoCpu = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerDetallesCpu,
                      autocorrect: false,
                      decoration:
                          _defaulImputDecoration(DETALLES, Icons.straighten),
                      validator: (val) =>
                          val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _detallesCpu = value,
                      //onSaved: (value) => valueSaveMotherboard( saveDetalles: value),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      autocorrect: false,
                      controller: controllerFechaCpu,
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
                      onSaved: (value) => _fechaCpu = value,
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
                          NUM_INVENTARIO, Icons.straighten),
                      validator: (val) =>
                          val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _numInvRam = value,
                      autovalidate: false,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerMarcaRam,
                      autocorrect: false,
                      decoration:
                          _defaulImputDecoration(MARCA, Icons.straighten),
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
                          _defaulImputDecoration(MODELO, Icons.straighten),
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
                          _defaulImputDecoration(TIPO, Icons.straighten),
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
                          _defaulImputDecoration(DETALLES, Icons.straighten),
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
                          NUM_INVENTARIO, Icons.call_to_action),
                      validator: (val) =>
                          val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _numInvHdd = value,
                      autovalidate: false,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerMarcaHdd,
                      autocorrect: false,
                      decoration:
                          _defaulImputDecoration(MARCA, Icons.call_to_action),
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
                          _defaulImputDecoration(MODELO, Icons.call_to_action),
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
                          _defaulImputDecoration(TIPO, Icons.call_to_action),
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
                      decoration: _defaulImputDecoration(
                          DETALLES, Icons.call_to_action),
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

  Step _formDvdRw() {
    return Step(
        title: Text(
          CONST_DVD_RW,
          style: TextStyle(
            color: Colors.black45,
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        content: Form(
            key: formKeyDvdRw,
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerNumInventarioDvdRw,
                      autocorrect: false,
                      decoration:
                          _defaulImputDecoration(NUM_INVENTARIO, Icons.adjust),
                      validator: (val) =>
                          val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _numInvDvdRw = value,
                      autovalidate: false,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerMarcaDvdRw,
                      autocorrect: false,
                      decoration: _defaulImputDecoration(MARCA, Icons.adjust),
                      validator: (val) =>
                          val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _marcaDvdRw = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerModeloDvdRw,
                      autocorrect: false,
                      decoration: _defaulImputDecoration(MODELO, Icons.adjust),
                      validator: (val) =>
                          val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _modeloDvdRw = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerTipoDvdRw,
                      autocorrect: false,
                      decoration: _defaulImputDecoration(TIPO, Icons.adjust),
                      validator: (val) =>
                          val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _tipoDvdRw = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerDetallesDvdRw,
                      autocorrect: false,
                      decoration:
                          _defaulImputDecoration(DETALLES, Icons.adjust),
                      validator: (val) =>
                          val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _detallesDvdRw = value,
                      //onSaved: (value) => valueSaveMotherboard( saveDetalles: value),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      autocorrect: false,
                      controller: controllerFechaDvdRw,
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
                      onSaved: (value) => _fechaDvdRw = value,
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
                      autovalidate: false,
                      keyboardType: TextInputType.number,
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
                      decoration: _defaulImputDecoration(
                          DETALLES, Icons.desktop_windows),
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
                          NUM_INVENTARIO, Icons.keyboard),
                      validator: (val) =>
                          val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _numInvTeclado = value,
                      autovalidate: false,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerMarcaTeclado,
                      autocorrect: false,
                      decoration: _defaulImputDecoration(MARCA, Icons.keyboard),
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
                          _defaulImputDecoration(MODELO, Icons.keyboard),
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
                      decoration: _defaulImputDecoration(TIPO, Icons.keyboard),
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
                          _defaulImputDecoration(DETALLES, Icons.keyboard),
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
                      decoration:
                          _defaulImputDecoration(NUM_INVENTARIO, Icons.speaker),
                      validator: (val) =>
                          val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _numInvBocina = value,
                      autovalidate: false,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerMarcaBocina,
                      autocorrect: false,
                      decoration: _defaulImputDecoration(MARCA, Icons.speaker),
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
                      decoration: _defaulImputDecoration(MODELO, Icons.speaker),
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
                      decoration: _defaulImputDecoration(TIPO, Icons.speaker),
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
                          _defaulImputDecoration(DETALLES, Icons.speaker),
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
                      decoration:
                          _defaulImputDecoration(NUM_INVENTARIO, Icons.mouse),
                      validator: (val) =>
                          val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _numInvMouse = value,
                      autovalidate: false,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerMarcaMouse,
                      autocorrect: false,
                      decoration: _defaulImputDecoration(MARCA, Icons.mouse),
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
                      decoration: _defaulImputDecoration(MODELO, Icons.mouse),
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
                      decoration: _defaulImputDecoration(TIPO, Icons.mouse),
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
                      decoration: _defaulImputDecoration(DETALLES, Icons.mouse),
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
                          NUM_INVENTARIO, Icons.battery_charging_full),
                      validator: (val) =>
                          val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _numInvUps = value,
                      autovalidate: false,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerMarcaUps,
                      autocorrect: false,
                      decoration: _defaulImputDecoration(
                          MARCA, Icons.battery_charging_full),
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
                      decoration: _defaulImputDecoration(
                          MODELO, Icons.battery_charging_full),
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
                      decoration: _defaulImputDecoration(
                          TIPO, Icons.battery_charging_full),
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
                      decoration: _defaulImputDecoration(
                          DETALLES, Icons.battery_charging_full),
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
                      decoration:
                          _defaulImputDecoration(NUM_INVENTARIO, Icons.scanner),
                      validator: (val) =>
                          val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _numInvScanner = value,
                      autovalidate: false,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerMarcaScanner,
                      autocorrect: false,
                      decoration: _defaulImputDecoration(MARCA, Icons.scanner),
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
                      decoration: _defaulImputDecoration(MODELO, Icons.scanner),
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
                      decoration: _defaulImputDecoration(TIPO, Icons.scanner),
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
                          _defaulImputDecoration(DETALLES, Icons.scanner),
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
                      decoration:
                          _defaulImputDecoration(NUM_INVENTARIO, Icons.print),
                      validator: (val) =>
                          val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _numInvImpresora = value,
                      autovalidate: false,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerMarcaImpresora,
                      autocorrect: false,
                      decoration: _defaulImputDecoration(MARCA, Icons.print),
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
                      decoration: _defaulImputDecoration(MODELO, Icons.print),
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
                      decoration: _defaulImputDecoration(TIPO, Icons.print),
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
                      decoration: _defaulImputDecoration(DETALLES, Icons.print),
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
                          NUM_INVENTARIO, Icons.tablet_android),
                      validator: (val) =>
                          val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _numInvTablet = value,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerEncargadoTablet,
                      autocorrect: false,
                      decoration:
                          _defaulImputDecoration(ENCARGADO, Icons.person),
                      validator: (val) =>
                          val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _encargadoTablet = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerMarcaTablet,
                      autocorrect: false,
                      decoration:
                          _defaulImputDecoration(MARCA, Icons.tablet_android),
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
                          _defaulImputDecoration(MODELO, Icons.tablet_android),
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
                          _defaulImputDecoration(TIPO, Icons.tablet_android),
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
                      decoration: _defaulImputDecoration(
                          DETALLES, Icons.tablet_android),
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
                          NUM_INVENTARIO, Icons.laptop_windows),
                      validator: (val) =>
                          val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _numInvLaptop = value,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerEncargadoLaptop,
                      autocorrect: false,
                      decoration:
                          _defaulImputDecoration(ENCARGADO, Icons.person),
                      validator: (val) =>
                          val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _encargadoLaptop = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerMarcaLaptop,
                      autocorrect: false,
                      decoration:
                          _defaulImputDecoration(MARCA, Icons.laptop_windows),
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
                          _defaulImputDecoration(MODELO, Icons.laptop_windows),
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
                          _defaulImputDecoration(TIPO, Icons.laptop_windows),
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
                      decoration: _defaulImputDecoration(
                          DETALLES, Icons.laptop_windows),
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
                          NUM_INVENTARIO, Icons.sd_storage),
                      validator: (val) =>
                          val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _numInvMemoria = value,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerEncargadoMemoria,
                      autocorrect: false,
                      decoration:
                          _defaulImputDecoration(ENCARGADO, Icons.person),
                      validator: (val) =>
                          val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                      onSaved: (value) => _encargadoMemoria = value,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: TextFormField(
                      controller: controllerMarcaMemoria,
                      autocorrect: false,
                      decoration:
                          _defaulImputDecoration(MARCA, Icons.sd_storage),
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
                          _defaulImputDecoration(MODELO, Icons.sd_storage),
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
                          _defaulImputDecoration(TIPO, Icons.sd_storage),
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
                          _defaulImputDecoration(DETALLES, Icons.sd_storage),
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

  Step _formGuardar() {
    return Step(
      title: Text(
        CONST_STEP_GUARDAR,
        style: TextStyle(
          color: Colors.black45,
          fontSize: 22.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      content: Text('Continuar para guardar'),
    );
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
