import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fruits_api/fruit_modals.dart';
import 'package:http/http.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      title: 'Fruit API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: httpScreen(),
    );
  }
}
class httpScreen extends StatefulWidget {
  const httpScreen({Key? key}) : super(key: key);

  @override
  _httpScreenState createState() => _httpScreenState();
}

class _httpScreenState extends State<httpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("KK Fruit API"),
      ),
      body: Center(
        child: FutureBuilder<fruitModal>(
          future: getFruit(),
          builder: (context,snapshot){
            if(snapshot.hasData){
              String name=snapshot.data as String;
              String id=snapshot.data as String;
              String genus=snapshot.data as String;
              String family=snapshot.data as String;
              String order=snapshot.data as String;
              String nutritions=snapshot.data as String;

              return Text("name:${name}\n "
                  "id:${id} \n "
                  "genus:${genus}\n"
                  " family:${family}\n"
                  " order:${order}\n "
                  "nutritons:${nutritions}"
              );
            }else if(snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
          return CircularProgressIndicator();
          },

        ),
      ),
    );
  }
}

Future<fruitModal>getFruit()async{
 final url="https://www.fruityvice.com/api/fruit/banana";
  final responce=await get(Uri.parse(url));

  if(responce.statusCode==200){
    final jsonFruit=jsonDecode(responce.body);
    return fruitModal.fromJson(jsonFruit);
  }else{
    throw Exception();
  }
}