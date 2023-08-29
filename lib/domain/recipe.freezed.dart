// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipe.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Recipe _$RecipeFromJson(Map<String, dynamic> json) {
  return _Recipe.fromJson(json);
}

/// @nodoc
mixin _$Recipe {
  @JsonKey(name: 'nombre')
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'descripcion')
  String get description => throw _privateConstructorUsedError;
  @JsonKey(name: 'ingredientes')
  List<Ingredient> get ingredients => throw _privateConstructorUsedError;
  @JsonKey(name: 'rendimiento', defaultValue: 1)
  int get rendimiento => throw _privateConstructorUsedError;
  @JsonKey(name: 'receta')
  List<String>? get receta => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipeCopyWith<Recipe> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipeCopyWith<$Res> {
  factory $RecipeCopyWith(Recipe value, $Res Function(Recipe) then) =
      _$RecipeCopyWithImpl<$Res, Recipe>;
  @useResult
  $Res call(
      {@JsonKey(name: 'nombre') String name,
      @JsonKey(name: 'descripcion') String description,
      @JsonKey(name: 'ingredientes') List<Ingredient> ingredients,
      @JsonKey(name: 'rendimiento', defaultValue: 1) int rendimiento,
      @JsonKey(name: 'receta') List<String>? receta});
}

/// @nodoc
class _$RecipeCopyWithImpl<$Res, $Val extends Recipe>
    implements $RecipeCopyWith<$Res> {
  _$RecipeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? ingredients = null,
    Object? rendimiento = null,
    Object? receta = freezed,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value.ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      rendimiento: null == rendimiento
          ? _value.rendimiento
          : rendimiento // ignore: cast_nullable_to_non_nullable
              as int,
      receta: freezed == receta
          ? _value.receta
          : receta // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecipeCopyWith<$Res> implements $RecipeCopyWith<$Res> {
  factory _$$_RecipeCopyWith(_$_Recipe value, $Res Function(_$_Recipe) then) =
      __$$_RecipeCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'nombre') String name,
      @JsonKey(name: 'descripcion') String description,
      @JsonKey(name: 'ingredientes') List<Ingredient> ingredients,
      @JsonKey(name: 'rendimiento', defaultValue: 1) int rendimiento,
      @JsonKey(name: 'receta') List<String>? receta});
}

/// @nodoc
class __$$_RecipeCopyWithImpl<$Res>
    extends _$RecipeCopyWithImpl<$Res, _$_Recipe>
    implements _$$_RecipeCopyWith<$Res> {
  __$$_RecipeCopyWithImpl(_$_Recipe _value, $Res Function(_$_Recipe) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? description = null,
    Object? ingredients = null,
    Object? rendimiento = null,
    Object? receta = freezed,
  }) {
    return _then(_$_Recipe(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      ingredients: null == ingredients
          ? _value._ingredients
          : ingredients // ignore: cast_nullable_to_non_nullable
              as List<Ingredient>,
      rendimiento: null == rendimiento
          ? _value.rendimiento
          : rendimiento // ignore: cast_nullable_to_non_nullable
              as int,
      receta: freezed == receta
          ? _value._receta
          : receta // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Recipe implements _Recipe {
  _$_Recipe(
      {@JsonKey(name: 'nombre') required this.name,
      @JsonKey(name: 'descripcion') required this.description,
      @JsonKey(name: 'ingredientes')
      required final List<Ingredient> ingredients,
      @JsonKey(name: 'rendimiento', defaultValue: 1) required this.rendimiento,
      @JsonKey(name: 'receta') final List<String>? receta})
      : _ingredients = ingredients,
        _receta = receta;

  factory _$_Recipe.fromJson(Map<String, dynamic> json) =>
      _$$_RecipeFromJson(json);

  @override
  @JsonKey(name: 'nombre')
  final String name;
  @override
  @JsonKey(name: 'descripcion')
  final String description;
  final List<Ingredient> _ingredients;
  @override
  @JsonKey(name: 'ingredientes')
  List<Ingredient> get ingredients {
    if (_ingredients is EqualUnmodifiableListView) return _ingredients;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ingredients);
  }

  @override
  @JsonKey(name: 'rendimiento', defaultValue: 1)
  final int rendimiento;
  final List<String>? _receta;
  @override
  @JsonKey(name: 'receta')
  List<String>? get receta {
    final value = _receta;
    if (value == null) return null;
    if (_receta is EqualUnmodifiableListView) return _receta;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Recipe(name: $name, description: $description, ingredients: $ingredients, rendimiento: $rendimiento, receta: $receta)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Recipe &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality()
                .equals(other._ingredients, _ingredients) &&
            (identical(other.rendimiento, rendimiento) ||
                other.rendimiento == rendimiento) &&
            const DeepCollectionEquality().equals(other._receta, _receta));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      name,
      description,
      const DeepCollectionEquality().hash(_ingredients),
      rendimiento,
      const DeepCollectionEquality().hash(_receta));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecipeCopyWith<_$_Recipe> get copyWith =>
      __$$_RecipeCopyWithImpl<_$_Recipe>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipeToJson(
      this,
    );
  }
}

