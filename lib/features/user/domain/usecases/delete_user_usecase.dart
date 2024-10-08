import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:expo_app/common/usecase/usecase.dart';
import 'package:expo_app/features/user/data/models/user.dart';
import 'package:expo_app/features/user/domain/repositories/user_repository.dart';

@immutable
class DeleteUserUseCase implements UseCase<bool, DeleteUserParams> {
  final UserRepository userRepository;

  const DeleteUserUseCase(this.userRepository);

  @override
  Future<Either<String, bool>> call(DeleteUserParams params) async {
    return await userRepository.deleteUser(params.user);
  }
}

@immutable
class DeleteUserParams {
  final User user;

  const DeleteUserParams(this.user);
}
