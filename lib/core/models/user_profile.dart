import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  const UserProfile({
    required this.uid,
    required this.name,
    required this.email,
    this.age,
    this.weightKg,
    this.heightCm,
    this.dailyCalorieGoal = 2000,
    this.photoUrl,
  });

  final String uid;
  final String name;
  final String email;
  final int? age;
  final double? weightKg;
  final double? heightCm;
  final int dailyCalorieGoal;
  final String? photoUrl;

  factory UserProfile.fromMap(String uid, Map<String, dynamic> map) =>
      UserProfile(
        uid: uid,
        name: map['name'] as String? ?? '',
        email: map['email'] as String? ?? '',
        age: map['age'] as int?,
        weightKg: (map['weightKg'] as num?)?.toDouble(),
        heightCm: (map['heightCm'] as num?)?.toDouble(),
        dailyCalorieGoal: map['dailyCalorieGoal'] as int? ?? 2000,
        photoUrl: map['photoUrl'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'name': name,
        'email': email,
        'age': age,
        'weightKg': weightKg,
        'heightCm': heightCm,
        'dailyCalorieGoal': dailyCalorieGoal,
        'photoUrl': photoUrl,
      };

  @override
  List<Object?> get props =>
      [uid, name, email, age, weightKg, heightCm, dailyCalorieGoal, photoUrl];
}
