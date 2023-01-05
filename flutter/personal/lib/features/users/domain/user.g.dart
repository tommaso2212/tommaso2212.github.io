// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_User _$$_UserFromJson(Map<String, dynamic> json) => _$_User(
      role: $enumDecode(_$UserRoleEnumMap, json['role']),
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$$_UserToJson(_$_User instance) => <String, dynamic>{
      'role': _$UserRoleEnumMap[instance.role]!,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
    };

const _$UserRoleEnumMap = {
  UserRole.admin: 'admin',
  UserRole.public: 'public',
};
