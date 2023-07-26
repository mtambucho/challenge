// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recipe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recipe _$RecipeFromJson(Map<String, dynamic> json) => Recipe(
      name: json['nombre'] as String,
      description: json['descripcion'] as String,
      ingredients: (json['ingredientes'] as List<dynamic>)
          .map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
          .toList(),
      rendimiento: json['rendimiento'] as int? ?? 1,
      receta:
          (json['receta'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$RecipeToJson(Recipe instance) => <String, dynamic>{
      'nombre': instance.name,
      'descripcion': instance.description,
      'ingredientes': instance.ingredients,
      'rendimiento': instance.rendimiento,
      'receta': instance.receta,
    };

Ingredient _$IngredientFromJson(Map<String, dynamic> json) => Ingredient(
      quantity: (json['cant'] as num?)?.toDouble() ?? 0.0,
      unit: json['unit'] as String?,
      name: json['description'] as String,
    );

Map<String, dynamic> _$IngredientToJson(Ingredient instance) =>
    <String, dynamic>{
      'cant': instance.quantity,
      'unit': instance.unit,
      'description': instance.name,
    };
