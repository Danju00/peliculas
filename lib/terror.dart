import 'package:flutter/material.dart';
import 'package:peliculas/home_screen.dart';

void main() => runApp(const Terror());

class Terror extends StatelessWidget {
  static String id = 'Terror';
  const Terror({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 72, 165, 144),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 72, 165, 144),
          title: Text('Terror'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  OvalButton(
                    text: 'All',
                    color: Color.fromRGBO(128, 128, 128, 0.7),
                  ),
                ],
              ),
              SizedBox(height: 20.0),
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
          //home
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            },
            child: Icon(
              Icons.home,
              color: Colors.white,
            ),
          ),
          //noficications
        ],
      ),
    );
  }
}
