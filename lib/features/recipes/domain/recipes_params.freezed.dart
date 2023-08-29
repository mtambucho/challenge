// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recipes_params.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecipesParams _$RecipesParamsFromJson(Map<String, dynamic> json) {
  return _RecipesParams.fromJson(json);
}

/// @nodoc
mixin _$RecipesParams {
  MealType get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecipesParamsCopyWith<RecipesParams> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipesParamsCopyWith<$Res> {
  factory $RecipesParamsCopyWith(
          RecipesParams value, $Res Function(RecipesParams) then) =
      _$RecipesParamsCopyWithImpl<$Res, RecipesParams>;
  @useResult
  $Res call({MealType type});
}

/// @nodoc
class _$RecipesParamsCopyWithImpl<$Res, $Val extends RecipesParams>
    implements $RecipesParamsCopyWith<$Res> {
  _$RecipesParamsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MealType,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RecipesParamsCopyWith<$Res>
    implements $RecipesParamsCopyWith<$Res> {
  factory _$$_RecipesParamsCopyWith(
          _$_RecipesParams value, $Res Function(_$_RecipesParams) then) =
      __$$_RecipesParamsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({MealType type});
}

/// @nodoc
class __$$_RecipesParamsCopyWithImpl<$Res>
    extends _$RecipesParamsCopyWithImpl<$Res, _$_RecipesParams>
    implements _$$_RecipesParamsCopyWith<$Res> {
  __$$_RecipesParamsCopyWithImpl(
      _$_RecipesParams _value, $Res Function(_$_RecipesParams) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
  }) {
    return _then(_$_RecipesParams(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as MealType,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RecipesParams implements _RecipesParams {
  const _$_RecipesParams({required this.type});

  factory _$_RecipesParams.fromJson(Map<String, dynamic> json) =>
      _$$_RecipesParamsFromJson(json);

  @override
  final MealType type;

  @override
  String toString() {
    return 'RecipesParams(type: $type)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RecipesParams &&
            (identical(other.type, type) || other.type == type));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, type);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RecipesParamsCopyWith<_$_RecipesParams> get copyWith =>
      __$$_RecipesParamsCopyWithImpl<_$_RecipesParams>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RecipesParamsToJson(
      this,
    );
  }
}

abstract class _RecipesParams implements RecipesParams {
  const factory _RecipesParams({required final MealType type}) =
      _$_RecipesParams;

  factory _RecipesParams.fromJson(Map<String, dynamic> json) =
      _$_RecipesParams.fromJson;

  @override
  MealType get type;
  @override
  @JsonKey(ignore: true)
  _$$_RecipesParamsCopyWith<_$_RecipesParams> get copyWith =>
      throw _privateConstructorUsedError;
}
