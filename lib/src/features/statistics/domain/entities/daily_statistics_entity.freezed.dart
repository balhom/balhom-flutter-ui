// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'daily_statistics_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DailyStatisticsEntity _$DailyStatisticsEntityFromJson(
    Map<String, dynamic> json) {
  return _DailyStatisticsEntity.fromJson(json);
}

/// @nodoc
mixin _$DailyStatisticsEntity {
  int get day => throw _privateConstructorUsedError;
  double get expense => throw _privateConstructorUsedError;
  double get revenue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DailyStatisticsEntityCopyWith<DailyStatisticsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyStatisticsEntityCopyWith<$Res> {
  factory $DailyStatisticsEntityCopyWith(DailyStatisticsEntity value,
          $Res Function(DailyStatisticsEntity) then) =
      _$DailyStatisticsEntityCopyWithImpl<$Res, DailyStatisticsEntity>;
  @useResult
  $Res call({int day, double expense, double revenue});
}

/// @nodoc
class _$DailyStatisticsEntityCopyWithImpl<$Res,
        $Val extends DailyStatisticsEntity>
    implements $DailyStatisticsEntityCopyWith<$Res> {
  _$DailyStatisticsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? expense = null,
    Object? revenue = null,
  }) {
    return _then(_value.copyWith(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      expense: null == expense
          ? _value.expense
          : expense // ignore: cast_nullable_to_non_nullable
              as double,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyStatisticsEntityImplCopyWith<$Res>
    implements $DailyStatisticsEntityCopyWith<$Res> {
  factory _$$DailyStatisticsEntityImplCopyWith(
          _$DailyStatisticsEntityImpl value,
          $Res Function(_$DailyStatisticsEntityImpl) then) =
      __$$DailyStatisticsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int day, double expense, double revenue});
}

/// @nodoc
class __$$DailyStatisticsEntityImplCopyWithImpl<$Res>
    extends _$DailyStatisticsEntityCopyWithImpl<$Res,
        _$DailyStatisticsEntityImpl>
    implements _$$DailyStatisticsEntityImplCopyWith<$Res> {
  __$$DailyStatisticsEntityImplCopyWithImpl(_$DailyStatisticsEntityImpl _value,
      $Res Function(_$DailyStatisticsEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? day = null,
    Object? expense = null,
    Object? revenue = null,
  }) {
    return _then(_$DailyStatisticsEntityImpl(
      day: null == day
          ? _value.day
          : day // ignore: cast_nullable_to_non_nullable
              as int,
      expense: null == expense
          ? _value.expense
          : expense // ignore: cast_nullable_to_non_nullable
              as double,
      revenue: null == revenue
          ? _value.revenue
          : revenue // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$DailyStatisticsEntityImpl implements _DailyStatisticsEntity {
  const _$DailyStatisticsEntityImpl(
      {required this.day, required this.expense, required this.revenue});

  factory _$DailyStatisticsEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyStatisticsEntityImplFromJson(json);

  @override
  final int day;
  @override
  final double expense;
  @override
  final double revenue;

  @override
  String toString() {
    return 'DailyStatisticsEntity(day: $day, expense: $expense, revenue: $revenue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyStatisticsEntityImpl &&
            (identical(other.day, day) || other.day == day) &&
            (identical(other.expense, expense) || other.expense == expense) &&
            (identical(other.revenue, revenue) || other.revenue == revenue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, day, expense, revenue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyStatisticsEntityImplCopyWith<_$DailyStatisticsEntityImpl>
      get copyWith => __$$DailyStatisticsEntityImplCopyWithImpl<
          _$DailyStatisticsEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyStatisticsEntityImplToJson(
      this,
    );
  }
}

abstract class _DailyStatisticsEntity implements DailyStatisticsEntity {
  const factory _DailyStatisticsEntity(
      {required final int day,
      required final double expense,
      required final double revenue}) = _$DailyStatisticsEntityImpl;

  factory _DailyStatisticsEntity.fromJson(Map<String, dynamic> json) =
      _$DailyStatisticsEntityImpl.fromJson;

  @override
  int get day;
  @override
  double get expense;
  @override
  double get revenue;
  @override
  @JsonKey(ignore: true)
  _$$DailyStatisticsEntityImplCopyWith<_$DailyStatisticsEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
