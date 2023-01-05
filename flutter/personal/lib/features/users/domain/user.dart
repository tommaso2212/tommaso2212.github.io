import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class User with _$User{

  const factory User({
    required UserRole role,
    required String? name,
    required String? imageUrl,
  }) = _User;

  factory User.fromJson(Map<String, Object?> json)=> _$UserFromJson(json);
}

enum UserRole{
  admin, public
}