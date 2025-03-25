import 'package:get_it/get_it.dart';
import 'package:pedreiro_zn/app/features/worker/data/datasources/worker_remote_data_source.dart';
import 'package:pedreiro_zn/app/features/worker/data/repositories/worker_repository_impl.dart';
import 'package:pedreiro_zn/app/features/worker/domain/repositories/worker_repository.dart';
import 'package:pedreiro_zn/app/features/worker/domain/usecases/get_workers.dart';
import 'package:pedreiro_zn/app/features/worker/domain/usecases/search_workers.dart';
import 'package:pedreiro_zn/app/features/worker/presentation/controllers/worker_controller.dart';

final GetIt getIt = GetIt.instance;

void setupDependencies() {
  // Data sources
  getIt.registerLazySingleton<WorkerRemoteDataSource>(
    () => WorkerRemoteDataSourceImpl(),
  );

  // Repositories
  getIt.registerLazySingleton<WorkerRepository>(
    () => WorkerRepositoryImpl(remoteDataSource: getIt()),
  );

  // Use cases
  getIt.registerLazySingleton(() => GetWorkers(getIt()));
  getIt.registerLazySingleton(() => SearchWorkers(getIt()));

  // Controllers
  getIt.registerFactory(() => WorkerController(
        getWorkers: getIt(),
        searchWorkers: getIt(),
      ));
}