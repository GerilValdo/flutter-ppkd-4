import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  factory UserModel({
    int? id,
    String? username,
    int? number,
    String? country,
    String? email,
    String? password,
  }) = _UserModel;

  factory UserModel.fromMap(Map<String, dynamic> map) => UserModel(
    id: map['id'] as int?,
    username: map['username'] as String?,
    email: map['email'] as String?,
    country: map['country'] as String?,
    number: map['number'] as int?,
    password: map['password'] as String?,
  );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  // Map<String, dynamic> toMap() => {
  //   'id': id,
  //   'username': username,
  //   'email': email,
  //   'password': password,
  // };
}
