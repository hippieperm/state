class Item {
  final int id;
  final String name;
  bool isFavorite;

  Item({required this.id, required this.name, this.isFavorite = false});

  // 객체 복제 메서드 (불변성 유지를 위해)
  Item copyWith({int? id, String? name, bool? isFavorite}) {
    return Item(
      id: id ?? this.id,
      name: name ?? this.name,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
