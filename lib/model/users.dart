import 'dart:convert';

class User {
  final int id;
  final String name;
  final String username;
  final String email;
  final Address address;
  final String phone;
  final String website;
  final Company company;

  const User({this.id, this.name, this.username, this.email, this.address, this.phone, this.website, this.company});

  factory User.fromJson(Map<String, dynamic> json){
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      address: json['address'] != null ? Address.fromJson(json['address']) : null,
      phone: json['phone'],
      website: json['website'],
      company: Company.fromJson(json['company'])
    );
  }
}

class Address {
  final String street;
  final String suite;
  final String city;
  final String zipcode;
  final Geo geo;

  const Address({this.street, this.suite, this.city, this.zipcode, this.geo});

  factory Address.fromJson(Map<String, dynamic> json){
    return Address(
      street: json['street'],
      suite: json['suite'],
      city: json['city'],
      zipcode: json['zipcode'],
      geo: json['geo'] != null ? Geo.fromJson(json['geo']) : null,
    );
  }
}

class Geo {
  final String lat;
  final String lng;

  const Geo({this.lat, this.lng});

  factory Geo.fromJson(Map<String, dynamic> json){
    return Geo(
      lat: json['lat'],
      lng: json['lng'],
    );
  }
}

class Company{
  final String name;
  final String catchPhrase;
  final String bs;

  const Company({this.name, this.catchPhrase, this.bs});

  factory Company.fromJson(Map<String, dynamic> json){
    return Company(
      name: json['name'],
      catchPhrase: json['catchPhrase'],
      bs: json['bs']
    );
  }
}

List<User> userJson(String str) {
    return List<User>.from(json.decode(str)
        .map((data) => User.fromJson(data))
    );
}