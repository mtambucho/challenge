import 'dart:convert';

import 'package:challenge/domain/meal_type.dart';
import 'package:challenge/domain/recipe.dart';
import 'package:challenge/recetas_datasource.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

///create a provider with Riverpod for recetas to getRecetas in a clean way
final recipesProvider =
    FutureProvider.family<List<Recipe>, RecipesParams>((ref, params) async {
  final RecipesDataSource dataSource = RecipesDataSourceImpl();
  return dataSource.getRecipes(params);
});

class RecipesParams extends Equatable {
  final MealType type;

  const RecipesParams({
    required this.type,
  });

  RecipesParams copyWith({
    int? week,
    MealType? type,
  }) {
    return RecipesParams(
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'type': type.toRawValue(),
    };
  }

  factory RecipesParams.fromMap(Map<String, dynamic> map) {
    return RecipesParams(
      type: MealType.fromJson(map['type']),
    );
  }

  String toJson() => json.encode(toMap());

  factory RecipesParams.fromJson(String source) =>
      RecipesParams.fromMap(json.decode(source));

  @override
  String toString() => 'RecipesParams(type: $type)';

  @override
  List<Object> get props => [type];
}
