import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Anasayfa extends StatefulWidget {
  @override
  _AnasayfaState createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  Future<String> veriAl() async{ // burada İnternet bağlantısında Değişiklik olabilmesinden dolayı Future ile async ettik
    http.Response gelen_veri = await http.get( // burada  await ile http.get nesnesinin çalışmasını bekleyip gelen_veri değişkenine attık
      Uri.encodeFull('https://jsonplaceholder.typicode.com/posts'), // Adreste ki çıkabilecek (http tipinde) sorunlar için uri.encodefull ile hataları giderdik
      headers: {
        "Accept":"application/json" // json tipindeki verileri kabul ettik.
      }
    );
    

    List veriler = json.decode(gelen_veri.body);
    print(veriler);
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:new Center(
          child: new RaisedButton(
            child: new Text('Veri Al'),
            onPressed: veriAl,
          ),
      ),
    );
  }
}