import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable{
  LoginEntity({
    required this.accessToken,
    required this.tokenType,});

  String accessToken;
  String tokenType;

  @override
  List<Object?> get props => [accessToken,tokenType];



}


