import 'package:flutter/material.dart';
import 'package:pedreiro_zn/app/core/di/dependency_injection.dart';
import 'package:pedreiro_zn/app/features/worker/domain/entities/worker.dart';
import 'package:pedreiro_zn/app/features/worker/presentation/controllers/worker_controller.dart';
import 'package:pedreiro_zn/app/features/worker/presentation/pages/worker_details_page.dart';
import 'package:pedreiro_zn/app/features/worker/presentation/widgets/worker_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final WorkerController _controller = getIt<WorkerController>();
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_rebuild);
    _loadData();
  }

  @override
  void dispose() {
    _controller.removeListener(_rebuild);
    _searchController.dispose();
    super.dispose();
  }

  void _rebuild() {
    if (mounted) setState(() {});
  }

  Future<void> _loadData() async {
    await _controller.loadWorkers();
  }

  void _onSearch(String query) {
    _controller.search(query);
  }

  void _onWorkerTap(Worker worker) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WorkerDetailsPage(worker: worker),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pedreiros São Paulo - Serviços completos de construção'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Buscar pedreiros...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                contentPadding: const EdgeInsets.symmetric(vertical: 12),
              ),
              onChanged: _onSearch,
            ),
          ),
          Expanded(
            child: _buildContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildContent() {
    if (_controller.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_controller.errorMessage.isNotEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _controller.errorMessage,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _loadData,
              child: const Text('Tentar novamente'),
            ),
          ],
        ),
      );
    }

    if (_controller.workers.isEmpty) {
      return const Center(
        child: Text(
          'Nenhum pedreiro encontrado',
          style: TextStyle(fontSize: 16),
        ),
      );
    }

    return RefreshIndicator(
      onRefresh: _loadData,
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: _controller.workers.length,
        itemBuilder: (context, index) {
          final worker = _controller.workers[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: WorkerCard(
              worker: worker,
              onTap: () => _onWorkerTap(worker),
            ),
          );
        },
      ),
    );
  }
}