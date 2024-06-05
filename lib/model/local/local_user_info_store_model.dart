import 'package:equatable/equatable.dart';

class LocalUserInfoStoreModel extends Equatable {
  const LocalUserInfoStoreModel({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
    required this.token,
  });

  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;
  final String token;

  LocalUserInfoStoreModel copyWith({
    int? id,
    String? username,
    String? email,
    String? firstName,
    String? lastName,
    String? gender,
    String? image,
    String? token,
  }) {
    return LocalUserInfoStoreModel(
      id: id ?? this.id,
      username: username ?? this.username,
      email: email ?? this.email,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      gender: gender ?? this.gender,
      image: image ?? this.image,
      token: token ?? this.token,
    );
  }

  factory LocalUserInfoStoreModel.fromJson(Map<String, dynamic> json) =>
      LocalUserInfoStoreModel(
        id: json["id"] ?? 0,
        username: json["username"] ?? "",
        email: json["email"] ?? "",
        firstName: json["firstName"] ?? "",
        lastName: json["lastName"] ?? "",
        gender: json["gender"] ?? "",
        image: json["image"] ?? "",
        token: json["token"] ?? "",
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "firstName": firstName,
        "lastName": lastName,
        "gender": gender,
        "image": image,
        "token": token,
      };
  factory LocalUserInfoStoreModel.empty() => const LocalUserInfoStoreModel(
      id: 0,
      username: '',
      email: '',
      firstName: '',
      lastName: '',
      gender: '',
      image: '',
      token: '');

  @override
  List<Object?> get props => [
        id,
        username,
        email,
        firstName,
        lastName,
        gender,
        image,
        token,
      ];
}
