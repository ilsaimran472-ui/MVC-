// To parse this JSON data, do
//
//     final editUser = editUserFromJson(jsonString);

import 'dart:convert';

EditUser editUserFromJson(String str) => EditUser.fromJson(json.decode(str));

String editUserToJson(EditUser data) => json.encode(data.toJson());

class EditUser {
    String? message;

    EditUser({
        this.message,
    });

    factory EditUser.fromJson(Map<String, dynamic> json) => EditUser(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}