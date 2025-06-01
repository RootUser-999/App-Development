import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Home(),
));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Assignment',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 2, 36, 63),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 250,
            width: MediaQuery.of(context).size.width,
            child: Image.network(
              'https://media.istockphoto.com/id/485371557/photo/twilight-at-spirit-island.jpg?s=612x612&w=0&k=20&c=FSGliJ4EKFP70Yjpzso0HfRR4WwflC6GKfl4F3Hj7fk=',
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'Spirit Island, Canada',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Icon(Icons.map, color: Colors.blue),
                  Text('Map'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.photo_camera, color: Colors.green),
                  Text('Photos'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.star, color: Colors.orange),
                  Text('Rating'),
                ],
              ),
              Column(
                children: [
                  Icon(Icons.share, color: Colors.purple),
                  Text('Share'),
                ],
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'Spirit Island is one of the most beautiful natural spots in the world, located in Maligne Lake in Jasper National Park, Canada. Surrounded by water and mountains, it offers peaceful scenery and stunning views.',
              style: TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}
