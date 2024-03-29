

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/api/end_points.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/failures/failures.dart';
import '../models/login_model.dart';

abstract class LoginDataSources {
  Future<Either<Failures, LoginModel>> login(String email, String password);
}

class RemoteDto implements LoginDataSources {
  Dio dio = Dio();

  @override
  Future<Either<Failures, LoginModel>> login(
      String email, String password) async {
    try {
      var response =
      await dio.post("${Constants.baseApiUrl}${EndPoints.login}", data: {
        "email": email,
        "password": password,
      });
      LoginModel loginModel = LoginModel.fromJson(response.data);
      return Right(loginModel);
    } catch (e) {
      return Left(Failures(e.toString()));
    }
  }
}