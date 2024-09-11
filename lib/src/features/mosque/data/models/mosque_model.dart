import '../../domain/entities/mosque_entity.dart';

class MosqueModel {
  final int id;
  final String name;
  final String address;
  final String city;
  final String googleMapLink;

  MosqueModel({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.googleMapLink,
  });

  factory MosqueModel.fromJson(Map<String, dynamic> json) => MosqueModel(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        city: json["city"],
        googleMapLink: json["googleMapLink"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "city": city,
        "googleMapLink": googleMapLink,
      };
}

extension MosqueModelToEntity on MosqueModel {
  MosqueEntity toEntity() {
    return MosqueEntity(
      id: id,
      name: name,
      address: address,
      googleMapLink: googleMapLink,
    );
  }
}

