import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MovieInfoScreen(),
    );
  }
}

class MovieInfoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          color: Colors.cyan,
          child: AppBar(
            title: Text(
              'Card Widget <Odenfis>',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.cyan,
            elevation: 0,
          ),
        ),
      ),
      body: MovieCardWidget(
        title: 'Información de películas',
        description: 'Esta es una descripción del título principal para mostrar',
        images: [
          'https://i.pinimg.com/564x/a9/4d/46/a94d46b636f50a811d482694df9ea848.jpg',
          'https://i.pinimg.com/564x/8d/16/e6/8d16e62f8236cdeac19b6c77122c3e90.jpg',
          'https://i.pinimg.com/564x/e8/2a/33/e82a33149253ff0417c35e6648c3b3f3.jpg',
          'https://i.pinimg.com/564x/ce/0b/8d/ce0b8d1a4aae8407e787a90b43ea825d.jpg'
        ],
      ),
    );
  }
}

class MovieCardWidget extends StatelessWidget {
  final String title;
  final String description;
  final List<String> images;

  MovieCardWidget({required this.title, required this.description, required this.images});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          margin: EdgeInsets.all(16.0),
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Icon(Icons.local_movies, color: Colors.blue, size: 40.0),
                    SizedBox(width: 8.0),
                    Text(
                      title,
                      style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(height: 8.0),
                Text(description),
                SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: () {}, child: Text('Aceptar')),
                    TextButton(onPressed: () {}, child: Text('Cancelar')),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: images.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(25.0),
                  child: Image.network(images[index]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
