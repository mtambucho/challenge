// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'day_meals.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DayMeals _$DayMealsFromJson(Map<String, dynamic> json) {
  return _DayMeals.fromJson(json);
}

/// @nodoc
mixin _$DayMeals {
  int get day => throw _privateConstructorUsedError;
  Map<MealType, Recipe> get meals => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DayMealsCopyWith<DayMeals> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DayMealsCopyWith<$Res> {
  factory $DayMealsCopyWith(DayMeals value, $Res Function(DayMeals) then) =
      _$DayMealsCopyWithImpl<$Res, DayMeals>;
  @useResult
  $Res call({int day, Map<MealType, Recipe> meals});
}

/// @nodoc
class _$DayMealsCopyWithImpl<$Res, $Val extends DayMeals>
    implements $DayMealsCopyWith<$Res> {
  _$DayMealsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? meals = null,
  }) {
    return _then(_value.copyWith(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      meals: null == meals
          ? _value.meals
          : meals // ignore: cast_nullable_to_non_nullable
              as Map<MealType, Recipe>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DayMealsCopyWith<$Res> implements $DayMealsCopyWith<$Res> {
  factory _$$_DayMealsCopyWith(
          _$_DayMeals value, $Res Function(_$_DayMeals) then) =
      __$$_DayMealsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int day, Map<MealType, Recipe> meals});
}

/// @nodoc
class __$$_DayMealsCopyWithImpl<$Res>
    extends _$DayMealsCopyWithImpl<$Res, _$_DayMeals>
    implements _$$_DayMealsCopyWith<$Res> {
  __$$_DayMealsCopyWithImpl(
      _$_DayMeals _value, $Res Function(_$_DayMeals) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? meals = null,
  }) {
    return _then(_$_DayMeals(
      null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      null == meals
          ? _value._meals
          : meals // ignore: cast_nullable_to_non_nullable
              as Map<MealType, Recipe>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DayMeals implements _DayMeals {
  const _$_DayMeals(this.day, final Map<MealType, Recipe> meals)
      : _meals = meals;

  factory _$_DayMeals.fromJson(Map<String, dynamic> json) =>
      _$$_DayMealsFromJson(json);

  @override
  final int day;
  final Map<MealType, Recipe> _meals;
  @override
  Map<MealType, Recipe> get meals {
    if (_meals is EqualUnmodifiableMapView) return _meals;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_meals);
  }

  @override
  String toString() {
    return 'DayMeals(day: $day, meals: $meals)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DayMeals &&
            (identical(other.day, day) || other.day == day) &&
            const DeepCollectionEquality().equals(other._meals, _meals));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, day, const DeepCollectionEquality().hash(_meals));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DayMealsCopyWith<_$_DayMeals> get copyWith =>
      __$$_DayMealsCopyWithImpl<_$_DayMeals>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DayMealsToJson(
      this,
    );
  }
}

abstract class _DayMeals implements DayMeals {
  const factory _DayMeals(final int day, final Map<MealType, Recipe> meals) =
      _$_DayMeals;

  factory _DayMeals.fromJson(Map<String, dynamic> json) = _$_DayMeals.fromJson;

  @override
  int get day;
  @override
  Map<MealType, Recipe> get meals;
  @override
  @JsonKey(ignore: true)
  _$$_DayMealsCopyWith<_$_DayMeals> get copyWith =>
      throw _privateConstructorUsedError;
}
