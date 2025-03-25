import 'package:pedreiro_zn/app/features/worker/data/datasources/worker_remote_data_source.dart';
import 'package:pedreiro_zn/app/features/worker/domain/entities/worker.dart';
import 'package:pedreiro_zn/app/features/worker/domain/repositories/worker_repository.dart';

class WorkerRepositoryImpl implements WorkerRepository {
  final WorkerRemoteDataSource remoteDataSource;

  WorkerRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<Worker>> getWorkers() async {
    return await remoteDataSource.getWorkers();
  }

  @override
  Future<List<Worker>> searchWorkers(String query) async {
    return await remoteDataSource.searchWorkers(query);
  }
}