import 'package:client/models/addressModel.dart';
import 'package:client/models/reviewModel.dart';
import 'package:client/models/roomModel.dart';
import 'package:client/utils/utilFunctions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'placeModel.g.dart';

@JsonSerializable(explicitToJson: true)
class PlaceModel {
  String? id;
  String? placeName;
  String? placeLogo;
  String? description;

  String? contactEmail;
  String? contactNumber;
  AddressModel? address;
  String? facebook;
  String? website;

  List<RoomModel>? rooms;
  List<String>? photos;
  List<String>? features;
  List<ReviewModel>? reviews;

  @JsonKey(fromJson: dateTimeFromTimestamp, toJson: dateTimeToTimestamp)
  DateTime? joinDate;
  String? ownerId;
  bool? verified, blocked;

  PlaceModel({
    this.id,
    this.placeName,
    this.placeLogo,
    this.description,

    this.contactEmail,
    this.contactNumber,
    this.address,
    this.facebook,
    this.website,

    this.rooms,
    this.photos,
    this.features,
    this.reviews,

    this.joinDate,
    this.ownerId,
    this.verified = false,
    this.blocked = false,
  });

  PlaceModel copy() => PlaceModel.fromJson(this.toJson());
  factory PlaceModel.fromJson(Map<String, dynamic> json) =>
      _$PlaceModelFromJson(json);
  Map<String, dynamic> toJson() => _$PlaceModelToJson(this);
}