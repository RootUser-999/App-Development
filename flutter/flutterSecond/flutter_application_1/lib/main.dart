
import 'package:flutter/material.dart';

void main()=> runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(
      title:Text('My first app'
      ),
      centerTitle:true,
      backgroundColor:Color(0xFF0000FF), // Blue color
    ),
    body:Center(
      child:Text('hello world'),),
    
    floatingActionButton: FloatingActionButton(
       
      child:Text('click'),
      onPressed: (){
        print('Button clicked!');
      },
    ),
  ),

));
  