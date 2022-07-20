// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addressModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) {
  return AddressModel(
    apartmentNo: json['apartmentNo'] as String?,
    building: json['building'] as String?,
    street: json['street'] as String?,
    district: json['district'] as String?,
    administrativeArea: json['administrativeArea'] as String?,
    governorate: json['governorate'] as String?,
    locationUrl: json['locationUrl'] as String?,
  );
}

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      'apartmentNo': instance.apartmentNo,
      'building': instance.building,
      'street': instance.street,
      'district': instance.district,
      'administrativeArea': instance.administrativeArea,
      'governorate': instance.governorate,
      'locationUrl': instance.locationUrl,
    };
