// To parse this JSON data, do
//
//     final deleteUser = deleteUserFromJson(jsonString);

import 'dart:convert';

DeleteUser deleteUserFromJson(String str) => DeleteUser.fromJson(json.decode(str));

String deleteUserToJson(DeleteUser data) => json.encode(data.toJson());

class DeleteUser {
    String? message;

    DeleteUser({
        this.message,
    });

    factory DeleteUser.fromJson(Map<String, dynamic> json) => DeleteUser(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}