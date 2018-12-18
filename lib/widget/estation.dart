import 'package:flutter/material.dart';
import 'package:medios_basicos/constants.dart';

class Estacion extends StatefulWidget {
  @override
  _EstacionState createState() => _EstacionState();
}

class _EstacionState extends State<Estacion> {
  String _nameStation,
      _numInv,
      _nameUser,
      _nameOffice,
      _motherboard;

  final formKeyEstation = GlobalKey<FormState>();

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
  static  String value(){

  }

  @override
  Widget build(BuildContext context) {

    return Form(
      key: formKeyEstation,
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
              decoration: _defaulImputDecoration(
                  NOMBRE_ESTACION, Icons.short_text),
              validator: (val) => val.isEmpty ? ERROR_RELLENE_CAMPO : null,
              onSaved: (value) => _nameStation = value,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextFormField(
              autocorrect: false,
              decoration: _defaulImputDecoration(
                  NUM_INVENTARIO, Icons.confirmation_number),
              validator: (val) => val.isEmpty ? ERROR_RELLENE_CAMPO : null,
              onSaved: (value) => _numInv = value,
              keyboardType: TextInputType.numberWithOptions(),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextFormField(
              autocorrect: false,
              decoration:
                  _defaulImputDecoration(NUM_SELLO, Icons.payment),
              validator: (val) => val.isEmpty ? ERROR_RELLENE_CAMPO : null,
              onSaved: (value) => _numInv = value,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextFormField(
              autocorrect: false,
              decoration:
                  _defaulImputDecoration(AREA_OFICINA, Icons.location_on),
              validator: (val) => val.isEmpty ? ERROR_RELLENE_CAMPO : null,
              onSaved: (value) => _nameOffice = value,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TextFormField(
              autocorrect: false,
              decoration:
                  _defaulImputDecoration(NOMBRE_ENCARGADO, Icons.person),
              validator: (val) => val.isEmpty ? ERROR_RELLENE_CAMPO : null,
              onSaved: (value) => _nameUser = value,
            ),
          ),
          Divider(),
          RaisedButton(onPressed: () {
            var form = formKeyEstation.currentState;
            if (form.validate()) {
              form.save();
            }
            print('''
                Valores de los campos
              $_nameStation 
              $_numInv -
              $_nameOffice -
              $_nameUser -
               ''');
          })
        ],
      ),
    ));
  }
}
