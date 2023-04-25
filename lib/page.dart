import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "S.D",
          style: TextStyle(
              fontSize: 30, color: Color.fromARGB(255, 232, 209, 208)),
        ),
      ),
      body: const Center(
        child: Text(
          "this is the fisrt ",
          style: TextStyle(
            fontStyle: FontStyle.normal,
          ),
        ),
      ),
      drawer: const Drawer(),
    );
  }
}
