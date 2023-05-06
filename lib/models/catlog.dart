class CatlogModel {
  static List<CatlogItem> items = [
    CatlogItem(
        id: 1,
        name: "Iphone 12 pro max",
        desc: "Latest Generation",
        price: 999,
        color: "#33505a",
        image:
            "https://tse2.mm.bing.net/th?id=OIP.1EkDbhtuD0YW-h1G3XowXAHaHa&pid=Api&P=0")
  ];
}

class CatlogItem {
  final num id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  CatlogItem(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

  factory CatlogItem.fromMap(Map<String, dynamic> map) {
    return CatlogItem(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        price: map["price"],
        color: map["color"],
        image: map["image"]);
  }

  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image,
      };
}
