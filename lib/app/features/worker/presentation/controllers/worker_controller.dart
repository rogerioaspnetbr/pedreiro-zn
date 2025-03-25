import 'package:flutter/material.dart';
import 'package:pedreiro_zn/app/features/worker/domain/entities/worker.dart';
import 'package:pedreiro_zn/app/features/worker/domain/usecases/get_workers.dart';
import 'package:pedreiro_zn/app/features/worker/domain/usecases/search_workers.dart';

class WorkerController extends ChangeNotifier {
  final GetWorkers getWorkers;
  final SearchWorkers searchWorkers;

  WorkerController({
    required this.getWorkers,
    required this.searchWorkers,
  });

  List<Worker> _workers = [];
  List<Worker> get workers => _workers;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String _errorMessage = '';
  String get errorMessage => _errorMessage;

  Future<void> loadWorkers() async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _workers = await getWorkers();
    } catch (e) {
      _errorMessage = 'Erro ao carregar trabalhadores: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> search(String query) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    try {
      _workers = await searchWorkers(query);
    } catch (e) {
      _errorMessage = 'Erro ao buscar trabalhadores: ${e.toString()}';
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}