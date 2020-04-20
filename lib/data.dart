

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Datatransfer extends StatefulWidget {
  @override
  _Datatransferstate createState() => _Datatransferstate();
}

class _Datatransferstate extends State<Datatransfer> {
  var controller = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
        appBar: (new AppBar(title: new Text("History"))),
        body: new ListView(
          children: <Widget>[
            new ListTile(
              title: new TextField(
                controller: controller,
              ),
            ),
            new ListTile(
                title: new RaisedButton(
              child: new Text("To history"),
              onPressed: () {
                saveName();
                              },
                            ))
                          ],
                        ));
                  }
                
                  void saveName() {
                    String name = controller.text;  
                    saveNamePreference(name).then((bool commited){
                     Navigator.of(context).pushNamed(History.routeName);
                    });
              
                  }
}

Future<bool> saveNamePreference(String name) async{
SharedPreferences pref =await SharedPreferences.getInstance();
pref.setString("name", name);
  return pref.commit; 
}

Future<String>getNamePreference() async{
  SharedPreferences pref =await SharedPreferences.getInstance();
  String name = pref.getString("name");

return name;
}

class History extends StatefulWidget {
  static String routeName = "/History";
  @override
  _HistoryState createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  String _name = "";
  @override
  void initState() {
    getNamePreference().then(updateName);
        super.initState();
      }
      @override
      Widget build(BuildContext context) {
        return new Scaffold(
          appBar: new AppBar(title: Text("History")),
          body: new ListTile(
            title: new Text(_name),
          ),
        );
      }
    
      void updateName(String name) {
       
        setState(() {
           this._name = name;
        });
  }
}
