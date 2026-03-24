import 'package:flutter/material.dart';
import 'dart:math'; // Necesario para generar las estrellas aleatorias

void main() => runApp(const DogClubApp());

class DogClubApp extends StatelessWidget {
  const DogClubApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dog Club',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF0F4F8), // Fondo
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1976D2), // AppBar
          elevation: 0,
          centerTitle: true,
        ),
      ),
      home: const DogClubGallery(),
    );
  }
}

class DogClubGallery extends StatelessWidget {
  const DogClubGallery({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> dogImages = [
      'https://raw.githubusercontent.com/NicolasRios12/imagenes-para-flutter-6I-fecha-11-feb-2026/refs/heads/main/pog1.png',
      'https://raw.githubusercontent.com/NicolasRios12/imagenes-para-flutter-6I-fecha-11-feb-2026/refs/heads/main/casa1.png',
      'https://raw.githubusercontent.com/NicolasRios12/imagenes-para-flutter-6I-fecha-11-feb-2026/refs/heads/main/pog2.png',
      'https://raw.githubusercontent.com/NicolasRios12/imagenes-para-flutter-6I-fecha-11-feb-2026/refs/heads/main/foto1.png',
      'https://raw.githubusercontent.com/NicolasRios12/imagenes-para-flutter-6I-fecha-11-feb-2026/refs/heads/main/perro2.png',
      'https://raw.githubusercontent.com/NicolasRios12/imagenes-para-flutter-6I-fecha-11-feb-2026/refs/heads/main/360_F_1710569501_7Tx8DS93v2eqGmTYEu67Bt9PqmqND0pK.webp',
      'https://raw.githubusercontent.com/NicolasRios12/imagenes-para-flutter-6I-fecha-11-feb-2026/refs/heads/main/360_F_83328481_Zsc0X8PEmN7PQqbb6nFZp1gq1LghHaZh.webp',
      'https://raw.githubusercontent.com/NicolasRios12/imagenes-para-flutter-6I-fecha-11-feb-2026/refs/heads/main/ai-generated-adorable-background-cute-dogs-playful-canine-companions-for-cheerful-pet-lovers-free-photo.webp',
      'https://raw.githubusercontent.com/NicolasRios12/imagenes-para-flutter-6I-fecha-11-feb-2026/refs/heads/main/border-collie-inteligente_25a6932c_260112115754_800x800.webp',
      'https://raw.githubusercontent.com/NicolasRios12/imagenes-para-flutter-6I-fecha-11-feb-2026/refs/heads/main/dogs-6463032_640.webp',
      'https://raw.githubusercontent.com/NicolasRios12/imagenes-para-flutter-6I-fecha-11-feb-2026/refs/heads/main/perro%201.png',
      'https://raw.githubusercontent.com/NicolasRios12/imagenes-para-flutter-6I-fecha-11-feb-2026/refs/heads/main/pexels-photo-1108099.webp',
      'https://raw.githubusercontent.com/NicolasRios12/imagenes-para-flutter-6I-fecha-11-feb-2026/refs/heads/main/pexels-photo-3114143.webp',
      'https://raw.githubusercontent.com/NicolasRios12/imagenes-para-flutter-6I-fecha-11-feb-2026/refs/heads/main/Screenshot%202026-03-24%20080535.png',
    ];

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.pets, color: Colors.white),
        title: const Text('Dog Club - Catálogo',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(10),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.65, // Ajustado para dar espacio al texto
              ),
              itemCount: dogImages.length,
              itemBuilder: (context, index) {
                // Generar número aleatorio de estrellas entre 1 y 5
                int stars = Random().nextInt(5) + 1;

                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Imagen
                      Expanded(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(12)),
                          child: Image.network(
                            dogImages[index],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      ),
                      // Contenido de texto y estrellas
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // FILA 1: Título
                            Text(
                              'Servicio ${index + 1}',
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Color(0xFF0D47A1)),
                            ),
                            // FILA 2: Subtítulo
                            const Text(
                              'Especialidad Dog Club',
                              style: TextStyle(
                                  fontSize: 12, color: Colors.grey),
                            ),
                            const SizedBox(height: 4),
                            // FILA 3: Calificación con estrellas
                            Row(
                              children: List.generate(5, (starIndex) {
                                return Icon(
                                  starIndex < stars
                                      ? Icons.star
                                      : Icons.star_border,
                                  size: 18,
                                  color: Colors.amber,
                                );
                              }),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          // Footer
          Container(
            padding: const EdgeInsets.all(12),
            width: double.infinity,
            color: const Color(0xFFBBDEFB),
            child: const Text(
              'Dog Club 2026 - Expertos en felicidad canina',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xFF0D47A1), fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}