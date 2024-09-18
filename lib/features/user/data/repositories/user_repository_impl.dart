import 'package:expo_app/common/repository/repository_helper.dart';
import 'package:expo_app/features/user/data/datasources/user_remote_data_source.dart';
import 'package:expo_app/features/user/data/models/user.dart';
import 'package:expo_app/features/user/domain/entities/user_entity.dart';
import 'package:expo_app/features/user/domain/repositories/user_repository.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl extends UserRepository with RepositoryHelper<User> {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<String, List<User>>> getUsers({Gender? gender, UserStatus? status}) async {
    return checkItemsFailOrSuccess(remoteDataSource.getUsers(gender: gender, status: status));
  }

  @override
  Future<Either<String, bool>> createUser(User user) async {
    return checkItemFailOrSuccess(remoteDataSource.createUser(user));
  }

  @override
  Future<Either<String, bool>> updateUser(User user) async {
    return checkItemFailOrSuccess(remoteDataSource.updateUser(user));
  }

  @override
  Future<Either<String, bool>> deleteUser(User user) async {
    return checkItemFailOrSuccess(remoteDataSource.deleteUser(user));
  }
}
