// To parse this JSON data, do
//
//     final productoModel = productoModelFromJson(jsonString);

import 'dart:convert';

ProductoModel productoModelFromJson(String str) =>
    ProductoModel.fromJson(json.decode(str));

String productoModelToJson(ProductoModel data) => json.encode(data.toJson());

class ProductoModel {
  String id;
  String title;
  double value;
  bool available;
  String fotoUrl;

  ProductoModel({
    this.id,
    this.title = '',
    this.value = 0.0,
    this.available = true,
    this.fotoUrl,
  });

  factory ProductoModel.fromJson(Map<String, dynamic> json) =>
      new ProductoModel(
        id: json["id"],
        title: json["title"],
        value: json["value"],
        available: json["available"],
        fotoUrl: json["fotoUrl"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "value": value,
        "available": available,
        "fotoUrl": fotoUrl,
      };
}
