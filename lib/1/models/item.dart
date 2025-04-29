class Item {
  final int id;
  final String name;
  final bool isFavorite;

  Item({
    required this.id,
    required this.name,
    this.isFavorite = false,
  });

  Item copyWith({int? id, String? name, bool? isFavorite}) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
