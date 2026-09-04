// To parse this JSON data, do
//
//     final cart = cartFromJson(jsonString);

import 'dart:convert';

Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

String cartToJson(Cart data) => json.encode(data.toJson());

class Cart {
    String? message;

    Cart({
        this.message,
    });

    factory Cart.fromJson(Map<String, dynamic> json) => Cart(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}