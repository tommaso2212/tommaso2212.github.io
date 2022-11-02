import 'package:json_annotation/json_annotation.dart';
part 'user_data.g.dart';

@JsonSerializable(explicitToJson: true)
class UserData {
  final int role;

  UserData({required this.role});

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);

  Map<String, dynamic> toJson()=> _$UserDataToJson(this);
}

