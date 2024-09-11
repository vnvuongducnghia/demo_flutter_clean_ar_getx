import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:demo_flutter/common/usecase/usecase.dart';
import 'package:demo_flutter/features/user/data/models/user.dart';
import 'package:demo_flutter/features/user/domain/repositories/user_repository.dart';

@immutable
class CreateUserUseCase implements UseCase<bool, CreateUserParams> {
  final UserRepository userRepository;

  const CreateUserUseCase(this.userRepository);

  @override
  Future<Either<String, bool>> call(CreateUserParams params) async {
    return await userRepository.createUser(params.user);
  }
}

@immutable
class CreateUserParams {
  final User user;

  const CreateUserParams(this.user);
}
