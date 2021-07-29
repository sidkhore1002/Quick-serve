class ServiceModel {
  String name;
  String phone;
  String charges;
  String address;

  ServiceModel(
      {required this.name,
      required this.phone,
      required this.charges,
      required this.address});

  factory ServiceModel.fromJson(dynamic json) {
    return ServiceModel(
      name: "${json['name']}",
      phone: "${json['phone']}",
      charges: "${json['charges']}",
      address: "${json['address']}",
    );
  }

  Map toJson() => {
        "name": name,
        "phone": phone,
        "charges": charges,
        "address": address,
      };
}
