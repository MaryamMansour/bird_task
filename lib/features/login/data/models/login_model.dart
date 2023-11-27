import 'package:bird_task/features/login/domain/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  LoginModel({
      required super.accessToken,
      required super.tokenType,});

  LoginModel.fromJson(dynamic json):this (
    accessToken : json['access_token'],
    tokenType : json['token_type']
  );

}