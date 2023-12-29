import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_entity.freezed.dart';
part 'register_entity.g.dart';

/// [RegisterEntity] model
@freezed
class RegisterEntity with _$RegisterEntity {
  /// Factory constructor
  /// [username] - [String] username
  /// [email] - [String] email
  /// [locale] - [String] locale
  /// [prefCurrencyType] - [String] preferred currency type
  /// [password] - [String] password
  /// [repeatPassword] - [String] repeat password
  // ignore: invalid_annotation_target
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory RegisterEntity({
    required String username,
    required String email,
    required String locale,
    required String prefCurrencyType,
    required String password,
    required String repeatPassword,
  }) = _RegisterEntity;

  // Serialization
  factory RegisterEntity.fromJson(Map<String, dynamic> json) =>
      _$RegisterEntityFromJson(json);
}
