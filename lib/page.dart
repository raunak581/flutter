import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("S.D"),
      ),
      body: const Center(
        child: Text("this is the fisrt "),
      ),
      drawer: const Drawer(),
    );
  }
}
