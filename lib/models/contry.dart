// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CountryModel {
  static List<Item> items = [];
}

class Item {
  final int c_id;
  final String c_name;
  final String c_icon;

  Item(
    this.c_id,
    this.c_name,
    this.c_icon,
  );

  Item copyWith({
    int? c_id,
    String? c_name,
    String? c_icon,
  }) {
    return Item(
      c_id ?? this.c_id,
      c_name ?? this.c_name,
      c_icon ?? this.c_icon,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'c_id': c_id,
      'c_name': c_name,
      'c_icon': c_icon,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      map['c_id'] as int,
      map['c_name'] as String,
      map['c_icon'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) =>
      Item.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Item(c_id: $c_id, c_name: $c_name, c_icon: $c_icon)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.c_id == c_id &&
        other.c_name == c_name &&
        other.c_icon == c_icon;
  }

  @override
  int get hashCode => c_id.hashCode ^ c_name.hashCode ^ c_icon.hashCode;
}
