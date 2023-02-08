import 'package:cart/core/Store.dart';
import 'package:cart/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CartModel {
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
}

class AddMutation extends VxMutation<MyStore> {
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store!.cart._ItemsIds.add(item.id);
  }
}

class RemoveMutation extends VxMutation<MyStore> {
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store!.cart._ItemsIds.remove(item.id);
  }
}
