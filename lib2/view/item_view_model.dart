import 'package:state/models/item.dart';

class ItemViewModel {
  final Item item;

  ItemViewModel({
    required this.item,
  });

  String get displayName {
    return item.name;
  }
}
