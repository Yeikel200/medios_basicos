import 'package:flutter/material.dart';
import 'package:medios_basicos/constants.dart';

import 'form_estation.dart';

class SelectionComponentPC extends StatefulWidget {
  @override
  _SelectionComponentPCState createState() => _SelectionComponentPCState();
}

class _SelectionComponentPCState extends State<SelectionComponentPC> {
  static bool _checkEstacion = false;
  static bool _checkUnidadCentral = false;
  static bool _checkMotherboard = false;
  static bool _checkCpu = false;
  static bool _checkRam = false;
  static bool _checkHdd = false;
  static bool _checkDvdRw = false;
  static bool _checkMonitor = false;
  static bool _checkTeclado = false;
  static bool _checkBocina = false;
  static bool _checkMouse = false;
  static bool _checkImpresora = false;
  static bool _checkScanner = false;
  static bool _checkUps = false;
  static bool _checkTablets = false;
  static bool _checkLaptop = false;
  static bool _checkMemorias = false;

  List<String> _listSelectComp = new List<String>();

  Map<String, bool> _listComp = {
    CONST_ESTACION: _checkEstacion,
    CONST_UNIDAD_CENTRAL: _checkUnidadCentral,
    CONST_MOTHERBOARD: _checkMotherboard,
    CONST_CPU: _checkCpu,
    CONST_RAM: _checkRam,
    CONST_HDD: _checkHdd,
    CONST_DVD_RW: _checkDvdRw,
    CONST_MONITOR: _checkMonitor,
    CONST_TECLADO: _checkTeclado,
    CONST_BOCINA: _checkBocina,
    CONST_MOUSE: _checkMouse,
    CONST_IMPRESORA: _checkImpresora,
    CONST_SCANNER: _checkScanner,
    CONST_UPS: _checkUps,
    CONST_TABLET: _checkTablets,
    CONST_LAPTOP: _checkLaptop,
    CONST_MEMORIAS_USB_SD: _checkMemorias
  };

