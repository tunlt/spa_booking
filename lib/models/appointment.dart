// To parse this JSON data, do
//
//     final bookingServices = bookingServicesFromJson(jsonString);

import 'dart:convert';

BookingServices bookingServicesFromJson(String str) => BookingServices.fromJson(json.decode(str));

String bookingServicesToJson(BookingServices data) => json.encode(data.toJson());

class BookingServices {
    BookingServices({
        this.statusCode,
        this.message,
        this.data,
    });

    int? statusCode;
    String? message;
    List<BookingService>? data;

    factory BookingServices.fromJson(Map<String, dynamic> json) => BookingServices(
        statusCode: json["statusCode"],
        message: json["message"],
        data: List<BookingService>.from(json["data"].map((x) => BookingService.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "statusCode": statusCode,
        "message": message,
        "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    };
}

class BookingService {
    BookingService({
        this.bookingServiceId,
        this.status,
        this.price,
        this.serviceName,
        this.spaName,
        this.timeStart,
        this.timeEnd,
        this.urlImage,
    });

    int? bookingServiceId;
    bool? status;
    int? price;
    String? serviceName;
    String? spaName;
    String? timeStart;
    String? timeEnd;
    String? urlImage;

    factory BookingService.fromJson(Map<String, dynamic> json) => BookingService(
        bookingServiceId: json["bookingServiceId"],
        status: json["status"],
        price: json["price"],
        serviceName: json["serviceName"],
        spaName: json["spaName"],
        timeStart: json["timeStart"],
        timeEnd: json["timeEnd"],
        urlImage: json["urlImage"],
    );

    Map<String, dynamic> toJson() => {
        "bookingServiceId": bookingServiceId,
        "status": status,
        "price": price,
        "serviceName": serviceName,
        "spaName": spaName,
        "timeStart": timeStart,
        "timeEnd": timeEnd,
        "urlImage": urlImage,
    };
}
