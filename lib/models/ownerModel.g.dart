// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ownerModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OwnerModel _$OwnerModelFromJson(Map<String, dynamic> json) {
  return OwnerModel(
    id: json['id'] as String?,
    ownerName: json['ownerName'] as String?,
    email: json['email'] as String?,
    phoneNumber: json['phoneNumber'] as String?,
    photoUrl: json['photoUrl'] as String?,
    placeId: json['placeId'] as String?,
    joinDate: dateTimeFromTimestamp(json['joinDate'] as Timestamp?),
  );
}

Map<String, dynamic> _$OwnerModelToJson(OwnerModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ownerName': instance.ownerName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'photoUrl': instance.photoUrl,
      'placeId': instance.placeId,
      'joinDate': dateTimeToTimestamp(instance.joinDate),
    };
