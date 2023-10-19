import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:peliculas/romance.dart';
import 'package:url_launcher/url_launcher.dart';

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
    'title': 'FIVE NIGHTS AT FREDDY',
    'imageAsset': 'assets/img/fnaf.jpg', // Ruta de la imagen en tu PC
    'youtubeVideoUrl': 'https://youtu.be/IJD1VktHJSw',
  },
  {
    'title': 'Megalodon 2',
    'imageAsset': 'assets/img/mega.jpg', // Ruta de la imagen en tu PC
    'youtubeVideoUrl': 'https://youtu.be/7wuK5PhzcNY',
  },
  {
    'title': 'The Marvels',
    'imageAsset':
        'assets/img/themarvels_imax_digital_supplemental_tix_v3_lg.jpg', // Ruta de la imagen en tu PC
    'youtubeVideoUrl': 'https://youtu.be/itm8efx8k8U',
  },
  // Agrega más películas aquí
];
