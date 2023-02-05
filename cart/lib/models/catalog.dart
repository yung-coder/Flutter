class CatalogModel {
  static final items = [
    Item(
        id: 1,
        name: "Realme",
        desc: "Its pretty cool",
        price: 999,
        color: "#5435334",
        image:
            "https://store.storeimages.cdn-apple.com/4668/as-images.apple.com/is/iphone-13-finish-select-202207-6-1inch-blue?wid=2560&hei=1440&fmt=p-jpg&qlt=80&.v=1656712888128")
  ];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.image,
      required this.color});
}