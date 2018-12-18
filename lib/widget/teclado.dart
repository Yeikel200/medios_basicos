import 'package:flutter/material.dart';
import 'package:medios_basicos/constants.dart';
import 'package:intl/intl.dart';

class Teclado extends StatefulWidget {
  @override
  _TecladoState createState() => _TecladoState();
}

class _TecladoState extends State<Teclado> {
  String  _numInvTeclado,_marcaTeclado, _modeloTeclado, _tipoTeclado, _detallesTeclado, _fechaTeclado;

  final formKeyTeclado = GlobalKey<FormState>();

  DateTime _dateTime = new DateTime.now();
  DateFormat _dateFormat = new DateFormat.yMd();

  final TextEditingController controllerFecha = new TextEditingController();


  @override
  void initState() {
    _fechaTeclado = _dateFormat.format(_dateTime);
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

        _fechaTeclado = _dateFormat.format(piked);
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
        key: formKeyTeclado,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: ListView(
            children: <Widget>[
              Icon(
                Icons.keyboard,
                size: 75.0,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  autocorrect: false,
                  decoration: _defaulImputDecoration(
                      NUM_INVENTARIO, Icons.keyboard),
                  validator: (val) => val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                  onSaved: (value) => _numInvTeclado = value,
                  keyboardType: TextInputType.numberWithOptions(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  autocorrect: false,
                  decoration:
                  _defaulImputDecoration(MARCA, Icons.keyboard),
                  validator: (val) => val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                  onSaved: (value) => _marcaTeclado = value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  autocorrect: false,
                  decoration:
                  _defaulImputDecoration(MODELO, Icons.keyboard),
                  validator: (val) => val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                  onSaved: (value) => _modeloTeclado = value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  autocorrect: false,
                  decoration:
                  _defaulImputDecoration(TIPO, Icons.keyboard),
                  validator: (val) => val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                  onSaved: (value) => _tipoTeclado = value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: TextFormField(
                  autocorrect: false,
                  decoration:
                  _defaulImputDecoration(DETALLES, Icons.keyboard),
                  validator: (val) => val.isEmpty ? ERROR_RELLENE_CAMPO : null,
                  onSaved: (value) => _detallesTeclado = value,
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
                  onSaved: (value) => _fechaTeclado = value,
                  //initialValue: '$_fechaMonitor',
                ),
              ),
              Divider(),
              RaisedButton(onPressed: () {
                var form = formKeyTeclado.currentState;
                if (form.validate()) {
                  form.save();
                }
                print('''
                Valores de los campos
              $_numInvTeclado -
              $_marcaTeclado 
              $_modeloTeclado -
              $_tipoTeclado -
              $_detallesTeclado -
              $_fechaTeclado -
               ''');
              })
            ],
          ),
        ));
  }
}
