import 'package:equatable/equatable.dart';

enum MealType { breakfast, lunch, dinner, snack }

class MealEntry extends Equatable {
  const MealEntry({
    required this.id,
    required this.userId,
    required this.name,
    required this.calories,
    required this.mealType,
    required this.loggedAt,
    this.proteinG = 0,
    this.carbsG = 0,
    this.fatG = 0,
    this.imageUrl,
  });

  final String id, userId, name;
  final int calories;
  final MealType mealType;
  final DateTime loggedAt;
  final double proteinG, carbsG, fatG;
  final String? imageUrl;

  factory MealEntry.fromMap(String id, Map<String, dynamic> map) => MealEntry(
        id: id,
        userId: map['userId'] as String,
        name: map['name'] as String,
        calories: map['calories'] as int,
        mealType: MealType.values.firstWhere(
          (e) => e.name == map['mealType'],
          orElse: () => MealType.snack,
        ),
        loggedAt: DateTime.parse(map['loggedAt'] as String),
        proteinG: (map['proteinG'] as num?)?.toDouble() ?? 0,
        carbsG: (map['carbsG'] as num?)?.toDouble() ?? 0,
        fatG: (map['fatG'] as num?)?.toDouble() ?? 0,
        imageUrl: map['imageUrl'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'userId': userId,
        'name': name,
        'calories': calories,
        'mealType': mealType.name,
        'loggedAt': loggedAt.toIso8601String(),
        'proteinG': proteinG,
        'carbsG': carbsG,
        'fatG': fatG,
        'imageUrl': imageUrl,
      };

  @override
  List<Object?> get props => [id, userId, name, calories, mealType, loggedAt];
}
