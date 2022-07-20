import 'package:json_annotation/json_annotation.dart';

part 'reviewModel.g.dart';

@JsonSerializable(explicitToJson: true)
class ReviewModel {
  String? id;
  String? placeId;
  String? userId;
  int? rating;
  String? comment;
  String? photoUrl;
  DateTime? created;
  DateTime? modified;
  bool? blocked;

  ReviewModel({
    this.id,
    this.placeId,
    this.userId,
    this.rating,
    this.comment,
    this.photoUrl,
    this.created,
    this.modified,
    this.blocked = false,
  });

  ReviewModel copy() => ReviewModel.fromJson(this.toJson());
  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);
}