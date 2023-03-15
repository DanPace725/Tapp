import 'package:supabase_flutter/supabase_flutter.dart';

class Task {
  final int id;
  final String description;
  final String breakdown;
  final int duration;
  final DateTime scheduledAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  final List<String> tags;
  final int priorityLevel;
  final bool recurringTasks;
  final int timeTracking;

  Task({
    required this.id,
    required this.description,
    required this.breakdown,
    required this.duration,
    required this.scheduledAt,
    required this.createdAt,
    required this.updatedAt,
    required this.tags,
    required this.priorityLevel,
    required this.recurringTasks,
    required this.timeTracking,
  });

  static Task fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'] as int,
      description: map['description'] as String,
      breakdown: map['breakdown'] as String,
      duration: map['duration'] as int,
      scheduledAt: DateTime.parse(map['scheduled_at'] as String),
      createdAt: DateTime.parse(map['created_at'] as String),
      updatedAt: DateTime.parse(map['updated_at'] as String),
      tags: List<String>.from(map['tags'] as List<dynamic>),
      priorityLevel: map['priority_level'] as int,
      recurringTasks: map['recurring_tasks'] as bool,
      timeTracking: map['time_tracking'] as int,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'description': description,
      'breakdown': breakdown,
      'duration': duration,
      'scheduled_at': scheduledAt.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'tags': tags,
      'priority_level': priorityLevel,
      'recurring_tasks': recurringTasks,
      'time_tracking': timeTracking,
    };
  }
}
