import 'package:cached_network_image/cached_network_image.dart';
import 'package:client/components/starRating.dart';
import 'package:client/models/placeModel.dart';
import 'package:client/utils/utilFunctions.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

class PlaceCard extends StatelessWidget {
  final PlaceModel place;
  PlaceCard({Key? key, required this.place}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    double rating = getRating(place.reviews);
    return Card(
      //color: Colors.yellow,
      margin: EdgeInsets.symmetric(vertical: 4, horizontal: 6),
      /*shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(30.0),
        ),
      ),*/
      child: Container(
        //padding: EdgeInsets.all(size.width * 0.04),
        width: size.width,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //place logo
            Flexible(
              flex: 2,
              child: CachedNetworkImage(
                imageUrl:
                '${place.placeLogo ?? 'https://socialimpact.com/wp-content/uploads/2021/03/logo-placeholder.jpg'}',
                imageBuilder: (context, imageProvider) => Container(
                  width: size.width * 0.4,
                  height: size.width * 0.4,
                  decoration: BoxDecoration(
                    //shape: BoxShape.circle,
                    image: DecorationImage(
                        image: imageProvider,
                        fit: BoxFit.cover),
                  ),
                ),
                placeholder: (context, url) =>
                    CircularProgressIndicator(),
                errorWidget: (context, url, error) =>
                    CircleAvatar(
                      backgroundImage: Image.asset(
                        'assets/images/logo_placeholder.jpg',
                        fit: BoxFit.contain,
                      ).image,
                      radius: size.width * 0.2,
                    ),
              ),
            ),

            Flexible(
              flex: 3,
              fit: FlexFit.loose,
              child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: size.height*0.01),
                        child: ListTile(
                          title: Text(
                            place.placeName!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 24,
                            ),
                          ),

                          subtitle: Text(
                            //add city(giza) and town(dokki)
                            place.address?.governorate ?? "Governorate",
                            style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),

                      //TODO: add rating
                      Container(
                        margin: EdgeInsets.only(left: size.width * 0.04, bottom: size.width * 0.01),
                        child: Text("$rating"),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: size.width * 0.03),
                        child: Row(
                          children: [

                            StarRating(
                              rating: rating,
                              button: false,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: size.width * 0.01),
                              child: Text("(${place.reviews?.length ?? 0})"),
                            ),
                          ],
                        ),
                      ),

                    ],
                  )
              ),
            ),

          ],
        ),
      ),
    );
  }
}
