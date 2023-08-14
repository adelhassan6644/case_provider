class ItemModel {
  int? id;
  String? image;
  String? service;
  String? subService;
  DateTime? date;
  String? address;

  ItemModel(
      {this.id,
      this.image,
      this.service,
      this.subService,
      this.date,
      this.address});

  ItemModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    service = json['service'];
    subService = json['subService'];
    date = json['date']??DateTime.now();
    address = json['address'];
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
