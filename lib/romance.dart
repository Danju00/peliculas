import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:peliculas/home_screen.dart';
import 'package:peliculas/comedia.dart';
import 'package:peliculas/terror.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(const Romance());

class Romance extends StatelessWidget {
  static String id = 'Romance';
  const Romance({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 26, 80, 107),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 26, 80, 107),
          title: Text('Romance'),
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
              CarouselSlider(
                options: CarouselOptions(
                  height: 200.0,
                  enlargeCenterPage: true,
                  autoPlay: true,
                ),
                items: movies.map((movie) {
                  return Builder(
                    builder: (BuildContext context) {
                      return InkWell(
                        onTap: () {
                          // Abre el video de YouTube al tocar la imagen
                          launchYouTubeVideo(movie['youtubeVideoUrl']!);
                        },
                        child: Image.asset(
                          movie['imageAsset']!, // Ruta de la imagen en tu PC
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              SizedBox(
                  height: 20.0), // Espacio entre el carrusel y las tarjetas
              // Tarjetas de películas
              Column(
                children: movies.map((movie) {
                  return MovieCard(
                    title: movie['title']!,
                    imageAsset: movie['imageAsset']!,
                    youtubeVideoUrl: movie['youtubeVideoUrl']!,
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomIcons(),
      ),
    );
  }
}

class MovieCard extends StatelessWidget {
  final String title;
  final String imageAsset;
  final String youtubeVideoUrl;

  MovieCard({
    required this.title,
    required this.imageAsset,
    required this.youtubeVideoUrl,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        launchYouTubeVideo(youtubeVideoUrl);
      },
      child: Card(
        color: Color.fromARGB(255, 26, 80, 107), // Color del fondo
        child: Column(
          children: <Widget>[
            Image.asset(imageAsset, width: 150, height: 200, fit: BoxFit.cover),
            ListTile(
              title: Text(
                title,
                style: TextStyle(color: Colors.white), // Color del texto
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void launchYouTubeVideo(String videoUrl) async {
  if (await canLaunch(videoUrl)) {
    await launch(videoUrl);
  } else {
    // No se puede abrir la URL
  }
}

final List<Map<String, String>> movies = [
  {
    'title': 'PARA TODA LA VIDA',
    'imageAsset': 'assets/img/vida.jpg', // Ruta de la imagen en tu PC
    'youtubeVideoUrl': 'https://youtu.be/c06UdG7ydaI',
  },
  {
    'title': 'Love Again',
    'imageAsset': 'assets/img/again.jpeg', // Ruta de la imagen en tu PC
    'youtubeVideoUrl': 'https://youtu.be/zcRl1QqcX8I',
  },
  {
    'title': 'La probabilidad estadística del amor a primera vista',
    'imageAsset': 'assets/img/probabilidad.jpg', // Ruta de la imagen en tu PC
    'youtubeVideoUrl': 'https://youtu.be/50bLw9WitvY',
  },
  // Agrega más películas aquí
];

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
          //noficications
        ],
      ),
    );
  }
}
