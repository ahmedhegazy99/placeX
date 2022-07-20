import 'package:json_annotation/json_annotation.dart';

part 'roomModel.g.dart';

@JsonSerializable(explicitToJson: true)
class RoomModel {
  String? title;
  String? capacity;
  String? price;
  List<String>? photos;

  RoomModel({
    this.title,
    this.capacity,
    this.price,
    this.photos,
  });

  RoomModel copy() => RoomModel.fromJson(this.toJson());
  factory RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);
  Map<String, dynamic> toJson() => _$RoomModelToJson(this);
}