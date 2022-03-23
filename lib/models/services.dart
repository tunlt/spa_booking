// To parse this JSON data, do
//
//     final servicesReponse = servicesReponseFromJson(jsonString);

import 'dart:convert';

ServicesReponse servicesReponseFromJson(String str) => ServicesReponse.fromJson(json.decode(str));

String servicesReponseToJson(ServicesReponse data) => json.encode(data.toJson());

class ServicesReponse {
    ServicesReponse({
        this.statusCode,
        this.message,
        this.data,
    });

    int? statusCode;
    String? message;
    List<Services>? data;

    factory ServicesReponse.fromJson(Map<String, dynamic> json) => ServicesReponse(
        statusCode: json["statusCode"],
        message: json["message"],
        data: List<Services>.from(json["data"].map((x) => Services.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Services {
    Services({
        this.id,
        this.urlImage,
        this.name,
        this.price,
        this.duration,
        this.createDay,
        this.status,
        this.spaId,
        this.bookingServiceId,
        this.serviceTypeId,
        this.description,
        this.serviceType,
        this.spa,
        this.bookingServices,
        this.staffServices,
    });

    int? id;
    String? urlImage;
    String? name;
    int? price;
    int? duration;
    DateTime? createDay;
    bool? status;
    int? spaId;
    int? bookingServiceId;
    int? serviceTypeId;
    String? description;
    dynamic serviceType;
    dynamic spa;
    List<dynamic>? bookingServices;
    List<dynamic>? staffServices;

    factory Services.fromJson(Map<String, dynamic> json) => Services(
        id: json["id"],
        urlImage: json["urlImage"],
        name: json["name"],
        price: json["price"],
        duration: json["duration"],
        createDay: DateTime.parse(json["createDay"]),
        status: json["status"],
        spaId: json["spaId"],
        bookingServiceId: json["bookingServiceId"],
        serviceTypeId: json["serviceTypeId"],
        description: json["description"],
        serviceType: json["serviceType"],
        spa: json["spa"],
        bookingServices: List<dynamic>.from(json["bookingServices"].map((x) => x)),
        staffServices: List<dynamic>.from(json["staffServices"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "urlImage": urlImage,
        "name": name,
        "price": price,
        "duration": duration,
        "createDay": createDay!.toIso8601String(),
        "status": status,
        "spaId": spaId,
        "bookingServiceId": bookingServiceId,
        "serviceTypeId": serviceTypeId,
        "description": description,
        "serviceType": serviceType,
        "spa": spa,
        "bookingServices": List<dynamic>.from(bookingServices!.map((x) => x)),
        "staffServices": List<dynamic>.from(staffServices!.map((x) => x)),
    };
}
