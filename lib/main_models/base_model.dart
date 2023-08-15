import 'package:casaProvider/features/maps/models/location_model.dart';

class BaseModel {
  void Function(dynamic)? valueChanged;
  LocationModel? location;
  String? lat;
  String? long;
  bool? boolean;
  BaseModel({
    this.valueChanged,
    this.location,
    this.lat,
    this.long,
    this.boolean,
  });
}
