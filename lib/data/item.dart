class Item {
  final String id;
  final String name;
  bool isLiked;

  Item({
    required this.id,
    required this.name,
    this.isLiked = false,
  });
}