  void _button() {
    debugPrint('Lista de componentes seleccionados, Size: ' +
        _listSelectComp.length.toString());

    setState(() {
      if (_listComp != null)
        _listComp.forEach((k, v) => debugPrint('Key: $k - Value: $v'));
    });

    print(_updateList());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Selección"),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
                icon: Icon(Icons.check),
                onPressed: () {
                  _button();
                  if (_listSelectComp.isNotEmpty && _listSelectComp.length >= 2) {
                    print('Lista con elementos');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => StepperForm(
                                  listSteps: _updateList(),
                                )));
                  } else {
                    print('Lista vacia' + _listSelectComp.toString());

                    AlertDialog alert = AlertDialog(
                      title: Text('Deve elgir almenos un elemento para conformar la Estacion de Trabajo'),
                      titlePadding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                      contentPadding:
                          EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 16.0),
                      actions: <Widget>[
                        FlatButton(
                          child: Text('Aceptar'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        )
                      ],
                    );

                    showDialog(context: context, child: alert);
                  }
                }),
          )
        ],
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Center(
                child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Seleccione los componentes que conforman su expediente',
                style: TextStyle(
                  fontSize: 12.0,
                  color: Colors.black45,
                ),
              ),
            )),
            SwitchListTile(
              value: _checkEstacion,
              activeColor: Colors.red,
              onChanged: (bool value) {
                _setChangeStatus(value, CONST_ESTACION);
              },
              title: Text(CONST_ESTACION),
              subtitle: Text(
                'Unidad Central, Monitor, Telcado, Bocina, Mouse',
                style: TextStyle(fontSize: 10.0, color: Colors.black38),
              ),
              secondary: _checkEstacion
                  ? Icon(
                      Icons.devices_other,
                      color: Colors.red,
                    )
                  : Icon(Icons.devices_other),
            ),
            SwitchListTile(
              value: _checkUnidadCentral,
              activeColor: Colors.lightGreen,
              onChanged: (bool value) {
                _setChangeStatus(value, CONST_UNIDAD_CENTRAL);
              },
              title: Text(CONST_UNIDAD_CENTRAL),
              subtitle: Text(
                'Motherboard, CPU, RAM, HDD, DVD-RW',
                style: TextStyle(fontSize: 10.0, color: Colors.black38),
              ),
              secondary: _checkUnidadCentral
                  ? Icon(
                      Icons.crop_portrait,
                      color: Colors.lightGreen,
                    )
                  : Icon(Icons.crop_portrait),
            ),
            SwitchListTile(
              value: _checkMotherboard,
              activeColor: Colors.lightGreen,
              onChanged: (bool value) {
                _setChangeStatus(value, CONST_MOTHERBOARD);
              },
              title: Text(CONST_MOTHERBOARD),
              secondary: _checkMotherboard
                  ? Icon(
                      Icons.developer_board,
                      color: Colors.lightGreen,
                    )
                  : Icon(Icons.developer_board),
            ),
            SwitchListTile(
              value: _checkCpu,
              activeColor: Colors.lightGreen,
              onChanged: (bool value) {
                _setChangeStatus(value, CONST_CPU);
              },
              title: Text(CONST_CPU),
              secondary: _checkCpu
                  ? Icon(
                      Icons.straighten,
                      color: Colors.lightGreen,
                    )
                  : Icon(Icons.straighten),
            ),
            SwitchListTile(
              value: _checkRam,
              activeColor: Colors.lightGreen,
              onChanged: (bool value) {
                _setChangeStatus(value, CONST_RAM);
              },
              title: Text(CONST_RAM),
              secondary: _checkRam
                  ? Icon(
                      Icons.straighten,
                      color: Colors.lightGreen,
                    )
                  : Icon(Icons.straighten),
            ),
            SwitchListTile(
              value: _checkHdd,
              activeColor: Colors.lightGreen,
              onChanged: (bool value) {
                _setChangeStatus(value, CONST_HDD);
              },
              title: Text(CONST_HDD),
              secondary: _checkHdd
                  ? Icon(
                      Icons.call_to_action,
                      color: Colors.lightGreen,
                    )
                  : Icon(Icons.call_to_action),
            ),
            SwitchListTile(
              value: _checkDvdRw,
              activeColor: Colors.lightGreen,
              onChanged: (bool value) {
                _setChangeStatus(value, CONST_DVD_RW);
              },
              title: Text(CONST_DVD_RW),
              secondary: _checkDvdRw
                  ? Icon(
                      Icons.adjust,
                      color: Colors.lightGreen,
                    )
                  : Icon(Icons.adjust),
            ),
            SwitchListTile(
              value: _checkMonitor,
              onChanged: (bool value) {
                _setChangeStatus(value, CONST_MONITOR);
              },
              title: Text(CONST_MONITOR),
              secondary: _checkMonitor
                  ? Icon(
                      Icons.desktop_windows,
                      color: Colors.lightBlue,
                    )
                  : Icon(Icons.desktop_windows),
            ),
            SwitchListTile(
              value: _checkTeclado,
              onChanged: (bool value) {
                _setChangeStatus(value, CONST_TECLADO);
              },
              title: Text(CONST_TECLADO),
              secondary: _checkTeclado
                  ? Icon(
                      Icons.keyboard,
                      color: Colors.lightBlue,
                    )
                  : Icon(Icons.keyboard),
            ),
            SwitchListTile(
              value: _checkBocina,
              onChanged: (bool value) {
                _setChangeStatus(value, CONST_BOCINA);
              },
              title: Text(CONST_BOCINA),
              secondary: _checkBocina
                  ? Icon(
                      Icons.speaker,
                      color: Colors.lightBlue,
                    )
                  : Icon(Icons.speaker),
            ),
            SwitchListTile(
              value: _checkMouse,
              onChanged: (bool value) {
                _setChangeStatus(value, CONST_MOUSE);
              },
              title: Text(CONST_MOUSE),
              secondary: _checkMouse
                  ? Icon(
                      Icons.mouse,
                      color: Colors.lightBlue,
                    )
                  : Icon(Icons.mouse),
            ),
            SwitchListTile(
              value: _checkUps,
              onChanged: (bool value) {
                _setChangeStatus(value, CONST_UPS);
              },
              title: Text(CONST_UPS),
              secondary: _checkUps
                  ? Icon(
                      Icons.battery_charging_full,
                      color: Colors.lightBlue,
                    )
                  : Icon(Icons.battery_charging_full),
            ),
            SwitchListTile(
              value: _checkScanner,
              onChanged: (bool value) {
                _setChangeStatus(value, CONST_SCANNER);
              },
              title: Text(CONST_SCANNER),
              secondary: _checkScanner
                  ? Icon(
                      Icons.scanner,
                      color: Colors.lightBlue,
                    )
                  : Icon(Icons.scanner),
            ),
            SwitchListTile(
              value: _checkImpresora,
              onChanged: (bool value) {
                _setChangeStatus(value, CONST_IMPRESORA);
              },
              title: Text(CONST_IMPRESORA),
              secondary: _checkImpresora
                  ? Icon(
                      Icons.print,
                      color: Colors.lightBlue,
                    )
                  : Icon(Icons.print),
            ),
            SwitchListTile(
              value: _checkTablets,
              activeColor: Colors.orange,
              onChanged: (bool value) {
                _setChangeStatus(value, CONST_TABLET);
              },
              title: Text(CONST_TABLET),
              subtitle: Text(
                'Android, Windows Phone, iOs ',
                style: TextStyle(fontSize: 10.0, color: Colors.black38),
              ),
              secondary: _checkTablets
                  ? Icon(
                      Icons.tablet_android,
                      color: Colors.orange,
                    )
                  : Icon(Icons.tablet_android),
            ),
            SwitchListTile(
              value: _checkLaptop,
              activeColor: Colors.orange,
              onChanged: (bool value) {
                _setChangeStatus(value, CONST_LAPTOP);
              },
              title: Text(CONST_LAPTOP),
              subtitle: Text(
                'Windows, Linux, Mac-OS',
                style: TextStyle(fontSize: 10.0, color: Colors.black38),
              ),
              secondary: _checkLaptop
                  ? Icon(
                      Icons.laptop_windows,
                      color: Colors.orange,
                    )
                  : Icon(Icons.laptop_windows),
            ),
            SwitchListTile(
              value: _checkMemorias,
              activeColor: Colors.orange,
              onChanged: (bool value) {
                _setChangeStatus(value, CONST_MEMORIAS_USB_SD);
              },
              title: Text(CONST_MEMORIAS_USB_SD),
              subtitle: Text(
                'USB, SD, Micro-USB ',
                style: TextStyle(fontSize: 10.0, color: Colors.black38),
              ),
              secondary: _checkMemorias
                  ? Icon(
                      Icons.sd_storage,
                      color: Colors.orange,
                    )
                  : Icon(Icons.sd_storage),
            ),
          ],
        ),
      ),
    );
  }

  List<String> _updateList() {
    _listSelectComp.clear();
    _listComp.forEach((k, v) {
      if (v) {
        //debugPrint('Filtro --> K: $k , V: $v');
        if (!_listSelectComp.contains(k)) {
          _listSelectComp.add(k);
        }
        print('Lista para mandar a la otra actividad');
        // _listSelectComp.forEach((value) => debugPrint(value));
      } else {
        _listSelectComp.remove(k);
      }
    });

    _listSelectComp.add(CONST_STEP_GUARDAR);
    return _listSelectComp;
  }

  void _setChangeStatus(bool status, String name) {
    setState(() {
      switch (name) {
        case CONST_ESTACION:
          _checkEstacion = status;
          _listComp.update(CONST_ESTACION, (value) => status);
          _checkUnidadCentral = status;
          _listComp.update(CONST_UNIDAD_CENTRAL, (value) => status);
          _checkMotherboard = status;
          _listComp.update(CONST_MOTHERBOARD, (value) => status);
          _checkCpu = status;
          _listComp.update(CONST_CPU, (value) => status);
          _checkRam = status;
          _listComp.update(CONST_RAM, (value) => status);
          _checkHdd = status;
          _listComp.update(CONST_HDD, (value) => status);
          _checkDvdRw = status;
          _listComp.update(CONST_DVD_RW, (value) => status);
          _checkMonitor = status;
          _listComp.update(CONST_MONITOR, (value) => status);
          _checkTeclado = status;
          _listComp.update(CONST_TECLADO, (value) => status);
          _checkBocina = status;
          _listComp.update(CONST_BOCINA, (value) => status);
          _checkMouse = status;
          _listComp.update(CONST_MOUSE, (value) => status);

          ///_updateList(status, name);
          break;
        case CONST_UNIDAD_CENTRAL:
          _checkUnidadCentral = status;
          _listComp.update(CONST_UNIDAD_CENTRAL, (value) => status);
          _checkMotherboard = status;
          _listComp.update(CONST_MOTHERBOARD, (value) => status);
          _checkCpu = status;
          _listComp.update(CONST_CPU, (value) => status);
          _checkRam = status;
          _listComp.update(CONST_RAM, (value) => status);
          _checkHdd = status;
          _listComp.update(CONST_HDD, (value) => status);
          _checkDvdRw = status;
          _listComp.update(CONST_DVD_RW, (value) => status);

          ///_updateList(status, name);
          break;
        case CONST_MOTHERBOARD:
          _checkMotherboard = status;
          _listComp.update(CONST_MOTHERBOARD, (value) => status);
          break;
        case CONST_CPU:
          _listComp.update(CONST_CPU, (value) => status);
          _checkCpu = status;
          break;
        case CONST_RAM:
          _listComp.update(CONST_RAM, (value) => status);
          _checkRam = status;
          break;
        case CONST_HDD:
          _checkHdd = status;
          _listComp.update(CONST_HDD, (value) => status);
          break;
        case CONST_DVD_RW:
          _checkDvdRw = status;
          _listComp.update(CONST_DVD_RW, (value) => status);
          break;
        case CONST_MONITOR:
          _checkMonitor = status;
          _listComp.update(CONST_MONITOR, (value) => status);
          break;

        case CONST_TECLADO:
          _checkTeclado = status;
          _listComp.update(CONST_TECLADO, (value) => status);
          break;
        case CONST_BOCINA:
          _checkBocina = status;
          _listComp.update(CONST_BOCINA, (value) => status);
          break;
        case CONST_MOUSE:
          _checkMouse = status;
          _listComp.update(CONST_MOUSE, (value) => status);
          break;
        case CONST_UPS:
          _checkUps = status;
          _listComp.update(CONST_UPS, (value) => status);
          break;
        case CONST_IMPRESORA:
          _checkImpresora = status;
          _listComp.update(CONST_IMPRESORA, (value) => status);
          break;
        case CONST_SCANNER:
          _checkScanner = status;
          _listComp.update(CONST_SCANNER, (value) => status);
          break;
        case CONST_TABLET:
          _checkTablets = status;
          _listComp.update(CONST_TABLET, (value) => status);
          break;
        case CONST_LAPTOP:
          _checkLaptop = status;
          _listComp.update(CONST_LAPTOP, (value) => status);
          break;
        case CONST_MEMORIAS_USB_SD:
          _checkMemorias = status;
          _listComp.update(CONST_MEMORIAS_USB_SD, (value) => status);
          break;
      }
    });
  }
}
