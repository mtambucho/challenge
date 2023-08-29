import 'package:challenge/domain/meal_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'recipes_params.freezed.dart';
part 'recipes_params.g.dart';

@freezed
class RecipesParams with _$RecipesParams {
  const factory RecipesParams({
    required MealType type,
  }) = _RecipesParams;

  factory RecipesParams.fromJson(Map<String, dynamic> json) =>
      _$RecipesParamsFromJson(json);
}
