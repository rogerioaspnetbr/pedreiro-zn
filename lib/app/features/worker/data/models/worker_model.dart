import 'package:pedreiro_zn/app/features/worker/domain/entities/worker.dart';

class WorkerModel extends Worker {
  WorkerModel({
    required String id,
    required String name,
    required String specialty,
    required String phone,
    required double rating,
    required String imageUrl,
    required String neighborhood,
    required List<String> skills,
    required int completedJobs,
  }) : super(
          id: id,
          name: name,
          specialty: specialty,
          phone: phone,
          rating: rating,
          imageUrl: imageUrl,
          neighborhood: neighborhood,
          skills: skills,
          completedJobs: completedJobs,
        );

  factory WorkerModel.fromJson(Map<String, dynamic> json) {
    return WorkerModel(
      id: json['id'],
      name: json['name'],
      specialty: json['specialty'],
      phone: json['phone'],
      rating: json['rating'].toDouble(),
      imageUrl: json['imageUrl'],
      neighborhood: json['neighborhood'],
      skills: List<String>.from(json['skills']),
      completedJobs: json['completedJobs'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'specialty': specialty,
      'phone': phone,
      'rating': rating,
      'imageUrl': imageUrl,
      'neighborhood': neighborhood,
      'skills': skills,
      'completedJobs': completedJobs,
    };
  }
}