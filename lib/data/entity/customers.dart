import 'package:flutter/foundation.dart';

class Customers {
  String kisi_id;
  String kisi_name;
  String kisi_email;

  Customers({required this.kisi_id, required this.kisi_name, required this.kisi_email});

  factory Customers.fromJson(Map<dynamic, dynamic> json, String key){
      return Customers(
          kisi_id: key,
          kisi_name: json['kisi_name'] as String,
          kisi_email: json['kisi_email'] as String
      );
  }
}
