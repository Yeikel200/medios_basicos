import 'package:flutter/material.dart';
import 'package:medios_basicos/data/database_helper.dart';
import 'package:medios_basicos/model/tablet_model.dart';
import 'package:medios_basicos/widget/item_card_tablet.dart';

Future<List<Tablet>> getTabletFromDB() async {
  var _dbHelper = DBHelper();
  Future<List<Tablet>> listTablet = Tablet.getAllTablets(_dbHelper.db);
  return listTablet;
}

class TabletList extends StatefulWidget {

  TabletList({Key key,}) : super(key: key);

  @override
  _TabletListState createState() => _TabletListState();
}

class _TabletListState extends State<TabletList> {

  _TabletListState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Tablets'),
      ),
      body: Container(
        padding: EdgeInsets.all(4.0),
        child: FutureBuilder<List<Tablet>>(
          future: getTabletFromDB(),
          builder: (contex, snapshot) {
            if (snapshot.data != null) {
              if (snapshot.hasData != null) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return ItemCardListTablet(
                        tablet: snapshot.data[index],
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