abstract class _Recipe implements Recipe {
  factory _Recipe(
      {@JsonKey(name: 'nombre') required final String name,
      @JsonKey(name: 'descripcion') required final String description,
      @JsonKey(name: 'ingredientes')
      required final List<Ingredient> ingredients,
      @JsonKey(name: 'rendimiento', defaultValue: 1)
      required final int rendimiento,
      @JsonKey(name: 'receta') final List<String>? receta}) = _$_Recipe;

  factory _Recipe.fromJson(Map<String, dynamic> json) = _$_Recipe.fromJson;

  @override
  @JsonKey(name: 'nombre')
  String get name;
  @override
  @JsonKey(name: 'descripcion')
  String get description;
  @override
  @JsonKey(name: 'ingredientes')
  List<Ingredient> get ingredients;
  @override
  @JsonKey(name: 'rendimiento', defaultValue: 1)
  int get rendimiento;
  @override
  @JsonKey(name: 'receta')
  List<String>? get receta;
  @override
  @JsonKey(ignore: true)
  _$$_RecipeCopyWith<_$_Recipe> get copyWith =>
      throw _privateConstructorUsedError;
}

Ingredient _$IngredientFromJson(Map<String, dynamic> json) {
  return _Ingredient.fromJson(json);
}

/// @nodoc
mixin _$Ingredient {
  @JsonKey(name: 'cant', defaultValue: 0.0)
  double get quantity => throw _privateConstructorUsedError;
  @JsonKey(name: 'unit')
  String? get unit => throw _privateConstructorUsedError;
  @JsonKey(name: 'description')
  String get name => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $IngredientCopyWith<Ingredient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $IngredientCopyWith<$Res> {
  factory $IngredientCopyWith(
          Ingredient value, $Res Function(Ingredient) then) =
      _$IngredientCopyWithImpl<$Res, Ingredient>;
  @useResult
  $Res call(
      {@JsonKey(name: 'cant', defaultValue: 0.0) double quantity,
      @JsonKey(name: 'unit') String? unit,
      @JsonKey(name: 'description') String name});
}

/// @nodoc
class _$IngredientCopyWithImpl<$Res, $Val extends Ingredient>
    implements $IngredientCopyWith<$Res> {
  _$IngredientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = null,
    Object? unit = freezed,
    Object? name = null,
  }) {
    return _then(_value.copyWith(
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_IngredientCopyWith<$Res>
    implements $IngredientCopyWith<$Res> {
  factory _$$_IngredientCopyWith(
          _$_Ingredient value, $Res Function(_$_Ingredient) then) =
      __$$_IngredientCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'cant', defaultValue: 0.0) double quantity,
      @JsonKey(name: 'unit') String? unit,
      @JsonKey(name: 'description') String name});
}

/// @nodoc
class __$$_IngredientCopyWithImpl<$Res>
    extends _$IngredientCopyWithImpl<$Res, _$_Ingredient>
    implements _$$_IngredientCopyWith<$Res> {
  __$$_IngredientCopyWithImpl(
      _$_Ingredient _value, $Res Function(_$_Ingredient) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? quantity = null,
    Object? unit = freezed,
    Object? name = null,
  }) {
    return _then(_$_Ingredient(
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      unit: freezed == unit
          ? _value.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String?,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Ingredient implements _Ingredient {
  _$_Ingredient(
      {@JsonKey(name: 'cant', defaultValue: 0.0) required this.quantity,
      @JsonKey(name: 'unit') required this.unit,
      @JsonKey(name: 'description') required this.name});

  factory _$_Ingredient.fromJson(Map<String, dynamic> json) =>
      _$$_IngredientFromJson(json);

  @override
  @JsonKey(name: 'cant', defaultValue: 0.0)
  final double quantity;
  @override
  @JsonKey(name: 'unit')
  final String? unit;
  @override
  @JsonKey(name: 'description')
  final String name;

  @override
  String toString() {
    return 'Ingredient(quantity: $quantity, unit: $unit, name: $name)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Ingredient &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.unit, unit) || other.unit == unit) &&
            (identical(other.name, name) || other.name == name));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, quantity, unit, name);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_IngredientCopyWith<_$_Ingredient> get copyWith =>
      __$$_IngredientCopyWithImpl<_$_Ingredient>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_IngredientToJson(
      this,
    );
  }
}

abstract class _Ingredient implements Ingredient {
  factory _Ingredient(
      {@JsonKey(name: 'cant', defaultValue: 0.0) required final double quantity,
      @JsonKey(name: 'unit') required final String? unit,
      @JsonKey(name: 'description')
      required final String name}) = _$_Ingredient;

  factory _Ingredient.fromJson(Map<String, dynamic> json) =
      _$_Ingredient.fromJson;

  @override
  @JsonKey(name: 'cant', defaultValue: 0.0)
  double get quantity;
  @override
  @JsonKey(name: 'unit')
  String? get unit;
  @override
  @JsonKey(name: 'description')
  String get name;
  @override
  @JsonKey(ignore: true)
  _$$_IngredientCopyWith<_$_Ingredient> get copyWith =>
      throw _privateConstructorUsedError;
}
