import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.imageUrl,
    required this.companyName,
  });

  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String imageUrl;
  final String companyName;

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
    id: json['id'] ?? "",
    firstName: json['firstName'] ?? "",
    lastName: json['lastName'] ?? "",
    email: json['email'] ?? "",
    imageUrl: json['imageUrl'] ?? "",
    companyName: json['companyName'] ?? "",
  );

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'firstName': firstName,
    'lastName': lastName,
    'email': email,
    'imageUrl': imageUrl,
    'companyName': companyName,
  };

  factory UserEntity.empty() => const UserEntity(
    id: "",
    firstName: "",
    lastName: "",
    email: "",
    imageUrl: "",
    companyName: "",
  );

  @override
  List<Object?> get props => [id, firstName, lastName, email, imageUrl, companyName];
}
