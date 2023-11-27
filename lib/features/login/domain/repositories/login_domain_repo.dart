import 'package:dartz/dartz.dart';

import '../../../../core/utils/failures/failures.dart';
import '../entities/login_entity.dart';

abstract class LoginDomainRepo
{

  Future<Either<Failures,LoginEntity>> login(String email, String password);
}