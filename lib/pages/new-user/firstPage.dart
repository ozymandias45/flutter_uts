import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 25, 25, 25),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'NAYANAKA',
                    style: TextStyle(
                      color: Colors.yellow,
                      fontSize: 40,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    'Welcome to the app designed to help you discover communities tailored to your interests.',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,    
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Center(
              child: Image(
                image: AssetImage('../assets/images/computer.png'),
                width: 280,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.arrow_circle_right_outlined,
                    color: Colors.yellow,
                    size: 40.0,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
