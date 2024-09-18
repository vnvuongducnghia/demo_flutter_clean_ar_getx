import 'package:expo_app/common/network/dio_client.dart';
import 'package:expo_app/features/user/data/datasources/user_remote_data_source.dart';
import 'package:expo_app/features/user/data/repositories/user_repository_impl.dart';
import 'package:expo_app/features/user/domain/repositories/user_repository.dart';
import 'package:expo_app/features/user/domain/usecases/create_user_usecase.dart';
import 'package:expo_app/features/user/domain/usecases/delete_user_usecase.dart';
import 'package:expo_app/features/user/domain/usecases/get_users_usecase.dart';
import 'package:expo_app/features/user/domain/usecases/update_user_usecase.dart';
import 'package:expo_app/features/user/presentation/controller/user_controller.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  //UserController
  getIt.registerFactory(
    () => UserController(
      getUsersUseCase: getIt<GetUsersUseCase>(),
      createUserUseCase: getIt<CreateUserUseCase>(),
      updateUserUseCase: getIt<UpdateUserUseCase>(),
      deleteUserUseCase: getIt<DeleteUserUseCase>(),
    ),
  );

  // User Use cases
  getIt.registerLazySingleton(() => GetUsersUseCase(getIt<UserRepository>()));
  getIt.registerLazySingleton(() => CreateUserUseCase(getIt<UserRepository>()));
  getIt.registerLazySingleton(() => UpdateUserUseCase(getIt<UserRepository>()));
  getIt.registerLazySingleton(() => DeleteUserUseCase(getIt<UserRepository>()));


  // User repository
  getIt.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteDataSource: getIt()),
  );


  // User remote data sources
  getIt.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(dioClient: getIt<DioClient>()),
  );

  //Dio
  getIt.registerLazySingleton<DioClient>(() => DioClient(getIt<Dio>()));
  getIt.registerLazySingleton<Dio>(() => Dio());
}
