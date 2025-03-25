import 'package:pedreiro_zn/app/features/worker/domain/entities/worker.dart';
import 'package:pedreiro_zn/app/features/worker/domain/repositories/worker_repository.dart';

class SearchWorkers {
  final WorkerRepository repository;

  SearchWorkers(this.repository);

  Future<List<Worker>> call(String query) async {
    return await repository.searchWorkers(query);
  }
}