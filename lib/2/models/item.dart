class Item {
  final String id;
  final String name;
  final bool isLiked;

  Item({
    required this.id,
    required this.name,
    this.isLiked = false,
  });

  Item copyWith({
    String? id,
    String? name,
    bool? isLiked,
  }) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      isLiked: isLiked ?? this.isLiked,
    );
  }
}
