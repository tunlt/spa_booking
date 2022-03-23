// To parse this JSON data, do
//
//     final spaReponse = spaReponseFromJson(jsonString);

import 'dart:convert';

SpaReponse spaReponseFromJson(String str) => SpaReponse.fromJson(json.decode(str));

String spaReponseToJson(SpaReponse data) => json.encode(data.toJson());

class SpaReponse {
    SpaReponse({
        this.statusCode,
        this.message,
        this.data,
    });

    int? statusCode;
    String? message;
    List<Spa>? data;

    factory SpaReponse.fromJson(Map<String, dynamic> json) => SpaReponse(
        statusCode: json["statusCode"],
        message: json["message"],
        data: List<Spa>.from(json["data"].map((x) => Spa.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class Spa {
    Spa({
        this.id,
        this.urlImage,
        this.spaName,
        this.fullName,
        this.userName,
        this.address,
        this.createDay,
        this.dob,
        this.email,
        this.status,
        this.phone,
        this.services,
        this.staff,
    });

    int? id;
    String? urlImage;
    String? spaName;
    String? fullName;
    String? userName;
    String? address;
    DateTime? createDay;
    DateTime? dob;
    String? email;
    bool? status;
    int? phone;
    List<Service>? services;
    List<Staff>? staff;

    factory Spa.fromJson(Map<String, dynamic> json) => Spa(
        id: json["id"],
        urlImage: json["urlImage"],
        spaName: json["spaName"],
        fullName: json["fullName"],
        userName: json["userName"],
        address: json["address"],
        createDay: DateTime.parse(json["createDay"]),
        dob: DateTime.parse(json["dob"]),
        email: json["email"],
        status: json["status"],
        phone: json["phone"],
        services: List<Service>.from(json["services"].map((x) => Service.fromJson(x))),
        staff: List<Staff>.from(json["staff"].map((x) => Staff.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "urlImage": urlImage,
        "spaName": spaName,
        "fullName": fullName,
        "userName": userName,
        "address": address,
        "createDay": createDay!.toIso8601String(),
        "dob": dob!.toIso8601String(),
        "email": email,
        "status": status,
        "phone": phone,
        "services": List<dynamic>.from(services!.map((x) => x.toJson())),
        "staff": List<dynamic>.from(staff!.map((x) => x.toJson())),
    };
}

class Service {
    Service({
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

    factory Service.fromJson(Map<String, dynamic> json) => Service(
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

class Staff {
    Staff({
        this.id,
        this.fullName,
        this.dob,
        this.phone,
        this.address,
        this.createDay,
        this.status,
        this.spaId,
        this.bookingId,
        this.spa,
        this.bookingServices,
        this.staffServices,
    });

    int? id;
    String? fullName;
    DateTime? dob;
    int? phone;
    String? address;
    DateTime? createDay;
    bool? status;
    int? spaId;
    dynamic bookingId;
    dynamic spa;
    List<dynamic>? bookingServices;
    List<dynamic>? staffServices;

    factory Staff.fromJson(Map<String, dynamic> json) => Staff(
        id: json["id"],
        fullName: json["fullName"],
        dob: DateTime.parse(json["dob"]),
        phone: json["phone"],
        address: json["address"],
        createDay: DateTime.parse(json["createDay"]),
        status: json["status"],
        spaId: json["spaId"],
        bookingId: json["bookingId"],
        spa: json["spa"],
        bookingServices: List<dynamic>.from(json["bookingServices"].map((x) => x)),
        staffServices: List<dynamic>.from(json["staffServices"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "fullName": fullName,
        "dob": "${dob!.year.toString().padLeft(4, '0')}-${dob!.month.toString().padLeft(2, '0')}-${dob!.day.toString().padLeft(2, '0')}",
        "phone": phone,
        "address": address,
        "createDay": createDay!.toIso8601String(),
        "status": status,
        "spaId": spaId,
        "bookingId": bookingId,
        "spa": spa,
        "bookingServices": List<dynamic>.from(bookingServices!.map((x) => x)),
        "staffServices": List<dynamic>.from(staffServices!.map((x) => x)),
    };
}
