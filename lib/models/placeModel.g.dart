// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'placeModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PlaceModel _$PlaceModelFromJson(Map<String, dynamic> json) {
  return PlaceModel(
    id: json['id'] as String?,
    placeName: json['placeName'] as String?,
    placeLogo: json['placeLogo'] as String?,
    description: json['description'] as String?,
    contactEmail: json['contactEmail'] as String?,
    contactNumber: json['contactNumber'] as String?,
    address: json['address'] == null
        ? null
        : AddressModel.fromJson(json['address'] as Map<String, dynamic>),
    facebook: json['facebook'] as String?,
    website: json['website'] as String?,
    rooms: (json['rooms'] as List<dynamic>?)
        ?.map((e) => RoomModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    photos:
        (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
    features:
        (json['features'] as List<dynamic>?)?.map((e) => e as String).toList(),
    reviews: (json['reviews'] as List<dynamic>?)
        ?.map((e) => ReviewModel.fromJson(e as Map<String, dynamic>))
        .toList(),
    joinDate: dateTimeFromTimestamp(json['joinDate'] as Timestamp?),
    ownerId: json['ownerId'] as String?,
    verified: json['verified'] as bool?,
    blocked: json['blocked'] as bool?,
  );
}

Map<String, dynamic> _$PlaceModelToJson(PlaceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'placeName': instance.placeName,
      'placeLogo': instance.placeLogo,
      'description': instance.description,
      'contactEmail': instance.contactEmail,
      'contactNumber': instance.contactNumber,
      'address': instance.address?.toJson(),
      'facebook': instance.facebook,
      'website': instance.website,
      'rooms': instance.rooms?.map((e) => e.toJson()).toList(),
      'photos': instance.photos,
      'features': instance.features,
      'reviews': instance.reviews,
      'joinDate': dateTimeToTimestamp(instance.joinDate),
      'ownerId': instance.ownerId,
      'verified': instance.verified,
      'blocked': instance.blocked,
    };
