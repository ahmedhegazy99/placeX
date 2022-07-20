// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roomModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomModel _$RoomModelFromJson(Map<String, dynamic> json) {
  return RoomModel(
    title: json['title'] as String?,
    capacity: json['capacity'] as String?,
    price: json['price'] as String?,
    photos:
        (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$RoomModelToJson(RoomModel instance) => <String, dynamic>{
      'title': instance.title,
      'capacity': instance.capacity,
      'price': instance.price,
      'photos': instance.photos,
    };
