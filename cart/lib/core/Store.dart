// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cart/models/Cart.dart';
import 'package:cart/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore {
  late CatalogModel catalog;
  late CartModel cart;

  MyStore() {
    catalog = CatalogModel();
    cart = CartModel();
    cart.catalog = catalog;
  }
}
