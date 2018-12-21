import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

import 'package:medios_basicos/pages/selection_comp.dart';
import 'package:medios_basicos/constants.dart';

class AddRecord extends StatefulWidget {
  final List<String> listBuildTap;

  AddRecord({Key key, @required this.listBuildTap}) : super(key: key);

  @override
  _AddRecordState createState() => _AddRecordState(listBuildTap: listBuildTap);
}

class _AddRecordState extends State<AddRecord> {
  _AddRecordState({Key key, @required this.listBuildTap});

  final List<String> listBuildTap;

  List<String> list;
  List<Tab> _listTab = List();
  List<Widget> _listTabBarView = List();

  List<BottomNavigationBarItem> _listButtomNavBarItem = List();

  DateTime _dateTime = new DateTime.now();
  DateFormat _dateFormat = new DateFormat.yMEd();

  final globalKeyForm =  new GlobalKey<FormState>();


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
  final TextEditingController controllerFechaMinitor =
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
  final formKeyMemoria =new GlobalKey<FormState>();
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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    list = [
      CONST_UNIDAD_CENTRAL,
      CONST_MONITOR,
      CONST_TECLADO,
      CONST_BOCINA,
    ];
    // _makeBottomNavigationBarItem();
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

    print('Size listTap:');
    print(_listTab.length);

