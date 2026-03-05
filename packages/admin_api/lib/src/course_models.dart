class CourseSummary {
  const CourseSummary({
    required this.id,
    required this.title,
    required this.slug,
    this.description,
    required this.phase,
    required this.targetTrack,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory CourseSummary.fromJson(Map<String, dynamic> json) {
    return CourseSummary(
      id: (json['id'] ?? '').toString(),
      title: (json['title'] ?? '').toString(),
      slug: (json['slug'] ?? '').toString(),
      description: json['description'] as String?,
      phase: (json['phase'] ?? '').toString(),
      targetTrack: (json['targetTrack'] ?? '').toString(),
      status: (json['status'] ?? '').toString(),
      createdAt: DateTime.parse((json['createdAt'] ?? '').toString()),
      updatedAt: DateTime.parse((json['updatedAt'] ?? '').toString()),
    );
  }

  final String id;
  final String title;
  final String slug;
  final String? description;
  final String phase;
  final String targetTrack;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
}

class CreateCourseRequest {
  const CreateCourseRequest({
    required this.title,
    required this.slug,
    this.description,
    required this.phase,
    required this.targetTrack,
  });

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'slug': slug,
      if (description != null) 'description': description,
      'phase': phase,
      'targetTrack': targetTrack,
    };
  }

  final String title;
  final String slug;
  final String? description;
  final String phase;
  final String targetTrack;
}
