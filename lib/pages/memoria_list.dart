import 'package:flutter/material.dart';
import 'package:medios_basicos/data/database_helper.dart';
import 'package:medios_basicos/model/memoria_model.dart';
import 'package:medios_basicos/widget/item_card_memoria.dart';
import 'package:sqflite/sqflite.dart';

Future<List<Memoria>> getMemoriaFromDB() async {
  var _dbHelper = DBHelper();
  Future<List<Memoria>> listMemoria = Memoria.getAllMemorias(_dbHelper.db);
  return listMemoria;
}

class MemoriaList extends StatefulWidget {
  MemoriaList({
    Key key,
  }) : super(key: key);

  @override
  _MemoriaListState createState() => _MemoriaListState();
}

class _MemoriaListState extends State<MemoriaList> {
  _MemoriaListState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Memorias'),
      ),
      body: Container(
        padding: EdgeInsets.all(4.0),
        child: FutureBuilder<List<Memoria>>(
          future: getMemoriaFromDB(),
          builder: (contex, snapshot) {
            if (snapshot.data != null) {
              if (snapshot.hasData != null) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return ItemCardListMemoria(
                        memoria: snapshot.data[index],
                      );
                    });
              }
            }else{
              // colocar logica para mostrar mensage cuando halla 0 registros
              return Text('No hay registros guardados');
            }

            return Container(
              alignment: AlignmentDirectional.center,
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }
}
