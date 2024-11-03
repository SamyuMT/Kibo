import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text('Hola mundo'),
            const Text('Hola mundo'),
            const Text('Hola mundo'),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Hola mundo'),
                Text('Hola mundo'),
              ],
            ),
            Container(
              width: 200,
              height: 100,
              decoration: const BoxDecoration(color: Colors.yellowAccent),
            ),
            Image.asset(
              'assets/Recurso 1.png',
              width: 300,
              height: 300,
              fit: BoxFit.contain,
            )
          ],
        ),
      ),
    );
  }
}
