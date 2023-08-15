class ItemModel {
  int? id;
  String? service;
  String? subService;
  String? image;
  String? price;
  DateTime? startTime;
  DateTime? endTime;
  String? address;
  String? lat;
  String? long;
  bool? paid;

  ItemModel(
      {this.id,
      this.service,
      this.subService,
      this.image,
      this.price,
      this.startTime,
      this.endTime,
      this.address,
      this.lat,
      this.long,
      this.paid});

  ItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    service = json['service'];
    subService = json['subService'];
    image = json['image'];
    price = json['price'].toString();
    startTime = json['start_time'] != null
        ? DateTime.parse(json['start_time'])
        : DateTime.now();
    endTime = json['end_time'] != null
        ? DateTime.parse(json['end_time'])
        : DateTime.now();
    address = json['address'];
    lat = json['lat'];
    long = json['long'];
    paid = json['paid'] == 1 ? true : false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['service'] = service;
    data['subService'] = subService;
    data['image'] = image;
    data['price'] = price;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['address'] = address;
    data['lat'] = lat;
    data['long'] = long;
    data['paid'] = paid;
    return data;
  }
}
