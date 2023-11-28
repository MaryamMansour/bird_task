import 'package:dartz/dartz.dart';

import '../../../../core/utils/failures/failures.dart';
import '../entities/login_entity.dart';
import '../repositories/login_domain_repo.dart';

class LoginUseCase{

  LoginDomainRepo loginDomainRepo;
  LoginUseCase(this.loginDomainRepo);
  Future<Either<Failures,LoginEntity>>call(String email, String password)=>loginDomainRepo.login(email,password);
}