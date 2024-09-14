import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(35.0),
        child: Center(
          child: Row(
            children: [
              Text(
                ' F',
                style: TextStyle(
                  color: Colors.redAccent[200],
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'L',
                style: TextStyle(
                  color: Colors.green[300],
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'A',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow[300],
                ),
              ),
              const Text(
                'S',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'H',
                style: TextStyle(
                  color: Colors.yellow[300],
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'C',
                style: TextStyle(
                  color: Colors.green[300],
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'A',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.yellow[300],
                ),
              ),
              const Text(
                'R',
                style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'D',
                style: TextStyle(
                  color: Colors.yellow[300],
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                'QUIZ',
                style: TextStyle(
                  color: Colors.red[300],
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
