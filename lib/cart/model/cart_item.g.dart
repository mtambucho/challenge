// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItem _$CartItemFromJson(Map<String, dynamic> json) => CartItem(
      recipe: Recipe.fromJson(json['recipe'] as Map<String, dynamic>),
      count: json['count'] as int? ?? 1,
    );

Map<String, dynamic> _$CartItemToJson(CartItem instance) => <String, dynamic>{
      'recipe': instance.recipe,
      'count': instance.count,
    };
