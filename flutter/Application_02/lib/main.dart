import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner:false,
    home:Scaffold(
      appBar:AppBar(
        title: Text('second flutter app',style:TextStyle(fontWeight: FontWeight.bold,fontSize: 25,fontFamily: 'Roboto',color: Colors.blue)),
        centerTitle:true,
        backgroundColor: const Color.fromARGB(255, 1, 17, 63),
      ),
      body:Container(
        height: double.infinity,
        width: double.infinity,
        color:Colors.black,
        
        child: Center(
          child: Text('This is my second flutter app'
          ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,fontFamily: 'Roboto',color: Colors.blue),),
           
        ),
      )

    )
  ));
}