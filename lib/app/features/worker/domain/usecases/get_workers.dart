import 'package:pedreiro_zn/app/features/worker/domain/entities/worker.dart';
import 'package:pedreiro_zn/app/features/worker/domain/repositories/worker_repository.dart';

class GetWorkers {
  final WorkerRepository repository;

  GetWorkers(this.repository);

  Future<List<Worker>> call() async {
    return await repository.getWorkers();
  }
}