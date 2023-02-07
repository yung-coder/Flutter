import 'package:cart/models/catalog.dart';

class CartModel {
  static final cartModel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartModel;

  late CatalogModel _catalog;

  final List<int> _ItemsIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  List<Item> get items => _ItemsIds.map((id) => _catalog.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (totalValue, current) => totalValue + current.price);

  void add(Item item) {
    _ItemsIds.add(item.id);
  }

  void remove(Item item) {
    _ItemsIds.remove(item.id);
  }
}
