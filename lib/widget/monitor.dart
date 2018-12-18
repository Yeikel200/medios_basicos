import 'package:flutter/material.dart';
import 'package:medios_basicos/constants.dart';
import 'package:intl/intl.dart';

class Monitor extends StatefulWidget {
  @override
  _MonitorState createState() => _MonitorState();
}

class _MonitorState extends State<Monitor> {
  String  _numInvMonitor,_marcaMonitor, _modeloMonitor, _tipoMonitor, _detallesMonitor, _fechaMonitor;

  final formKeyMonitor = GlobalKey<FormState>();

  DateTime _dateTime = new DateTime.now();
  DateFormat _dateFormat = new DateFormat.yMEd();

  final TextEditingController controllerNumInventario = new TextEditingController();
  final TextEditingController controllerMarca = new TextEditingController();
  final TextEditingController controllerModelo = new TextEditingController();
  final TextEditingController controllerTipo = new TextEditingController();
  final TextEditingController controllerDetalles = new TextEditingController();
  final TextEditingController controllerFecha = new TextEditingController();


  @override
  void initState() {
    _fechaMonitor = _dateFormat.format(_dateTime);
    print(_fechaMonitor);
    controllerFecha.text = _fechaMonitor;

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

        _fechaMonitor = _dateFormat.format(piked);
        controllerFecha.text = _fechaMonitor;

      });
    }
  }

  InputDecoration _defaulImputDecoration(String _labelText, IconData icon) {
    return InputDecoration(
      suffixIcon: Icon(
        icon,
        color: Colors.lightBlueAccent,
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

  @override
  Widget build(BuildContext context) {

    return Form(
        key: formKeyMonitor,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: <Widget>[
              Icon(
                Icons.desktop_windows,
                size: 75.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  controller: controllerNumInventario,
                  autocorrect: false,
                  decoration: _defaulImputDecoration(
                      NUM_INVENTARIO, Icons.desktop_windows),
                  validator: (val) => val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                  onSaved: (value) => _numInvMonitor = value,
                  keyboardType: TextInputType.numberWithOptions(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  controller: controllerMarca,
                  autocorrect: false,
                  decoration:
                      _defaulImputDecoration(MARCA, Icons.desktop_windows),
                  validator: (val) => val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                  onSaved: (value) => _marcaMonitor = value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  controller: controllerModelo,
                  autocorrect: false,
                  decoration:
                      _defaulImputDecoration(MODELO, Icons.desktop_windows),
                  validator: (val) => val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                  onSaved: (value) => _modeloMonitor = value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  controller: controllerTipo,
                  autocorrect: false,
                  decoration:
                      _defaulImputDecoration(TIPO, Icons.desktop_windows),
                  validator: (val) => val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                  onSaved: (value) => _tipoMonitor = value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  controller: controllerDetalles,
                  autocorrect: false,
                  decoration:
                      _defaulImputDecoration(DETALLES, Icons.desktop_windows),
                  validator: (val) => val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                  onSaved: (value) => _detallesMonitor = value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  autocorrect: false,
                  controller: controllerFecha,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        icon: Icon(Icons.date_range), onPressed: () {
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
                  onSaved: (value) => _fechaMonitor = value,
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
}
