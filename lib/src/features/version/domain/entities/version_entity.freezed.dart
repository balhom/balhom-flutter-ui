// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'version_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

VersionEntity _$VersionEntityFromJson(Map<String, dynamic> json) {
  return _VersionEntity.fromJson(json);
}

/// @nodoc
mixin _$VersionEntity {
// ignore: invalid_annotation_target
  @JsonKey(includeIfNull: false)
  String get appVersion =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(includeIfNull: false)
  String get webVersion =>
      throw _privateConstructorUsedError; // ignore: invalid_annotation_target
  @JsonKey(includeIfNull: false)
  String get apiVersion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $VersionEntityCopyWith<VersionEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VersionEntityCopyWith<$Res> {
  factory $VersionEntityCopyWith(
          VersionEntity value, $Res Function(VersionEntity) then) =
      _$VersionEntityCopyWithImpl<$Res, VersionEntity>;
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String appVersion,
      @JsonKey(includeIfNull: false) String webVersion,
      @JsonKey(includeIfNull: false) String apiVersion});
}

/// @nodoc
class _$VersionEntityCopyWithImpl<$Res, $Val extends VersionEntity>
    implements $VersionEntityCopyWith<$Res> {
  _$VersionEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appVersion = null,
    Object? webVersion = null,
    Object? apiVersion = null,
  }) {
    return _then(_value.copyWith(
      appVersion: null == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
      webVersion: null == webVersion
          ? _value.webVersion
          : webVersion // ignore: cast_nullable_to_non_nullable
              as String,
      apiVersion: null == apiVersion
          ? _value.apiVersion
          : apiVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$VersionEntityImplCopyWith<$Res>
    implements $VersionEntityCopyWith<$Res> {
  factory _$$VersionEntityImplCopyWith(
          _$VersionEntityImpl value, $Res Function(_$VersionEntityImpl) then) =
      __$$VersionEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(includeIfNull: false) String appVersion,
      @JsonKey(includeIfNull: false) String webVersion,
      @JsonKey(includeIfNull: false) String apiVersion});
}

/// @nodoc
class __$$VersionEntityImplCopyWithImpl<$Res>
    extends _$VersionEntityCopyWithImpl<$Res, _$VersionEntityImpl>
    implements _$$VersionEntityImplCopyWith<$Res> {
  __$$VersionEntityImplCopyWithImpl(
      _$VersionEntityImpl _value, $Res Function(_$VersionEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? appVersion = null,
    Object? webVersion = null,
    Object? apiVersion = null,
  }) {
    return _then(_$VersionEntityImpl(
      appVersion: null == appVersion
          ? _value.appVersion
          : appVersion // ignore: cast_nullable_to_non_nullable
              as String,
      webVersion: null == webVersion
          ? _value.webVersion
          : webVersion // ignore: cast_nullable_to_non_nullable
              as String,
      apiVersion: null == apiVersion
          ? _value.apiVersion
          : apiVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$VersionEntityImpl implements _VersionEntity {
  const _$VersionEntityImpl(
      {@JsonKey(includeIfNull: false) required this.appVersion,
      @JsonKey(includeIfNull: false) required this.webVersion,
      @JsonKey(includeIfNull: false) required this.apiVersion});

  factory _$VersionEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$VersionEntityImplFromJson(json);

// ignore: invalid_annotation_target
  @override
  @JsonKey(includeIfNull: false)
  final String appVersion;
// ignore: invalid_annotation_target
  @override
  @JsonKey(includeIfNull: false)
  final String webVersion;
// ignore: invalid_annotation_target
  @override
  @JsonKey(includeIfNull: false)
  final String apiVersion;

  @override
  String toString() {
    return 'VersionEntity(appVersion: $appVersion, webVersion: $webVersion, apiVersion: $apiVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$VersionEntityImpl &&
            (identical(other.appVersion, appVersion) ||
                other.appVersion == appVersion) &&
            (identical(other.webVersion, webVersion) ||
                other.webVersion == webVersion) &&
            (identical(other.apiVersion, apiVersion) ||
                other.apiVersion == apiVersion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, appVersion, webVersion, apiVersion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$VersionEntityImplCopyWith<_$VersionEntityImpl> get copyWith =>
      __$$VersionEntityImplCopyWithImpl<_$VersionEntityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$VersionEntityImplToJson(
      this,
    );
  }
}

abstract class _VersionEntity implements VersionEntity {
  const factory _VersionEntity(
          {@JsonKey(includeIfNull: false) required final String appVersion,
          @JsonKey(includeIfNull: false) required final String webVersion,
          @JsonKey(includeIfNull: false) required final String apiVersion}) =
      _$VersionEntityImpl;

  factory _VersionEntity.fromJson(Map<String, dynamic> json) =
      _$VersionEntityImpl.fromJson;

  @override // ignore: invalid_annotation_target
  @JsonKey(includeIfNull: false)
  String get appVersion;
  @override // ignore: invalid_annotation_target
  @JsonKey(includeIfNull: false)
  String get webVersion;
  @override // ignore: invalid_annotation_target
  @JsonKey(includeIfNull: false)
  String get apiVersion;
  @override
  @JsonKey(ignore: true)
  _$$VersionEntityImplCopyWith<_$VersionEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
