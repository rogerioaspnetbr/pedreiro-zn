class Worker {
  final String id;
  final String name;
  final String specialty;
  final String phone;
  final double rating;
  final String imageUrl;
  final String neighborhood;
  final List<String> skills;
  final int completedJobs;

  Worker({
    required this.id,
    required this.name,
    required this.specialty,
    required this.phone,
    required this.rating,
    required this.imageUrl,
    required this.neighborhood,
    required this.skills,
    required this.completedJobs,
  });
}