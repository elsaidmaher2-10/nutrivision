import 'package:get_it/get_it.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../services/auth_service.dart';
import '../services/firestore_service.dart';
import '../services/storage_service.dart';
import '../services/user_session_service.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/data/repositories/auth_repository_impl.dart';
import '../../features/auth/presentation/cubit/login_cubit.dart';
import '../../features/auth/presentation/cubit/register_cubit.dart';
import '../../features/auth/presentation/cubit/forgot_password_cubit.dart';
import '../../features/home/presentation/cubit/home_cubit.dart';
import '../../features/nutrition/domain/repositories/nutrition_repository.dart';
import '../../features/nutrition/data/repositories/nutrition_repository_impl.dart';
import '../../features/profile/domain/repositories/profile_repository.dart';
import '../../features/profile/data/repositories/profile_repository_impl.dart';
import '../../features/profile/presentation/cubit/profile_cubit.dart';

final GetIt getIt = GetIt.instance;

Future<void> setupLocator() async {
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance);
  getIt.registerLazySingleton<FirebaseStorage>(() => FirebaseStorage.instance);

  getIt.registerLazySingleton<AuthService>(() => AuthService(getIt<FirebaseAuth>()));
  getIt.registerLazySingleton<FirestoreService>(() => FirestoreService(getIt<FirebaseFirestore>()));
  getIt.registerLazySingleton<StorageService>(() => StorageService(getIt<FirebaseStorage>()));
  getIt.registerLazySingleton<UserSessionService>(() => UserSessionService(getIt<FirebaseAuth>()));

  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(getIt<AuthService>()));
  getIt.registerLazySingleton<NutritionRepository>(() => NutritionRepositoryImpl(getIt<FirestoreService>()));
  getIt.registerLazySingleton<ProfileRepository>(() => ProfileRepositoryImpl(getIt<FirestoreService>()));

  getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt<AuthRepository>()));
  getIt.registerFactory<RegisterCubit>(() => RegisterCubit(getIt<AuthRepository>()));
  getIt.registerFactory<ForgotPasswordCubit>(() => ForgotPasswordCubit(getIt<AuthRepository>()));
  getIt.registerFactory<HomeCubit>(() => HomeCubit(getIt<NutritionRepository>(), getIt<UserSessionService>()));
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt<ProfileRepository>(), getIt<UserSessionService>()));
}
