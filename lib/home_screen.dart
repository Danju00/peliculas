import 'package:flutter/material.dart';
import 'package:peliculas/comedia.dart';
import 'package:peliculas/romance.dart';
import 'package:peliculas/terror.dart';

void main() => runApp(const HomeScreen());

class HomeScreen extends StatelessWidget {
  static String id = 'home_screen';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 26, 80, 107),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 26, 80, 107),
          title: Text('Peliculas'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Aquí puedes agregar la lógica para la búsqueda
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // Aquí puedes agregar contenido adicional al body
            ],
          ),
        ),
        bottomNavigationBar: BottomIcons(),
      ),
    );
  }
}

class OvalButton extends StatelessWidget {
  final String text;
  final Color color;

  const OvalButton({
    required this.text,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
        primary: color, // Color de fondo
      ),
      child: Text(text),
    );
  }
}

class BottomIcons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color.fromRGBO(38, 31, 31, 0.7),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.0),
        ),
      ),
      height: 90.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Romance()),
              );
            },
            child: Icon(Icons.rowing, color: Colors.white),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Comedia()),
              );
            },
            child: Icon(Icons.catching_pokemon, color: Colors.white),
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Terror()),
              );
            },
            child: Icon(Icons.terrain_rounded, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
