import 'package:json_annotation/json_annotation.dart';

part 'addressModel.g.dart';

@JsonSerializable(explicitToJson: true)
class AddressModel {
  String? apartmentNo;
  String? building;
  String? street;
  String? district;
  String? administrativeArea;
  String? governorate;
  String? locationUrl;


  AddressModel({
    this.apartmentNo,
    this.building,
    this.street,
    this.district,
    this.administrativeArea,
    this.governorate,
    this.locationUrl,
  });

  AddressModel copy() => AddressModel.fromJson(this.toJson());
  factory AddressModel.fromJson(Map<String, dynamic> json) =>
      _$AddressModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddressModelToJson(this);
}