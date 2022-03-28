// To parse this JSON data, do
//
//     final getcontactmodel = getcontactmodelFromJson(jsonString);

import 'dart:convert';

Getcontactmodel getcontactmodelFromJson(String str) => Getcontactmodel.fromJson(json.decode(str));

String getcontactmodelToJson(Getcontactmodel data) => json.encode(data.toJson());

class Getcontactmodel {
  Getcontactmodel({
    this.data,
  });

  Data data;

  factory Getcontactmodel.fromJson(Map<String, dynamic> json) => Getcontactmodel(
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
  };
}

class Data {
  Data({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int currentPage;
  List<Datum> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Link> links;
  String nextPageUrl;
  String path;
  int perPage;
  dynamic prevPageUrl;
  int to;
  int total;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    currentPage: json["current_page"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    links: List<Link>.from(json["links"].map((x) => Link.fromJson(x))),
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "links": List<dynamic>.from(links.map((x) => x.toJson())),
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class Datum {
  Datum({
    this.id,
    this.firstName,
    this.lastName,
    this.joinDate,
    this.dateOfBirth,
    this.designationId,
    this.gender,
    this.mobile,
    this.landline,
    this.email,
    this.presentAddress,
    this.permanentAddress,
    this.profilePicture,
    this.resume,
    this.createdAt,
    this.updatedAt,
    this.status,
  });

  int id;
  String firstName;
  String lastName;
  DateTime joinDate;
  DateTime dateOfBirth;
  int designationId;
  Gender gender;
  int mobile;
  int landline;
  String email;
  String presentAddress;
  String permanentAddress;
  String profilePicture;
  String resume;
  DateTime createdAt;
  DateTime updatedAt;
  String status;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    joinDate: DateTime.parse(json["join_date"]),
    dateOfBirth: DateTime.parse(json["date_of_birth"]),
    designationId: json["designation_id"],
    gender: genderValues.map[json["gender"]],
    mobile: json["mobile"],
    landline: json["landline"],
    email: json["email"],
    presentAddress: json["present_address"],
    permanentAddress: json["permanent_address"],
    profilePicture: json["profile_picture"],
    resume: json["resume"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "first_name": firstName,
    "last_name": lastName,
    "join_date": joinDate.toIso8601String(),
    "date_of_birth": dateOfBirth.toIso8601String(),
    "designation_id": designationId,
    "gender": genderValues.reverse[gender],
    "mobile": mobile,
    "landline": landline,
    "email": email,
    "present_address": presentAddress,
    "permanent_address": permanentAddress,
    "profile_picture": profilePicture,
    "resume": resume,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "status": status,
  };
}

enum Gender { MALE, FEMALE, GENDER_FEMALE }

final genderValues = EnumValues({
  "Female": Gender.FEMALE,
  "female": Gender.GENDER_FEMALE,
  "male": Gender.MALE
});

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String url;
  String label;
  bool active;

  factory Link.fromJson(Map<String, dynamic> json) => Link(
    url: json["url"] == null ? null : json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toJson() => {
    "url": url == null ? null : url,
    "label": label,
    "active": active,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
