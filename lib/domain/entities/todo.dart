
class Todo {
  final String id;
  final String description;
  final DateTime? completeAt;

  Todo({
    required this.id,
    required this.description,
    required this.completeAt,
  });

  bool get done {
    return completeAt != null;
  }

  Todo copyWith({
    String? id,
    String? description,
    DateTime? completeAt,
  }) => Todo(
    id: id ?? this.id, 
    description: description ?? this.description, 
    completeAt: completeAt,
  );
}