class Item {
  final String id;
  final String name;
  final bool isLiked;

  Item({
    required this.id,
    required this.name,
    this.isLiked = false,
  });
}
