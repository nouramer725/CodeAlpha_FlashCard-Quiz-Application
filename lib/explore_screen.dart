import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flashcard_quiz_app/quiz_screen.dart';
import 'package:flutter/material.dart';
import 'LearningScreen.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

final List<String> Categories = [
  'General Knowledge',
  'Science & Nature',
  'Sports',
  'History',
  'Random'
];

final List<String> ImageList = [
  'https://play-lh.googleusercontent.com/7nZqAPEuWxAeckXC-lm1fWEk6pDK3mRlUCxPuLIctJ1MD9RM0HPgOdrhOwr39deWSjtn',
  'https://cdn-icons-png.flaticon.com/512/6747/6747064.png',
  'https://cdn-icons-png.freepik.com/256/5351/5351486.png?semt=ais_hybrid',
  'https://cdn-icons-png.flaticon.com/512/10089/10089731.png',
  'https://cdn-icons-png.flaticon.com/512/6662/6662916.png',
];

class _ExploreScreenState extends State<ExploreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 12.0,
                  mainAxisSpacing: 15.0,
                ),
                itemCount: Categories.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Learningscreen(
                            category: Categories[index],
                          ),
                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Stack(
                        children: [
                          CachedNetworkImage(
                            imageUrl: ImageList[index],
                            fit: BoxFit.cover,
                            width: double.infinity,
                            height: double.infinity,
                          ),
                           Opacity(
                              opacity: 0.6,
                              child: Container(
                                color: Colors.black87,
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    backgroundImage: CachedNetworkImageProvider(ImageList[index]),
                                    radius: 20,
                                  ),
                                ),
                                SizedBox(height: 30),
                                Text(
                                  Categories[index],
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                Spacer(),
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: IconButton(
                                    icon: Icon(Icons.play_arrow, color: Colors.white),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => QuizScreen(category: Categories[index],),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
