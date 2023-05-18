class AppIdea {
  final String name, description;
  final List<String> features;

  const AppIdea({
    required this.name,
    required this.description,
    required this.features,
  });

  factory AppIdea.fromData(Map<String, dynamic> data) {
    return AppIdea(
      name: (data['title'] ?? data['name']) ?? 'Unknown',
      description: (data['desc'] ?? data['description']) ?? 'Unknown',
      features: data['features'].map<String>((f) => f.toString()).toList(growable: false) ?? [],
    );
  }
}
