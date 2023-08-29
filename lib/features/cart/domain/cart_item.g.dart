// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_CartItem _$$_CartItemFromJson(Map<String, dynamic> json) => _$_CartItem(
      recipe: Recipe.fromJson(json['recipe'] as Map<String, dynamic>),
      count: json['count'] as int? ?? 1,
    );

Map<String, dynamic> _$$_CartItemToJson(_$_CartItem instance) =>
    <String, dynamic>{
      'recipe': instance.recipe,
      'count': instance.count,
    };
