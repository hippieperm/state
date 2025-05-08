import '../data/item.dart';

class ItemViewModel {
  final Item item;

  ItemViewModel(this.item);

  void toggleLike() {
    item.isLiked = !item.isLiked;
  }
}
