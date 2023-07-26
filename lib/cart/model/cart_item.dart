import 'package:challenge/domain/recipe.dart';
import 'package:json_annotation/json_annotation.dart';

part 'cart_item.g.dart';

@JsonSerializable()
class CartItem {
  final Recipe recipe;
  final int count;
  CartItem({
    required this.recipe,
    this.count = 1,
  });

  CartItem copyWith({
    Recipe? recipe,
    int? count,
  }) {
    return CartItem(
      recipe: recipe ?? this.recipe,
      count: count ?? this.count,
    );
  }

  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);

  Map<String, dynamic> toJson() => _$CartItemToJson(this);
}
