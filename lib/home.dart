import 'package:flutter/material.dart';
import 'package:medios_basicos/pages/estacion_list.dart';

import 'package:medios_basicos/pages/laptop_list.dart';
import 'package:medios_basicos/pages/form_estation.dart';
import 'package:medios_basicos/pages/memoria_list.dart';
import 'package:medios_basicos/pages/selection_comp.dart';

import 'package:medios_basicos/pages/tablet_list.dart';

class Home extends StatefulWidget {
  Home({Key key, @required this.title}) : super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            //crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      SelectionComponentPC()));
                        },
                        child: _buildContainerButton(
                            icon: Icons.add_circle_outline,
                            iconColor: Colors.white,
                            sizeIcon: 55.0,
                            colorButton: Color.fromRGBO(0, 125, 222, 0.5),
                            widthButton: 110.0,
                            heightButton: 110.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                        onTap: () {},
                        child: _buildContainerButton(
                            icon: Icons.search,
                            iconColor: Colors.white,
                            sizeIcon: 55.0,
                            colorButton: Color.fromRGBO(0, 125, 222, 0.5),
                            widthButton: 110.0,
                            heightButton: 110.0),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EstacionList()));
                        },
                        child: _buildContainerButton(
                            icon: Icons.format_list_numbered,
                            iconColor: Colors.white,
                            sizeIcon: 55.0,
                            colorButton: Color.fromRGBO(0, 125, 222, 0.5),
                            widthButton: 110.0,
                            heightButton: 110.0),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      onTap: () {},
                      child: _buildContainerButton(
                          icon: Icons.compare_arrows,
                          iconColor: Colors.white,
                          sizeIcon: 55.0,
                          colorButton: Color.fromRGBO(0, 125, 222, 0.5),
                          widthButton: 110.0,
                          heightButton: 110.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => StepperForm()));
                      },
                      child: _buildContainerButton(
                          icon: Icons.alternate_email,
                          iconColor: Colors.white,
                          sizeIcon: 55.0,
                          colorButton: Color.fromRGBO(0, 125, 222, 0.5),
                          widthButton: 110.0,
                          heightButton: 110.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      onTap: () {},
                      child: _buildContainerButton(
                          icon: Icons.build,
                          iconColor: Colors.white,
                          sizeIcon: 55.0,
                          colorButton: Color.fromRGBO(0, 125, 222, 0.5),
                          widthButton: 110.0,
                          heightButton: 110.0),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LaptopList()));
                      },
                      child: _buildContainerButton(
                          icon: Icons.laptop_windows,
                          iconColor: Colors.white,
                          sizeIcon: 55.0,
                          colorButton: Color.fromRGBO(0, 125, 222, 0.5),
                          widthButton: 110.0,
                          heightButton: 110.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TabletList()));
                      },
                      child: _buildContainerButton(
                          icon: Icons.tablet_android,
                          iconColor: Colors.white,
                          sizeIcon: 55.0,
                          colorButton: Color.fromRGBO(0, 125, 222, 0.5),
                          widthButton: 110.0,
                          heightButton: 110.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MemoriaList()));
                      },
                      child: _buildContainerButton(
                          icon: Icons.sd_storage,
                          iconColor: Colors.white,
                          sizeIcon: 55.0,
                          colorButton: Color.fromRGBO(0, 125, 222, 0.5),
                          widthButton: 110.0,
                          heightButton: 110.0),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container _buildContainerButton(
      {IconData icon,
      Color iconColor,
      double sizeIcon,
      Color colorButton,
      double widthButton,
      double heightButton}) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: colorButton,
      ),
      width: widthButton,
      height: heightButton,
      child: Icon(
        icon,
        size: sizeIcon,
        color: iconColor,
      ),
    );
  }
}
