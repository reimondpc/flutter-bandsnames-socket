import 'package:band_names_test/src/models/band_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<BandModel> bands = [
    BandModel(id: '1', name: 'Metalica', votes: 5),
    BandModel(id: '2', name: 'Link in Park', votes: 2),
    BandModel(id: '3', name: 'Queen', votes: 4),
    BandModel(id: '4', name: 'Camila', votes: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        centerTitle: true,
        title: Text('BandNames', style: TextStyle(color: Colors.black87)),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, index) => _bandTile(bands[index]),
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        child: Icon(Icons.add),
        onPressed: addNewBand,
      ),
    );
  }

  Widget _bandTile(BandModel bandModel) {
    return Dismissible(
      direction: DismissDirection.startToEnd,
      onDismissed: (direction) {},
      key: Key(bandModel.id!),
      background: Container(
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 8.0),
        color: Colors.red,
        child: Icon(Icons.delete, color: Colors.white),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Text(bandModel.name!.substring(0, 2)),
          backgroundColor: Colors.blue[100],
        ),
        title: Text(bandModel.name!),
        trailing: Text('${bandModel.votes}', style: TextStyle(fontSize: 20)),
        onTap: () {
          print(bandModel.name);
        },
      ),
    );
  }

  addNewBand() {
    final controller = TextEditingController();
    showCupertinoDialog(
      context: context,
      builder: (_) {
        return CupertinoAlertDialog(
          title: Text('New Band'),
          content: CupertinoTextField(controller: controller),
          actions: [
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text('Add'),
              onPressed: () => addBandToList(controller.text),
            ),
            CupertinoDialogAction(
              isDestructiveAction: true,
              child: Text('Dismiss'),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        );
      },
    );

    // showDialog(
    //   context: context,
    //   builder: (context) {
    // return AlertDialog(
    //   title: Text('New Band'),
    //   content: TextField(controller: controller),
    //   actions: [
    //     MaterialButton(
    //       elevation: 5,
    //       textColor: Colors.blue,
    //       child: Text('Add'),
    //       onPressed: () => addBandToList(controller.text),
    //     )
    //   ],
    // );
    //   },
    // );
  }

  void addBandToList(String name) {
    if (name.length > 1) {
      bands.add(BandModel(id: DateTime.now().toString(), name: name, votes: 5));
      setState(() {});
    }
    Navigator.pop(context);
  }
}
