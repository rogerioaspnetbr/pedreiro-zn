import 'package:pedreiro_zn/app/features/worker/data/models/worker_model.dart';

abstract class WorkerRemoteDataSource {
  Future<List<WorkerModel>> getWorkers();
  Future<List<WorkerModel>> searchWorkers(String query);
}

class WorkerRemoteDataSourceImpl implements WorkerRemoteDataSource {
  @override
  Future<List<WorkerModel>> getWorkers() async {
    // In a real app, this would be an API call
    // For now, we'll return mock data
    await Future.delayed(const Duration(seconds: 1));
    return _getMockWorkers();
  }

  @override
  Future<List<WorkerModel>> searchWorkers(String query) async {
    // In a real app, this would be an API call with the query
    // For now, we'll filter our mock data
    await Future.delayed(const Duration(seconds: 1));
    final workers = _getMockWorkers();
    
    if (query.isEmpty) return workers;
    
    return workers.where((worker) {
      return worker.name.toLowerCase().contains(query.toLowerCase()) ||
          worker.specialty.toLowerCase().contains(query.toLowerCase()) ||
          worker.neighborhood.toLowerCase().contains(query.toLowerCase()) ||
          worker.skills.any((skill) => skill.toLowerCase().contains(query.toLowerCase()));
    }).toList();
  }

  List<WorkerModel> _getMockWorkers() {
    return [
      WorkerModel(
        id: '1',
        name: 'Antonio da Zona norte SP',
        specialty: 'Serviços Completos de Construção',
        phone: '(11) 98549-5481',
        rating: 4.9,
        imageUrl: 'https://randomuser.me/api/portraits/men/1.jpg',
        neighborhood: 'Jaçanã',
        skills: ['Construção', 'Reforma', 'Pintura', 'Elétrica', 'Hidráulica', 'Acabamento Premium'],
        completedJobs: 78,
      ),
      WorkerModel(
        id: '2',
        name: 'Milton de Guarulhos - SP',
        specialty: 'Serviços Completos de Construção',
        phone: '(11) 98549-5481',
        rating: 4.9,
        imageUrl: 'https://randomuser.me/api/portraits/men/2.jpg',
        neighborhood: 'Jaçanã',
        skills: ['Construção', 'Reforma', 'Pintura', 'Elétrica', 'Hidráulica', 'Acabamento Premium'],
        completedJobs: 78,
      ),
    ];
  }
}