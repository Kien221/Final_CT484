import 'dart:math';

import 'package:flutter/material.dart';

class AppBanner extends StatelessWidget {
  const AppBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10.0),
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 60.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Text(
            'Food',
            style: TextStyle(
              color: Color.fromARGB(255, 254, 254, 254),
              fontSize: 35,
              fontFamily: 'Anton',
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          const Image(
            image: AssetImage('assets/images/logo.jpg'),
            width: 100,
          ),
          const SizedBox(
            width: 20,
          ),
          Transform(
            transform: Matrix4.rotationZ(-8 * pi / 180)..translate(-10.0),
            alignment: Alignment.center,
            child: const Text(
              'App',
              style: TextStyle(
                color: Color.fromARGB(255, 238, 76, 6),
                fontSize: 40,
                fontFamily: 'Anton',
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
