import 'package:flutter/material.dart';
import 'package:project1/MyObject.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

List<MyObject> list=new List();

void query(){

  String url="https://jsonplaceholder.typicode.com/photos";

  http.get(url).then((response){

    if(response.statusCode==200){
      setState(() {
        list=(json.decode(utf8.decode(response.bodyBytes)) as List)
            .map((data) => new MyObject.fromJson(data)).toList();
      });




    }else{
      throw Exception('Failed To Load');
    }



  });


}


@override
  void initState() {
  query();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text('First Project'),
      ),
      body: Center(
          child:


          ListView.builder(
              itemCount: list.length,
              itemBuilder: (BuildContext context,int index){

            return Card(
              elevation: 10,
              child: Column(children: <Widget>[




                Image.network(list[index].url),
                Text(list[index].title,style: TextStyle(color: Colors.blue,fontSize: 25),)



              ],),


            );


          })




        ),
        
        



    );
  }
}
