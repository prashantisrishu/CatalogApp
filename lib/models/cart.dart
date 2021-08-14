import 'package:catalogapp/models/model.dart';

class CartModel {
  // making singleton that creates only one Object
  static final  cartmodel = CartModel._internal();

  CartModel._internal();

  factory CartModel() => cartmodel;


  //catalog feild
  late CatalogModel _catalog;
  //id of each item
  final List<int> _itemId =[];

  //get catalog
  CatalogModel get catalog => _catalog;

  //set catalog
  set catalog(CatalogModel newCatalog) {
    _catalog = newCatalog;
  }

  //get item in cart
  List<Item> get items => _itemId.map((id) => _catalog.getById(id)).toList();

  //total cost
  num get totalPrice => items.fold(0, (total, current) => total + current.price);

  //adding a item
  void addItem(Item item) {
    _itemId.add(item.id);
  }

  //removing a item
  void removeItem(Item item) {
    _itemId.remove(item.id);
  }
}


// class AddMutation extends VxMutation<MyStore> {
//   final Item item;

//   AddMutation(this.item);
//   @override
//   perform() {
//     store!.cart._itemId.add(item.id);
//   }

// }

// class RemoveMutation extends VxMutation<MyStore> {
//   final Item item;

//   RemoveMutation(this.item);
//   @override
//   perform() {
//     store!.cart._itemId.add(item.id);
//   }

// }