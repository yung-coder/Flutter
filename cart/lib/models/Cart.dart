import 'package:cart/models/catalog.dart';

class CartModel {
  late CatalogModel _catalog;

  final List<int> _ItemsIds = [];

  CatalogModel get catalog => _catalog;

  set catalog(CatalogModel newCatalog) {
    assert(newCatalog != null);
    _catalog = newCatalog;
  }

  Iterable<Item> get items =>
      _ItemsIds.map((id) => _catalog.getById(id)).toList();

  num get totalPrice =>
      items.fold(0, (totalValue, current) => totalValue + current.price);

  void add(Item item) {
    _ItemsIds.add(item.id);
  }

  void remove(Item item) {
    _ItemsIds.remove(item.id);
  }
}
