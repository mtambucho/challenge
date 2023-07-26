import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recipe.g.dart';

@JsonSerializable()
class Recipe extends Equatable {
  @JsonKey(name: 'nombre')
  final String name;
  @JsonKey(name: 'descripcion')
  final String description;
  @JsonKey(name: 'ingredientes')
  final List<Ingredient> ingredients;
  @JsonKey(name: 'rendimiento', defaultValue: 1)
  final int rendimiento;
  @JsonKey(name: 'receta')
  final List<String>? receta;

  const Recipe({
    required this.name,
    required this.description,
    required this.ingredients,
    required this.rendimiento,
    this.receta,
  });

  factory Recipe.fromJson(Map<String, dynamic> json) => _$RecipeFromJson(json);

  Map<String, dynamic> toJson() => _$RecipeToJson(this);

  @override
  List<Object?> get props => [name];
}

@JsonSerializable()
class Ingredient {
  @JsonKey(name: 'cant', defaultValue: 0.0)
  final double quantity;
  @JsonKey(name: 'unit')
  final String? unit;
  @JsonKey(name: 'description')
  final String name;

  Ingredient({
    required this.quantity,
    required this.unit,
    required this.name,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) =>
      _$IngredientFromJson(json);

  Map<String, dynamic> toJson() => _$IngredientToJson(this);

  ///create copy with function to copy Ingredient
  Ingredient copyWith({
    double? quantity,
    String? unit,
    String? name,
  }) {
    return Ingredient(
      quantity: quantity ?? this.quantity,
      unit: unit ?? this.unit,
      name: name ?? this.name,
    );
  }
}

class ParseHelper {
  static double toDoubleSafe(dynamic value) {
    if (value == null) {
      return 0.0;
    }
    if (value is String) {
      return double.tryParse(value) ?? 0.0;
    }
    if (value is int) {
      return value.toDouble();
    }
    if (value is double) {
      return value;
    } else {
      return 0.0;
    }
  }
}
