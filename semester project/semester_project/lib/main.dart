import 'package:flutter/material.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Demo Home Page', style:TextStyle(fontWeight: FontWeight.bold),),
          centerTitle: true,
          backgroundColor: Colors.blueAccent,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children:[
            Expanded(
              flex: 5,
              child: Image.network("https://plus.unsplash.com/premium_photo-1750063400799-d3d386a86c36?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxmZWF0dXJlZC1waG90b3MtZmVlZHwxfHx8ZW58MHx8fHx8"), 
              ),
            Expanded(
              flex: 4,
              child: Container(
                padding: EdgeInsets.all(20.0),
                color: Colors.red,
                child:Text('Box 1')
                ),
            ),
            Expanded(
              flex:3,
              child: Container(
                padding:EdgeInsets.all(20),
                color:Colors.green,
                child: Text('Box 2'),
                ),
            ),
            
            Expanded(
              flex:2,
              child: Container(
                padding:EdgeInsets.all(20),
                color: Colors.blue,
                child: Text('Box 3'),
              ),
            )
          ], 
          ),
             
        ),   
      ),
    );
  }
}