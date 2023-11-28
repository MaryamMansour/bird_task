import 'package:dartz/dartz.dart';

import '../../../../core/utils/failures/failures.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/repositories/login_domain_repo.dart';
import '../data_sources/dto.dart';

class LoginDataRepo implements LoginDomainRepo{

  LoginDataSources loginDataSources;
  LoginDataRepo(this.loginDataSources);
  @override
  Future<Either<Failures, LoginEntity>>
  login(String email, String password) =>loginDataSources.login(email, password);

}