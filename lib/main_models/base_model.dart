import 'package:casaProvider/features/maps/models/location_model.dart';

class BaseModel {
  void Function(dynamic)? valueChanged;
  LocationModel? location;
  bool? boolean;
  BaseModel({
    this.valueChanged,
    this.location,
    this.boolean,
  });
}
