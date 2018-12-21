import 'package:flutter/material.dart';
import 'package:medios_basicos/data/database_helper.dart';
import 'package:medios_basicos/model/memoria_model.dart';
import 'package:medios_basicos/widget/item_card.dart';

Future<List<Memoria>> getMemoriaFromDB() async {
  var dbHelper = DBHelper();
  Future<List<Memoria>> listMemoria = dbHelper.getAllMemorias();
  return listMemoria;
}

class MemoriaList extends StatefulWidget {

  MemoriaList({Key key,}) : super(key: key);

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
                      return ItemCardList(
                        memoria: snapshot.data[index],
                      );
                    });
              }
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
