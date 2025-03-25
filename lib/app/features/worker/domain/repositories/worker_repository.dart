import 'package:pedreiro_zn/app/features/worker/domain/entities/worker.dart';

abstract class WorkerRepository {
  Future<List<Worker>> getWorkers();
  Future<List<Worker>> searchWorkers(String query);
}