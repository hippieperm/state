import '../models/item.dart';

class ItemViewModel {
  final Item item;

  ItemViewModel(this.item);

  String get displayName => item.name;
}
