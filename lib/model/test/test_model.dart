class TestModel {
  TestModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.maidenName,
    required this.age,
    required this.gender,
    required this.email,
    required this.phone,
    required this.username,
    required this.password,
    required this.birthDate,
    required this.image,
    required this.bloodGroup,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hair,
    required this.ip,
    required this.address,
    required this.macAddress,
    required this.university,
    required this.bank,
    required this.company,
    required this.ein,
    required this.ssn,
    required this.userAgent,
    required this.crypto,
    required this.role,
  });

  final int id;
  final String firstName;
  final String lastName;
  final String maidenName;
  final int age;
  final String gender;
  final String email;
  final String phone;
  final String username;
  final String password;
  final String birthDate;
  final String image;
  final String bloodGroup;
  final double height;
  final double weight;
  final String eyeColor;
  final Hair? hair;
  final String ip;
  final Address? address;
  final String macAddress;
  final String university;
  final Bank? bank;
  final Company? company;
  final String ein;
  final String ssn;
  final String userAgent;
  final Crypto? crypto;
  final String role;

  TestModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? maidenName,
    int? age,
    String? gender,
    String? email,
    String? phone,
    String? username,
    String? password,
    String? birthDate,
    String? image,
    String? bloodGroup,
    double? height,
    double? weight,
    String? eyeColor,
    Hair? hair,
    String? ip,
    Address? address,
    String? macAddress,
    String? university,
    Bank? bank,
    Company? company,
    String? ein,
    String? ssn,
    String? userAgent,
    Crypto? crypto,
    String? role,
  }) {
    return TestModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      maidenName: maidenName ?? this.maidenName,
      age: age ?? this.age,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      username: username ?? this.username,
      password: password ?? this.password,
      birthDate: birthDate ?? this.birthDate,
      image: image ?? this.image,
      bloodGroup: bloodGroup ?? this.bloodGroup,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      eyeColor: eyeColor ?? this.eyeColor,
      hair: hair ?? this.hair,
      ip: ip ?? this.ip,
      address: address ?? this.address,
      macAddress: macAddress ?? this.macAddress,
      university: university ?? this.university,
      bank: bank ?? this.bank,
      company: company ?? this.company,
      ein: ein ?? this.ein,
      ssn: ssn ?? this.ssn,
      userAgent: userAgent ?? this.userAgent,
      crypto: crypto ?? this.crypto,
      role: role ?? this.role,
    );
  }

  factory TestModel.empty() => TestModel(
      id: 0,
      firstName: '',
      lastName: '',
      maidenName: '',
      age: 0,
      gender: '',
      email: '',
      phone: '',
      username: '',
      password: '',
      birthDate: '',
      image: '',
      bloodGroup: '',
      height: 0,
      weight: 0,
      eyeColor: '',
      hair: Hair.empty(),
      ip: '',
      address: Address.empty(),
      macAddress: '',
      university: '',
      bank: Bank.empty(),
      company: Company.empty(),
      ein: '',
      ssn: '',
      userAgent: '',
      crypto: Crypto.empty(),
      role: '');
  factory TestModel.fromJson(Map<String, dynamic> json) {
    return TestModel(
      id: json["id"] ?? 0,
      firstName: json["firstName"] ?? "",
      lastName: json["lastName"] ?? "",
      maidenName: json["maidenName"] ?? "",
      age: json["age"] ?? 0,
      gender: json["gender"] ?? "",
      email: json["email"] ?? "",
      phone: json["phone"] ?? "",
      username: json["username"] ?? "",
      password: json["password"] ?? "",
      birthDate: json["birthDate"] ?? "",
      image: json["image"] ?? "",
      bloodGroup: json["bloodGroup"] ?? "",
      height: json["height"] ?? 0.0,
      weight: json["weight"] ?? 0.0,
      eyeColor: json["eyeColor"] ?? "",
      hair: json["hair"] == null ? null : Hair.fromJson(json["hair"]),
      ip: json["ip"] ?? "",
      address:
          json["address"] == null ? null : Address.fromJson(json["address"]),
      macAddress: json["macAddress"] ?? "",
      university: json["university"] ?? "",
      bank: json["bank"] == null ? null : Bank.fromJson(json["bank"]),
      company:
          json["company"] == null ? null : Company.fromJson(json["company"]),
      ein: json["ein"] ?? "",
      ssn: json["ssn"] ?? "",
      userAgent: json["userAgent"] ?? "",
      crypto: json["crypto"] == null ? null : Crypto.fromJson(json["crypto"]),
      role: json["role"] ?? "",
    );
  }
}