    print(listBuildTap);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _listTab.length,
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.check),
                onPressed: () {
                  //var form = Monitor().createState().formKeyMonitor.currentState.validate();
                  var marca = controllerMarcaMonitor.text;
//                  var marca = controllerMarcaMonitor.text;
//                  var marca = controllerMarcaMonitor.text;
//                  var marca = controllerMarcaMonitor.text;
//                  var marca = controllerMarcaMonitor.text;
                  //var marca = Monitor().createState().fechaMonitor;

                  print('-- $marca -- ');
//              if (form.validate()) {
//                form.save();
//              }
                  print('''
                Global KEY:
                Unidad Central: $formKeyUnidadCentral  -
                Motherboard:    $formKeyMotherboard  -
                RAM:            $formKeyRam  -
                HDD:            $formKeyHdd  -
                Monitor:        $formKeyMonitor  -
                Teclado:        $formKeyTeclado  -
                Bocinas:        $formKeyBocina  -
                Mouse:          $formKeyMouse  -

               ''');
                })
          ],
          bottom: TabBar(tabs: _listTab),
          title: Text('Agregar registro'),
        ),
        body: TabBarView(children: _listTabBarView),
      ),
    );
  }

  void _addsItemsInToLists() {
    listBuildTap.forEach((value) {
      _listTab.add(_buildTab(value));
      _listTabBarView.add(_buildTabBarView(value));
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
        controllerFechaMinitor.text = _fechaMonitor;
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

  Widget _buildForm(
      {@required IconData icon,
      @required String nameForm,
      @required Key keyForm,
      @required String saveNumInv,
      @required String saveMarca,
      @required String saveModelo,
      @required String saveTipo,
      @required String saveDetalles,
      @required String saveFecha,
      @required TextEditingController controllerNumInv,
      @required TextEditingController controllerMarca,
      @required TextEditingController controllerModelo,
      @required TextEditingController controllerTipo,
      @required TextEditingController controllerDetalle,
      @required TextEditingController controllerFecha,
      TextEditingController controllerEncargado,
      String saveEncargado}) {
    return new Form(
        key: keyForm,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: <Widget>[
              Center(
                child: Text(
                  nameForm,
                  style: TextStyle(
                    color: Colors.black45,
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  controller: controllerNumInv,
                  autocorrect: false,
                  decoration: _defaulImputDecoration(NUM_INVENTARIO, icon),
                  validator: (val) => val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                  onSaved: (value) => saveNumInv = value,
                  keyboardType: TextInputType.numberWithOptions(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  controller: controllerMarca,
                  autocorrect: false,
                  decoration: _defaulImputDecoration(MARCA, icon),
                  validator: (val) => val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                  onSaved: (value) => saveMarca = value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  controller: controllerModelo,
                  autocorrect: false,
                  decoration: _defaulImputDecoration(MODELO, icon),
                  validator: (val) => val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                  onSaved: (value) => saveModelo = value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  controller: controllerTipo,
                  autocorrect: false,
                  decoration: _defaulImputDecoration(TIPO, icon),
                  validator: (val) => val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                  onSaved: (value) => saveTipo = value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  controller: controllerDetalle,
                  autocorrect: false,
                  decoration: _defaulImputDecoration(DETALLES, icon),
                  validator: (val) => val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                  onSaved: (value) => saveDetalles = value,
                ),
              ),
              controllerEncargado != null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: TextFormField(
                        controller: controllerEncargado,
                        autocorrect: false,
                        decoration:
                            _defaulImputDecoration(NOMBRE_ENCARGADO, icon),
                        validator: (val) =>
                            val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                        onSaved: (value) => saveEncargado = value,
                      ),
                    )
                  : Divider(
                      color: Colors.transparent,
                    ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  autocorrect: false,
                  controller: controllerFecha,
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
                  validator: (val) => val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                  onSaved: (value) => saveFecha = value,
                  //initialValue: '$_fechaMonitor',
                ),
              ),
              Divider(),
              RaisedButton(onPressed: () {
                var form = formKeyMonitor.currentState;
                if (form.validate()) {
                  form.save();
                }
                print('''
                Valores de los campos
              $_numInvMonitor -
              $_marcaMonitor 
              $_modeloMonitor -
              $_tipoMonitor -
              $_detallesMonitor -
              $_fechaMonitor -
               ''');
              })
            ],
          ),
        ));
  }

  Widget _buildFormUnidadCentral() {
    return Form(
        key: formKeyUnidadCentral,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: <Widget>[
              Image.asset(
                'images/station.png',
                width: 75.0,
                height: 75.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  autocorrect: false,
                  decoration:
                      _defaulImputDecoration(NOMBRE_ESTACION, Icons.short_text),
                  validator: (val) => val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                  onSaved: (value) => _nombreUnidadCentral = value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  autocorrect: false,
                  decoration: _defaulImputDecoration(
                      NUM_INVENTARIO, Icons.confirmation_number),
                  validator: (val) => val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                  onSaved: (value) => _numInvUnidadCentral = value,
                  keyboardType: TextInputType.number,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  autocorrect: false,
                  decoration: _defaulImputDecoration(NUM_SELLO, Icons.payment),
                  validator: (val) => val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                  onSaved: (value) => _numSelloUnidadCentral = value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  autocorrect: false,
                  decoration:
                      _defaulImputDecoration(AREA_OFICINA, Icons.location_on),
                  validator: (val) => val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                  onSaved: (value) => _areaUnidadCentral = value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  autocorrect: false,
                  decoration:
                      _defaulImputDecoration(NOMBRE_ENCARGADO, Icons.person),
                  validator: (val) => val.isEmpty ? ERROR_RELLENE_CAMPO : null,
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
                  validator: (val) => val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                  onSaved: (value) => _fechaUnidadCentral = value,
                  //initialValue: '$_fechaMonitor',
                ),
              ),
              Divider(),
              RaisedButton(onPressed: () {
                var form = formKeyUnidadCentral.currentState;
                if (form.validate()) {
                  form.save();
                }
//                print('''
//                Valores de los campos
//              $_nameStation
//              $_numInv -
//              $_nameOffice -
//              $_nameUser -
//               ''');
              })
            ],
          ),
        ));
  }

  Tab _buildTab(String value) {
    switch (value) {
      case CONST_UNIDAD_CENTRAL:
        return Tab(
          icon: Icon(
            Icons.important_devices,
          ),
        );
      case CONST_MOTHERBOARD:
        return Tab(
          icon: Icon(
            Icons.developer_board,
          ),
        );
      case CONST_RAM:
        return Tab(
          icon: Icon(
            Icons.straighten,
          ),
        );
      case CONST_HDD:
        return Tab(
          icon: Icon(
            Icons.call_to_action,
          ),
        );

      case CONST_MONITOR:
        return Tab(
          icon: Icon(
            Icons.desktop_windows,
          ),
        );

      case CONST_TECLADO:
        return Tab(
          icon: Icon(
            Icons.keyboard,
          ),
        );

      case CONST_BOCINA:
        return Tab(
          icon: Icon(
            Icons.speaker,
          ),
        );

      case CONST_MOUSE:
        return Tab(
          icon: Icon(
            Icons.mouse,
          ),
        );

      case CONST_UPS:
        return Tab(
          icon: Icon(
            Icons.battery_charging_full,
          ),
        );

      case CONST_SCANNER:
        return Tab(
          icon: Icon(
            Icons.scanner,
          ),
        );

      case CONST_IMPRESORA:
        return Tab(
          icon: Icon(
            Icons.print,
          ),
        );

      case CONST_TABLET:
        return Tab(
          icon: Icon(
            Icons.tablet_android,
          ),
        );

      case CONST_LAPTOP:
        return Tab(
          icon: Icon(
            Icons.laptop_windows,
          ),
        );

      case CONST_MEMORIAS_USB_SD:
        return Tab(
          icon: Icon(
            Icons.sd_storage,
          ),
        );
    }
  }

  Widget _buildTabBarView(String value) {
    switch (value) {
      case CONST_UNIDAD_CENTRAL:
        return _buildFormUnidadCentral();

      case CONST_MOTHERBOARD:
        return _buildForm(
            icon: Icons.developer_board,
            keyForm: formKeyMotherboard,
            nameForm: CONST_MOTHERBOARD,
            saveNumInv: _numInvMotherboard,
            saveMarca: _marcaMotherboard,
            saveModelo: _modeloMotherboard,
            saveTipo: _tipoMotherboard,
            saveDetalles: _detallesMotherboard,
            saveFecha: _fechaMotherboard,
            controllerNumInv: controllerNumInventarioMotherboard,
            controllerMarca: controllerMarcaMotherboard,
            controllerModelo: controllerModeloMotherboard,
            controllerTipo: controllerTipoMotherboard,
            controllerDetalle: controllerDetallesMotherboard,
            controllerFecha: controllerFechaMotherboard);

      case CONST_RAM:
        return _buildForm(
            icon: Icons.straighten,
            keyForm: formKeyRam,
            nameForm: CONST_RAM,
            saveNumInv: _numInvRam,
            saveMarca: _marcaRam,
            saveModelo: _modeloRam,
            saveTipo: _tipoRam,
            saveDetalles: _detallesRam,
            saveFecha: _fechaRam,
            controllerNumInv: controllerNumInventarioRam,
            controllerMarca: controllerMarcaRam,
            controllerModelo: controllerModeloRam,
            controllerTipo: controllerTipoRam,
            controllerDetalle: controllerDetallesRam,
            controllerFecha: controllerFechaRam);

      case CONST_HDD:
        return _buildForm(
            icon: Icons.call_to_action,
            keyForm: formKeyHdd,
            nameForm: CONST_HDD,
            saveNumInv: _numInvHdd,
            saveMarca: _marcaHdd,
            saveModelo: _modeloHdd,
            saveTipo: _tipoHdd,
            saveDetalles: _detallesHdd,
            saveFecha: _fechaHdd,
            controllerNumInv: controllerNumInventarioHdd,
            controllerMarca: controllerMarcaHdd,
            controllerModelo: controllerModeloHdd,
            controllerTipo: controllerTipoHdd,
            controllerDetalle: controllerDetallesHdd,
            controllerFecha: controllerFechaHdd);

      case CONST_MONITOR:
        return _buildForm(
            icon: Icons.desktop_windows,
            keyForm: formKeyMonitor,
            nameForm: CONST_MONITOR,
            saveNumInv: _numInvMonitor,
            saveMarca: _marcaMonitor,
            saveModelo: _modeloMonitor,
            saveTipo: _tipoMonitor,
            saveDetalles: _detallesMonitor,
            saveFecha: _fechaMonitor,
            controllerNumInv: controllerNumInventarioMonitor,
            controllerMarca: controllerMarcaMonitor,
            controllerModelo: controllerModeloMonitor,
            controllerTipo: controllerTipoMonitor,
            controllerDetalle: controllerDetallesMonitor,
            controllerFecha: controllerFechaMinitor);

      case CONST_TECLADO:
        return _buildForm(
            icon: Icons.keyboard,
            keyForm: formKeyTeclado,
            nameForm: CONST_TECLADO,
            saveNumInv: _numInvTeclado,
            saveMarca: _marcaTeclado,
            saveModelo: _modeloTeclado,
            saveTipo: _tipoTeclado,
            saveDetalles: _detallesTeclado,
            saveFecha: _fechaTeclado,
            controllerNumInv: controllerNumInventarioTeclado,
            controllerMarca: controllerMarcaTeclado,
            controllerModelo: controllerModeloTeclado,
            controllerTipo: controllerTipoTeclado,
            controllerDetalle: controllerDetallesTeclado,
            controllerFecha: controllerFechaTeclado);

      case CONST_BOCINA:
        return _buildForm(
            icon: Icons.speaker,
            keyForm: formKeyBocina,
            nameForm: CONST_BOCINA,
            saveNumInv: _numInvBocina,
            saveMarca: _marcaBocina,
            saveModelo: _modeloBocina,
            saveTipo: _tipoBocina,
            saveDetalles: _detallesBocina,
            saveFecha: _fechaBocina,
            controllerNumInv: controllerNumInventarioBocina,
            controllerMarca: controllerMarcaBocina,
            controllerModelo: controllerModeloBocina,
            controllerTipo: controllerTipoBocina,
            controllerDetalle: controllerDetallesBocina,
            controllerFecha: controllerFechaBocina);

      case CONST_MOUSE:
        return _buildForm(
            icon: Icons.mouse,
            keyForm: formKeyMouse,
            nameForm: CONST_MOUSE,
            saveNumInv: _numInvMouse,
            saveMarca: _marcaMouse,
            saveModelo: _modeloMouse,
            saveTipo: _tipoMouse,
            saveDetalles: _detallesMouse,
            saveFecha: _fechaMouse,
            controllerNumInv: controllerNumInventarioMouse,
            controllerMarca: controllerMarcaMouse,
            controllerModelo: controllerModeloMouse,
            controllerTipo: controllerTipoMouse,
            controllerDetalle: controllerDetallesMouse,
            controllerFecha: controllerFechaMouse);

      case CONST_UPS:
        return _buildForm(
            icon: Icons.battery_charging_full,
            keyForm: formKeyUps,
            nameForm: CONST_UPS,
            saveNumInv: _numInvUps,
            saveMarca: _marcaUps,
            saveModelo: _modeloUps,
            saveTipo: _tipoUps,
            saveDetalles: _detallesUps,
            saveFecha: _fechaUps,
            controllerNumInv: controllerNumInventarioUps,
            controllerMarca: controllerMarcaUps,
            controllerModelo: controllerModeloUps,
            controllerTipo: controllerTipoUps,
            controllerDetalle: controllerDetallesUps,
            controllerFecha: controllerFechaUps);

      case CONST_SCANNER:
        return _buildForm(
            icon: Icons.scanner,
            keyForm: formKeyScanner,
            nameForm: CONST_UPS,
            saveNumInv: _numInvScanner,
            saveMarca: _marcaScanner,
            saveModelo: _modeloScanner,
            saveTipo: _tipoScanner,
            saveDetalles: _detallesScanner,
            saveFecha: _fechaScanner,
            controllerNumInv: controllerNumInventarioScanner,
            controllerMarca: controllerMarcaScanner,
            controllerModelo: controllerModeloScanner,
            controllerTipo: controllerTipoScanner,
            controllerDetalle: controllerDetallesScanner,
            controllerFecha: controllerFechaScanner);

      case CONST_IMPRESORA:
        return _buildForm(
            icon: Icons.print,
            keyForm: formKeyImpresora,
            nameForm: CONST_IMPRESORA,
            saveNumInv: _numInvImpresora,
            saveMarca: _marcaImpresora,
            saveModelo: _modeloImpresora,
            saveTipo: _tipoImpresora,
            saveDetalles: _detallesImpresora,
            saveFecha: _fechaImpresora,
            controllerNumInv: controllerNumInventarioImpresora,
            controllerMarca: controllerMarcaImpresora,
            controllerModelo: controllerModeloImpresora,
            controllerTipo: controllerTipoImpresora,
            controllerDetalle: controllerDetallesImpresora,
            controllerFecha: controllerFechaImpresora);

      case CONST_TABLET:
        return _buildForm(
          icon: Icons.tablet_android,
          keyForm: formKeyTablet,
          nameForm: CONST_TABLET,
          saveNumInv: _numInvTablet,
          saveMarca: _marcaTablet,
          saveModelo: _modeloTablet,
          saveTipo: _tipoTablet,
          saveDetalles: _detallesTablet,
          saveFecha: _fechaTablet,
          controllerNumInv: controllerNumInventarioTablet,
          controllerMarca: controllerMarcaTablet,
          controllerModelo: controllerModeloTablet,
          controllerTipo: controllerTipoTablet,
          controllerDetalle: controllerDetallesTablet,
          controllerFecha: controllerFechaTablet,
          controllerEncargado: controllerEncargadoTablet,
          saveEncargado: _encargadoTablet,
        );

      case CONST_LAPTOP:
        return _buildForm(
          icon: Icons.laptop_windows,
          keyForm: formKeyLaptop,
          nameForm: CONST_LAPTOP,
          saveNumInv: _numInvLaptop,
          saveMarca: _marcaLaptop,
          saveModelo: _modeloLaptop,
          saveTipo: _tipoLaptop,
          saveDetalles: _detallesLaptop,
          saveFecha: _fechaLaptop,
          controllerNumInv: controllerNumInventarioLaptop,
          controllerMarca: controllerMarcaLaptop,
          controllerModelo: controllerModeloLaptop,
          controllerTipo: controllerTipoLaptop,
          controllerDetalle: controllerDetallesLaptop,
          controllerFecha: controllerFechaLaptop,
          controllerEncargado: controllerEncargadoLaptop,
          saveEncargado: _encargadoLaptop,
        );

      case CONST_MEMORIAS_USB_SD:
        return _buildForm(
          icon: Icons.sd_storage,
          keyForm: formKeyMemoria,
          nameForm: CONST_MEMORIAS_USB_SD,
          saveNumInv: _numInvMemoria,
          saveMarca: _marcaMemoria,
          saveModelo: _modeloMemoria,
          saveTipo: _tipoMemoria,
          saveDetalles: _detallesMemoria,
          saveFecha: _fechaMemoria,
          controllerNumInv: controllerNumInventarioMemoria,
          controllerMarca: controllerMarcaMemoria,
          controllerModelo: controllerModeloMemoria,
          controllerTipo: controllerTipoMemoria,
          controllerDetalle: controllerDetallesMemoria,
          controllerFecha: controllerFechaMemoria,
          controllerEncargado: controllerEncargadoMemoria,
          saveEncargado: _encargadoMemoria,
        );
    }
  }
}
