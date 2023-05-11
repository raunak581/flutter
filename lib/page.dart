// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:rkapp/models/catlog.dart';
import 'package:rkapp/utils/widgets/Itemwidgets.dart';
import 'package:rkapp/utils/widgets/drawer.dart';
import 'package:rkapp/utils/widgets/theme.dart';

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
        backgroundColor: Mytheme.creamColor,
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const CatlogHeader(),
              if (CatlogModel.items != null && CatlogModel.items.isNotEmpty)
                CatlogList().expand()
              else
                const Center(
                  child: CircularProgressIndicator(),
                )
            ]),
          ),
        ));
  }
}

class CatlogHeader extends StatelessWidget {
  const CatlogHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      "catlog app".text.bold.xl5.color(Colors.grey).make(),
      "Trending apps".text.xl2.make(),
    ]);
  }
}

class CatlogList extends StatelessWidget {
  const CatlogList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatlogModel.items.length,
      itemBuilder: (context, index) {
        final catlog = CatlogModel.items[index];
        return CatlogItems(catlog: catlog);
      },
    );
  }
}

class CatlogItems extends StatelessWidget {
  final CatlogItem catlog;
  const CatlogItems({
    Key? key,
    required this.catlog,
  })  : assert(catlog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
      children: [
        Catlogimage(image: catlog.image),
        Expanded(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            catlog.name.text.bold.lg.make(),
            catlog.desc.text.textStyle(context.captionStyle).make(),
            6.heightBox,
            ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
              buttonPadding: Vx.mH8,
              children: [
                "\$${catlog.price}".text.bold.make(),
                ElevatedButton(
                  onPressed: () {},
                  child: "buy".text.make(),
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.blue),
                      shape: MaterialStatePropertyAll(StadiumBorder())),
                )
              ],
            )
          ],
        ))
      ],
    )).white.rounded.square(100).make().py16();
  }
}

class Catlogimage extends StatelessWidget {
  const Catlogimage({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .p12
        .color(Mytheme.creamColor)
        .py32
        .make()
        .wh32(context);
  }
}
