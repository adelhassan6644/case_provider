class ItemModel {
  int? id;
  String? image;
  String? service;
  String? subService;
  DateTime? date;
  bool? paymentStatus;
  String? address;
  String? lat;
  String? long;

  ItemModel({
    this.id,
    this.image,
    this.paymentStatus,
    this.service,
    this.subService,
    this.date,
    this.address,
    this.lat,
    this.long,
  });

  ItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    paymentStatus = json['payment_status'] == 1 ? true : false;
    service = json['service'];
    subService = json['subService'];
    date = json['date'] ?? DateTime.now();
    address = json['address'];
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['image'] = image;
    data['service'] = service;
    data['subService'] = subService;
    return data;
  }
}
