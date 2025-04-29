class Item {
  final int id;
  final String name;
  final bool isFavorite;

  Item({
    required this.id,
    required this.name,
    this.isFavorite = false,
  });
}
