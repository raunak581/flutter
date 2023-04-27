import 'package:flutter/material.dart';
import 'package:rkapp/utils/widgets/drawer.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catlog app",
          style: TextStyle(fontSize: 20, color: Colors.black),
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
      drawer: const DrawerPage(),
    );
  }
}
