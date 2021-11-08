import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:medical_app/constants.dart';
import 'package:medical_app/data/model/doctors_model.dart';

Widget doctorItem(DoctorsModel model, context, index) {
  return Card(
    elevation: 10,
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                image: DecorationImage(
                  image: model.image != null
                      ? NetworkImage('${model.image}')
                      : const NetworkImage(
                          "https://image.freepik.com/free-photo/christmas-tree-digitally-generated-digital-festivity-stethoscope_1134-737.jpg"),
                  fit: BoxFit.cover,
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text(
                  "Dr/ ${model.name}",
                  style: TextStyle(
                    fontSize: 21,
                    color: sColor,
                    fontFamily: 'Asmaa',
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Icon(
                      FlutterRemix.user_location_line,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    const SizedBox(
                      height: 2,
                    ),
                    Text(
                      "${model.location}",
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                RatingBar.builder(
                  itemSize: 20.0,
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => const Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
