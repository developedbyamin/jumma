import 'dart:convert';

MosqueModel mosqueModelFromJson(String str) =>
    MosqueModel.fromJson(json.decode(str));

String mosqueModelToJson(MosqueModel data) => json.encode(data.toJson());

class MosqueModel {
  final List<MosqueModel> mosques;

  MosqueModel({
    required this.mosques,
  });

  factory MosqueModel.fromJson(Map<String, dynamic> json) => MosqueModel(
        mosques:
            List<MosqueModel>.from(json["mosques"].map((x) => Mosque.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "mosques": List<dynamic>.from(mosques.map((x) => x.toJson())),
      };
}

class Mosque {
  final int id;
  final String name;
  final String address;
  final String city;
  final String googleMapLink;

  Mosque({
    required this.id,
    required this.name,
    required this.address,
    required this.city,
    required this.googleMapLink,
  });

  factory Mosque.fromJson(Map<String, dynamic> json) => Mosque(
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
