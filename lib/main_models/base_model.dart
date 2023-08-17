
class BaseModel {
  void Function(dynamic)? valueChanged;
  String? lat;
  String? long;
  bool? boolean;
  BaseModel({
    this.valueChanged,

    this.lat,
    this.long,
    this.boolean,
  });
}
