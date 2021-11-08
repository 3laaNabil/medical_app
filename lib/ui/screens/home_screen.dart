import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:medical_app/business_logic/medical/provider.dart';
import 'package:medical_app/data/model/banner_model.dart';
import 'package:medical_app/data/model/doctors_model.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MedicalProvider>(
        builder: (context, model, child) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  CarouselSlider(
                    items: [
                      Image.network(
                          "https://image.freepik.com/free-vector/realistic-medical-webinar-template_23-2149090295.jpg"),
                      Image.network(
                          "https://image.freepik.com/free-vector/gradient-kids-doctor-webinar_23-2149097261.jpg"),
                    ],
                    options: CarouselOptions(
                      height: 250.0,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration: const Duration(seconds: 1),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      scrollDirection: Axis.horizontal,
                      viewportFraction: 1.0,
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    alignment: AlignmentDirectional.topStart,
                    child: Text("Recommended :",
                        style: TextStyle(
                          fontSize: 24,
                          color: sColor,
                          fontFamily: 'Asma',
                        )),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  if (model.doctors == null) CircularProgressIndicator(),
                  GridView.count(
                    mainAxisSpacing: 1.0,
                    crossAxisSpacing: 1.0,
                    childAspectRatio: 1 / 1.5,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    crossAxisCount: 2,
                    children: List.generate(
                        model.doctors!.length,
                        (index) => InkWell(
                            onTap: () {},
                            child: recDocItem(
                                model.doctors![index], context, index))),
                  )
                ],
              ),
            ));
  }

  Widget recDocItem(DoctorsModel? model, context, index) {
    return Card(
      elevation: 10,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Expanded(
                child: Stack(children: [
                  Container(
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10.0)),
                        image: DecorationImage(
                          image: model!.image != null
                              ? NetworkImage('${model.image}')
                              : const NetworkImage(
                                  "https://image.freepik.com/free-photo/christmas-tree-digitally-generated-digital-festivity-stethoscope_1134-737.jpg"),
                          fit: BoxFit.cover,
                        ),
                      )),
                  Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: Container(
                      color: Colors.black38,
                      width: double.infinity,
                      height: 50,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Dr/${model.name}",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontFamily: 'Asma',
                              )),
                        ],
                      ),
                    ),
                  )
                ]),
              ),
            ],
          )),
    );
  }
}
