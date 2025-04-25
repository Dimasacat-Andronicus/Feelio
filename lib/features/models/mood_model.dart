import 'dart:convert';

class MoodModel {
  final int? id;
  final String mood;
  final String description;
  final String timestamp;

  MoodModel({
    this.id,
    required this.mood,
    required this.description,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'mood': mood,
      'description': description,
      'timestamp': timestamp,
    };
  }

  factory MoodModel.fromMap(Map<String, dynamic> map) {
    return MoodModel(
      id: map['id'] != null ? map['id'] as int : null,
      mood: map['mood'] as String,
      description: map['description'] as String,
      timestamp: map['timestamp'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory MoodModel.fromJson(String source) =>
      MoodModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
