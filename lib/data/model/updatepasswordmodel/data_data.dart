import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:plstka_app/data/model/updatepasswordmodel/areadata_data.dart';
import 'package:plstka_app/data/model/updatepasswordmodel/citydata_data.dart';

class Data {
  Areadata areadata;
  String area;
  String address;
  String phone;
  String city;
  String name;
  Citydata citydata;
  int id;
  String avatar;
  String email;
  String points;

  Data({
    this.areadata,
    this.area = "",
    this.address = "",
    this.phone = "",
    this.city = "",
    this.name = "",
    this.citydata,
    this.id = 0,
    this.avatar = "",
    this.email = "",
    this.points = "",
  });

  Data.fromJson(Map<String, dynamic>  map) :
        areadata = map['areadata'] == null
            ? null
            : Areadata.fromJson(map['areadata']),
        area = map['area']  ?? "",
        address = map['address']  ?? "",
        phone = map['phone']  ?? "",
        city = map['city']  ?? "",
        name = map['name']  ?? "",
        citydata = map['citydata'] == null
            ? null
            : Citydata.fromJson(map['citydata']),
        id = map['id']  ?? 0,
        avatar = map['avatar']  ?? "",
        email = map['email']  ?? "",
        points = map['points']  ?? "";

  Map<String, dynamic> toJson() => {
        'areadata': areadata.toJson(),
        'area': area,
        'address': address,
        'phone': phone,
        'city': city,
        'name': name,
        'citydata': citydata.toJson(),
        'id': id,
        'avatar': avatar,
        'email': email,
        'points': points,
      };

  Data copyWith({
    Areadata areadata,
    String area,
    String address,
    String phone,
    String city,
    String name,
    Citydata citydata,
    int id,
    String avatar,
    String email,
    String points,
  }) {
    return Data(
      areadata: areadata ?? this.areadata,
      area: area ?? this.area,
      address: address ?? this.address,
      phone: phone ?? this.phone,
      city: city ?? this.city,
      name: name ?? this.name,
      citydata: citydata ?? this.citydata,
      id: id ?? this.id,
      avatar: avatar ?? this.avatar,
      email: email ?? this.email,
      points: points ?? this.points,
    );
  }

}

