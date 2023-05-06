import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rkapp/models/catlog.dart';
import 'package:rkapp/utils/widgets/Itemwidgets.dart';
import 'package:rkapp/utils/widgets/drawer.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catlogjson = await rootBundle.loadString("assets/files/Catlog.json");
    var json = jsonDecode(catlogjson);
    var products = json["products"];
    CatlogModel.items =
        List.from(products).map((items) => CatlogItem.fromMap(items)).toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final DummyList = List.generate(10, (index) => CatlogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Catlog app",
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: (CatlogModel.items != null && CatlogModel.items.isNotEmpty)
            ? GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 10),
                itemBuilder: (context, index) {
                  final item = CatlogModel.items[index];
                  return Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: GridTile(
                        header: Container(
                          decoration:
                              const BoxDecoration(color: Colors.deepPurple),
                          padding: const EdgeInsets.all(15),
                          child: Text(
                            item.name,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        footer: Text("\$${item.price}".toString()),
                        child: Image.network(item.image),
                      ));
                },
                itemCount: CatlogModel.items.length,
              )
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ),
      drawer: const DrawerPage(),
    );
  }
}
