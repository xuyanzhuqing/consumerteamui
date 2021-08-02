import 'package:flutter/foundation.dart';


@immutable
class User {

  const User({
    required this.uuid,
    required this.type,
    this.phone,
    this.firstName,
    this.lastName,
    this.sex,
    this.email,
    this.address,
    this.postcode,
    this.createTime,
  });

  final String uuid;
  UserTypeEnum get userTypeEnum => _userTypeEnumValues.map[type]!;
  final String type;
  final String? phone;
  final String? firstName;
  final String? lastName;
  UserSexEnum? get userSexEnum => _userSexEnumValues.map[sex];
  final String? sex;
  final String? email;
  final String? address;
  final String? postcode;
  final DateTime? createTime;

  factory User.fromJson(Map<String,dynamic> json) => User(
    uuid: json['uuid'] as String,
    type: json['type'] as String,
    phone: json['phone'] != null ? json['phone'] as String : null,
    firstName: json['firstName'] != null ? json['firstName'] as String : null,
    lastName: json['lastName'] != null ? json['lastName'] as String : null,
    sex: json['sex'] != null ? json['sex'] as String : null,
    email: json['email'] != null ? json['email'] as String : null,
    address: json['address'] != null ? json['address'] as String : null,
    postcode: json['postcode'] != null ? json['postcode'] as String : null,
    createTime: json['createTime'] != null ? DateTime.parse(json['createTime'] as String) : null
  );
  
  Map<String, dynamic> toJson() => {
    'uuid': uuid,
    'type': type,
    'phone': phone,
    'firstName': firstName,
    'lastName': lastName,
    'sex': sex,
    'email': email,
    'address': address,
    'postcode': postcode,
    'createTime': createTime?.toIso8601String()
  };

  User clone() => User(
    uuid: uuid,
    type: type,
    phone: phone,
    firstName: firstName,
    lastName: lastName,
    sex: sex,
    email: email,
    address: address,
    postcode: postcode,
    createTime: createTime
  );


  User copyWith({
    String? uuid,
    String? type,
    String? phone,
    String? firstName,
    String? lastName,
    String? sex,
    String? email,
    String? address,
    String? postcode,
    DateTime? createTime
  }) => User(
    uuid: uuid ?? this.uuid,
    type: type ?? this.type,
    phone: phone ?? this.phone,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    sex: sex ?? this.sex,
    email: email ?? this.email,
    address: address ?? this.address,
    postcode: postcode ?? this.postcode,
    createTime: createTime ?? this.createTime,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is User && uuid == other.uuid && type == other.type && phone == other.phone && firstName == other.firstName && lastName == other.lastName && sex == other.sex && email == other.email && address == other.address && postcode == other.postcode && createTime == other.createTime;

  @override
  int get hashCode => uuid.hashCode ^ type.hashCode ^ phone.hashCode ^ firstName.hashCode ^ lastName.hashCode ^ sex.hashCode ^ email.hashCode ^ address.hashCode ^ postcode.hashCode ^ createTime.hashCode;
}

enum UserTypeEnum { Consumer, Team }

extension UserTypeEnumEx on UserTypeEnum{
  String? get value => _userTypeEnumValues.reverse[this];
}

final _userTypeEnumValues = _UserTypeEnumConverter({
  'consumer': UserTypeEnum.Consumer,
  'team': UserTypeEnum.Team,
});


class _UserTypeEnumConverter<String, O> {
  final Map<String, O> map;
  Map<O, String>? reverseMap;

  _UserTypeEnumConverter(this.map);

  Map<O, String> get reverse => reverseMap ??= map.map((k, v) => MapEntry(v, k));
}

enum UserSexEnum { Man, Woman }

extension UserSexEnumEx on UserSexEnum{
  String? get value => _userSexEnumValues.reverse[this];
}

final _userSexEnumValues = _UserSexEnumConverter({
  'man': UserSexEnum.Man,
  'woman': UserSexEnum.Woman,
});


class _UserSexEnumConverter<String, O> {
  final Map<String, O> map;
  Map<O, String>? reverseMap;

  _UserSexEnumConverter(this.map);

  Map<O, String> get reverse => reverseMap ??= map.map((k, v) => MapEntry(v, k));
}

