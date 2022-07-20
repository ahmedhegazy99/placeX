import 'package:client/utils/utilFunctions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ownerModel.g.dart';

@JsonSerializable(explicitToJson: true)
class OwnerModel {
  String? id;
  String? ownerName;
  String? email;
  String? phoneNumber;
  String? photoUrl;
  String? placeId;
  @JsonKey(fromJson: dateTimeFromTimestamp, toJson: dateTimeToTimestamp)
  DateTime? joinDate;

  OwnerModel({
    this.id,
    this.ownerName,
    this.email,
    this.phoneNumber,
    this.photoUrl,
    this.placeId,
    this.joinDate,
  });

  OwnerModel copy() => OwnerModel.fromJson(this.toJson());
  factory OwnerModel.fromJson(Map<String, dynamic> json) =>
      _$OwnerModelFromJson(json);
  Map<String, dynamic> toJson() => _$OwnerModelToJson(this);
}