class Address {
  Address({
    required this.address,
    required this.city,
    required this.state,
    required this.stateCode,
    required this.postalCode,
    required this.coordinates,
    required this.country,
  });

  final String address;
  final String city;
  final String state;
  final String stateCode;
  final String postalCode;
  final Coordinates? coordinates;
  final String country;

  Address copyWith({
    String? address,
    String? city,
    String? state,
    String? stateCode,
    String? postalCode,
    Coordinates? coordinates,
    String? country,
  }) {
    return Address(
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      stateCode: stateCode ?? this.stateCode,
      postalCode: postalCode ?? this.postalCode,
      coordinates: coordinates ?? this.coordinates,
      country: country ?? this.country,
    );
  }

  factory Address.empty() => Address(
      address: '',
      city: '',
      state: '',
      stateCode: '',
      postalCode: '',
      coordinates: Coordinates.empty(),
      country: '');
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      address: json["address"] ?? "",
      city: json["city"] ?? "",
      state: json["state"] ?? "",
      stateCode: json["stateCode"] ?? "",
      postalCode: json["postalCode"] ?? "",
      coordinates: json["coordinates"] == null
          ? null
          : Coordinates.fromJson(json["coordinates"]),
      country: json["country"] ?? "",
    );
  }
}

class Coordinates {
  Coordinates({
    required this.lat,
    required this.lng,
  });

  final double lat;
  final double lng;

  Coordinates copyWith({
    double? lat,
    double? lng,
  }) {
    return Coordinates(
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  factory Coordinates.empty() => Coordinates(lat: 0, lng: 0);
  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      lat: json["lat"] ?? 0.0,
      lng: json["lng"] ?? 0.0,
    );
  }
}

class Bank {
  Bank({
    required this.cardExpire,
    required this.cardNumber,
    required this.cardType,
    required this.currency,
    required this.iban,
  });

  final String cardExpire;
  final String cardNumber;
  final String cardType;
  final String currency;
  final String iban;

  Bank copyWith({
    String? cardExpire,
    String? cardNumber,
    String? cardType,
    String? currency,
    String? iban,
  }) {
    return Bank(
      cardExpire: cardExpire ?? this.cardExpire,
      cardNumber: cardNumber ?? this.cardNumber,
      cardType: cardType ?? this.cardType,
      currency: currency ?? this.currency,
      iban: iban ?? this.iban,
    );
  }

  factory Bank.empty() => Bank(
      cardExpire: '', cardNumber: '', cardType: '', currency: '', iban: '');
  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(
      cardExpire: json["cardExpire"] ?? "",
      cardNumber: json["cardNumber"] ?? "",
      cardType: json["cardType"] ?? "",
      currency: json["currency"] ?? "",
      iban: json["iban"] ?? "",
    );
  }
}

class Company {
  Company({
    required this.department,
    required this.name,
    required this.title,
    required this.address,
  });

  final String department;
  final String name;
  final String title;
  final Address? address;

  Company copyWith({
    String? department,
    String? name,
    String? title,
    Address? address,
  }) {
    return Company(
      department: department ?? this.department,
      name: name ?? this.name,
      title: title ?? this.title,
      address: address ?? this.address,
    );
  }

  factory Company.empty() =>
      Company(department: '', name: '', title: '', address: Address.empty());
  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      department: json["department"] ?? "",
      name: json["name"] ?? "",
      title: json["title"] ?? "",
      address:
          json["address"] == null ? null : Address.fromJson(json["address"]),
    );
  }
}

class Crypto {
  Crypto({
    required this.coin,
    required this.wallet,
    required this.network,
  });

  final String coin;
  final String wallet;
  final String network;

  Crypto copyWith({
    String? coin,
    String? wallet,
    String? network,
  }) {
    return Crypto(
      coin: coin ?? this.coin,
      wallet: wallet ?? this.wallet,
      network: network ?? this.network,
    );
  }

  factory Crypto.empty() => Crypto(coin: '', wallet: '', network: '');
  factory Crypto.fromJson(Map<String, dynamic> json) {
    return Crypto(
      coin: json["coin"] ?? "",
      wallet: json["wallet"] ?? "",
      network: json["network"] ?? "",
    );
  }
}

class Hair {
  Hair({
    required this.color,
    required this.type,
  });

  final String color;
  final String type;

  Hair copyWith({
    String? color,
    String? type,
  }) {
    return Hair(
      color: color ?? this.color,
      type: type ?? this.type,
    );
  }

  factory Hair.empty() => Hair(color: '', type: '');
  factory Hair.fromJson(Map<String, dynamic> json) {
    return Hair(
      color: json["color"] ?? "",
      type: json["type"] ?? "",
    );
  }
}
