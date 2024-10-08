import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:expo_app/common/usecase/usecase.dart';
import 'package:expo_app/features/user/data/models/user.dart';
import 'package:expo_app/features/user/domain/entities/user_entity.dart';
import 'package:expo_app/features/user/domain/repositories/user_repository.dart';

@immutable
class GetUsersUseCase implements UseCase<List<User>, GetUsersParams> {
  final UserRepository userRepository;

  const GetUsersUseCase(this.userRepository);

  @override
  Future<Either<String, List<User>>> call(GetUsersParams params) async {
    return await userRepository.getUsers(
        status: params.status, gender: params.gender);
  }
}

@immutable
class GetUsersParams {
  final Gender? gender;
  final UserStatus? status;

  const GetUsersParams({this.gender, this.status});
}
