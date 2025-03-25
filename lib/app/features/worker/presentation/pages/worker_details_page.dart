import 'package:flutter/material.dart';
import 'package:pedreiro_zn/app/features/worker/domain/entities/worker.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkerDetailsPage extends StatelessWidget {
  final Worker worker;

  const WorkerDetailsPage({
    Key? key,
    required this.worker,
  }) : super(key: key);

  Future<void> _callWorker() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: worker.phone);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      throw 'Não foi possível ligar para ${worker.phone}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(worker.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              height: 250,
              child: Image.network(
                worker.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              worker.name,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 4),
                            Text(
                              worker.specialty,
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton.icon(
                        onPressed: _callWorker,
                        icon: const Icon(Icons.phone),
                        label: const Text('Ligar'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildInfoCard(
                    title: 'Informações',
                    child: Column(
                      children: [
                        _buildInfoRow(
                          icon: Icons.location_on,
                          title: 'Bairro',
                          value: worker.neighborhood,
                        ),
                        const Divider(),
                        _buildInfoRow(
                          icon: Icons.star,
                          title: 'Avaliação',
                          value: '${worker.rating} (${worker.completedJobs} trabalhos)',
                        ),
                        const Divider(),
                        _buildInfoRow(
                          icon: Icons.phone,
                          title: 'Telefone',
                          value: worker.phone,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  _buildInfoCard(
                    title: 'Habilidades',
                    child: Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: worker.skills.map((skill) {
                        return Chip(
                          label: Text(skill),
                          backgroundColor: Colors.blue.withOpacity(0.1),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCard({required String title, required Widget child}) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.blue,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            '$title:',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}