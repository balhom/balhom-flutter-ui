// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'monthly_statistics_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MonthlyStatisticsEntity _$MonthlyStatisticsEntityFromJson(
    Map<String, dynamic> json) {
  return _MonthlyStatisticsEntity.fromJson(json);
}

/// @nodoc
mixin _$MonthlyStatisticsEntity {
  int get month => throw _privateConstructorUsedError;
  double get expense => throw _privateConstructorUsedError;
  double get revenue => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MonthlyStatisticsEntityCopyWith<MonthlyStatisticsEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlyStatisticsEntityCopyWith<$Res> {
  factory $MonthlyStatisticsEntityCopyWith(MonthlyStatisticsEntity value,
          $Res Function(MonthlyStatisticsEntity) then) =
      _$MonthlyStatisticsEntityCopyWithImpl<$Res, MonthlyStatisticsEntity>;
  @useResult
  $Res call({int month, double expense, double revenue});
}

/// @nodoc
class _$MonthlyStatisticsEntityCopyWithImpl<$Res,
        $Val extends MonthlyStatisticsEntity>
    implements $MonthlyStatisticsEntityCopyWith<$Res> {
  _$MonthlyStatisticsEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? expense = null,
    Object? revenue = null,
  }) {
    return _then(_value.copyWith(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
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
abstract class _$$MonthlyStatisticsEntityImplCopyWith<$Res>
    implements $MonthlyStatisticsEntityCopyWith<$Res> {
  factory _$$MonthlyStatisticsEntityImplCopyWith(
          _$MonthlyStatisticsEntityImpl value,
          $Res Function(_$MonthlyStatisticsEntityImpl) then) =
      __$$MonthlyStatisticsEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int month, double expense, double revenue});
}

/// @nodoc
class __$$MonthlyStatisticsEntityImplCopyWithImpl<$Res>
    extends _$MonthlyStatisticsEntityCopyWithImpl<$Res,
        _$MonthlyStatisticsEntityImpl>
    implements _$$MonthlyStatisticsEntityImplCopyWith<$Res> {
  __$$MonthlyStatisticsEntityImplCopyWithImpl(
      _$MonthlyStatisticsEntityImpl _value,
      $Res Function(_$MonthlyStatisticsEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? expense = null,
    Object? revenue = null,
  }) {
    return _then(_$MonthlyStatisticsEntityImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
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
class _$MonthlyStatisticsEntityImpl implements _MonthlyStatisticsEntity {
  const _$MonthlyStatisticsEntityImpl(
      {required this.month, required this.expense, required this.revenue});

  factory _$MonthlyStatisticsEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlyStatisticsEntityImplFromJson(json);

  @override
  final int month;
  @override
  final double expense;
  @override
  final double revenue;

  @override
  String toString() {
    return 'MonthlyStatisticsEntity(month: $month, expense: $expense, revenue: $revenue)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlyStatisticsEntityImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.expense, expense) || other.expense == expense) &&
            (identical(other.revenue, revenue) || other.revenue == revenue));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, month, expense, revenue);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlyStatisticsEntityImplCopyWith<_$MonthlyStatisticsEntityImpl>
      get copyWith => __$$MonthlyStatisticsEntityImplCopyWithImpl<
          _$MonthlyStatisticsEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlyStatisticsEntityImplToJson(
      this,
    );
  }
}

abstract class _MonthlyStatisticsEntity implements MonthlyStatisticsEntity {
  const factory _MonthlyStatisticsEntity(
      {required final int month,
      required final double expense,
      required final double revenue}) = _$MonthlyStatisticsEntityImpl;

  factory _MonthlyStatisticsEntity.fromJson(Map<String, dynamic> json) =
      _$MonthlyStatisticsEntityImpl.fromJson;

  @override
  int get month;
  @override
  double get expense;
  @override
  double get revenue;
  @override
  @JsonKey(ignore: true)
  _$$MonthlyStatisticsEntityImplCopyWith<_$MonthlyStatisticsEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}
