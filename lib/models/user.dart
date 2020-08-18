part of 'models.dart';

class User extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phoneNumber;
  final String address;
  final String houseNumber;
  final String city;
  final String photo;
  final File newPhoto;

  User({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.address,
    this.houseNumber,
    this.city,
    this.photo,
    this.newPhoto,
  });

  @override
  List<Object> get props => [
    id,
    name,
    email,
    phoneNumber,
    address,
    houseNumber,
    city,
    photo,
    newPhoto,
  ];

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    address: json["address"],
    houseNumber: json["house_number"],
    city: json["city"],
    photo: json["photo"],
  );
}
