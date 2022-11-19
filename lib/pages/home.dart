import 'dart:io';

import 'package:band_names/models/band.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
  
}

class _HomePageState extends State<HomePage> {
  List<Band> bands = [
    Band(id: '1', name: 'Metallica', votes: 5),
    Band(id: '2', name: 'Queen', votes: 5),
    Band(id: '3', name: 'The Beatles', votes: 5),
    Band(id: '4', name: 'Bon jovi', votes: 5),
    Band(id: '5', name: 'Mana', votes: 5),
    Band(id: '6', name: 'AC/DC', votes: 5),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BandNames', style: TextStyle(color: Colors.black87),),
        backgroundColor: Colors.white,
        elevation: 1,
        ),
      body: ListView.builder(
        itemCount: bands.length,
        itemBuilder: (context, i) => _bandTitle(bands[i])
         ),
         floatingActionButton: FloatingActionButton(
          onPressed: appNewBand,
          elevation: 1,
          child: Icon( Icons.add),
         ),
    );
  }

  Widget _bandTitle(Band band) {
    return Dismissible(
      key: Key(band.id),
      direction: DismissDirection.startToEnd,
      onDismissed: (direction){
        print('direction: $direction');
      },
      background: Container(
        color: Colors.red,
        padding: EdgeInsets.only(left: 8.0), 
        child: Align(
          alignment: Alignment.centerLeft , 
          child: Text('Delete Band', style: TextStyle(color: Colors.white),)),
          ),
      child: ListTile(
            leading:  CircleAvatar(
              child: Text( band.name.substring(0,2) ),
              backgroundColor: Colors.blue[100],          
            ),
            title: Text(band.name),
            trailing: Text('${ band.votes}', style: TextStyle( fontSize:  20),),
            onTap: (){
              print(band.name);
            },
          ),
    );
  }

  appNewBand() {

    final textController = new TextEditingController();
    if (Platform.isAndroid) {
      return showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: Text('New band name:'),
          content: TextField(
            controller: textController,
          ),
          actions: <Widget>[
            MaterialButton(
              child: Text('Add'),
              textColor: Colors.blue,
              elevation: 5,
              onPressed: () => aadBandToList( textController.text)
              )
          ],
        );
      }
    ); 
    }
    showCupertinoDialog(
      context: context, 
      builder: ( _ ){
        return CupertinoAlertDialog(
          title: Text('New band name:'),
          content: CupertinoTextField(
            controller: textController,),
          actions: <Widget>[
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text('Add'),
              onPressed: () => aadBandToList( textController.text),
            ),
            CupertinoDialogAction(
              isDefaultAction: true,
              child: Text('Close'),
              onPressed: () => Navigator.pop(context),
            )
          ],  
        );
      }
    );
    
  }

  aadBandToList(String name){
    print(name);
    if( name.length > 1){
      this.bands.add(
        new Band(id: DateTime.now().toString(), name: name, votes: 0)
      );
      setState(() {        
      });
    }
    Navigator.pop(context);
  }
}

