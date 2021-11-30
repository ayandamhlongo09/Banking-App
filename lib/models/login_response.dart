import 'dart:convert';

LoginResponse loginResponseFromJson(String str) => LoginResponse.fromJson(json.decode(str));

String loginResponseToJson(LoginResponse data) => json.encode(data.toJson());

class LoginResponse {
    LoginResponse({
        this.kind,
        this.localId,
        this.email,
        this.displayName,
        this.idToken,
        this.registered,
        this.refreshToken,
        this.expiresIn,
    });

    String kind;
    String localId;
    String email;
    String displayName;
    String idToken;
    bool registered;
    String refreshToken;
    String expiresIn;

    factory LoginResponse.fromJson(Map<String, dynamic> json) => LoginResponse(
        kind: json["kind"],
        localId: json["localId"],
        email: json["email"],
        displayName: json["displayName"],
        idToken: json["idToken"],
        registered: json["registered"],
        refreshToken: json["refreshToken"],
        expiresIn: json["expiresIn"],
    );
    factory LoginResponse.fromRawJson(String str) =>
      LoginResponse.fromJson(json.decode(str));

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "localId": localId,
        "email": email,
        "displayName": displayName,
        "idToken": idToken,
        "registered": registered,
        "refreshToken": refreshToken,
        "expiresIn": expiresIn,
    };
}
