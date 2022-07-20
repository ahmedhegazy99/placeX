// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reviewModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) {
  return ReviewModel(
    id: json['id'] as String?,
    placeId: json['placeId'] as String?,
    userId: json['userId'] as String?,
    rating: json['rating'] as int?,
    comment: json['comment'] as String?,
    photoUrl: json['photoUrl'] as String?,
    created: json['created'] == null
        ? null
        : DateTime.parse(json['created'] as String),
    modified: json['modified'] == null
        ? null
        : DateTime.parse(json['modified'] as String),
    blocked: json['blocked'] as bool?,
  );
}

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'placeId': instance.placeId,
      'userId': instance.userId,
      'rating': instance.rating,
      'comment': instance.comment,
      'photoUrl': instance.photoUrl,
      'created': instance.created?.toIso8601String(),
      'modified': instance.modified?.toIso8601String(),
      'blocked': instance.blocked,
    };
