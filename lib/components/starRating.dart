import 'package:client/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StarRating extends StatelessWidget {
  final Color? color;
  final double? bSize;
  final bool button;
  double rating;

  StarRating({
    Key? key,
    this.color = goldStar,
    this.bSize = 24,
    this.button = true,
    this.rating = 0,
  }) : super(key: key);

  RxDouble? ratingObserver;

  @override
  Widget build(BuildContext context) {
    ratingObserver = rating.obs;
    return Row(
      children: List.generate(
        5,
        (index) => Obx(() {
          return button
              ? Container(
                  width: bSize,
                  child: IconButton(
                    icon: index < ratingObserver!.value
                        ? Icon(
                            Icons.star,
                            size: bSize,
                          )
                        : Icon(Icons.star_border, size: bSize),
                    color: color,
                    onPressed: () {
                      print("start $index pressed");
                      ratingObserver!.value = index + 1;
                      print(ratingObserver.reactive);
                    },
                  ))
              : Container(
                  //width: bSize,
                  child: Icon(
                    index >= ratingObserver!.value
                        ? Icons.star_border
                        : index > rating - 1 && index < rating
                            ? Icons.star_half
                            : Icons.star,
                    size: bSize,
                    color: color,
                  ),
                );
        }),
      ),
    );
  }
}
