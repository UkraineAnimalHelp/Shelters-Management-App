class Employee {
  final String? id;
  final String? email;
  final String? name;

  Employee({required this.id, required this.email, required this.name});

  // Add toJson, fromJson if you need serialization
}
