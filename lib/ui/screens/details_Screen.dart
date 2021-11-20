import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:medical_app/business_logic/medical/provider.dart';
import 'package:medical_app/constants.dart';
import 'package:medical_app/data/model/doctors_model.dart';
import 'package:medical_app/ui/widgets/btn.dart';

import 'package:provider/provider.dart';

class DetailsScreen extends StatelessWidget {
  int itemIndex;

  DetailsScreen({required this.itemIndex});
  //var bookingController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  DatePickerController _controller = DatePickerController();

  DateTime _selectedValue = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Consumer<MedicalProvider>(
        builder: (context, model, child) => Scaffold(
              backgroundColor: mainColor,
              appBar: AppBar(
                iconTheme: IconThemeData(color: sColor),
                backgroundColor: mainColor,
                elevation: 0,
                title: Text(
                  "Dr/${model.doctors[itemIndex].name}",
                  style: TextStyle(color: sColor, fontSize: 20),
                ),
              ),
              body:
                  buildDetailsScreen(model.doctors[itemIndex], context, model),
            ));
  }

  Widget buildDetailsScreen(
      DoctorsModel model, context, MedicalProvider bookingProvider) {
    return SingleChildScrollView(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                Container(
                    width: double.infinity,
                    height: 250,
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10.0)),
                      image: DecorationImage(
                        image: model.image != null
                            ? NetworkImage('${model.image}')
                            : const NetworkImage(
                                "https://image.freepik.com/free-photo/christmas-tree-digitally-generated-digital-festivity-stethoscope_1134-737.jpg"),
                        fit: BoxFit.cover,
                      ),
                    )),
                Align(
                  alignment: AlignmentDirectional.bottomCenter,
                  child: Container(
                    color: Colors.black38,
                    width: double.infinity,
                    height: 50,
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Dr/${model.name}",
                              style: const TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontFamily: 'Asma',
                              )),
                          Spacer(),
                          RatingBar.builder(
                            itemSize: 20.0,
                            initialRating: 3,
                            minRating: 1,
                            direction: Axis.horizontal,
                            allowHalfRating: true,
                            itemCount: 5,
                            itemPadding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
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
                  ),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Specialization :  ${model.category}",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontFamily: 'Asma',
                    )),
                SizedBox(
                  height: 15,
                ),
                Text("location :  ${model.location}",
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontFamily: 'Asma',
                    )),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            DatePicker(
              DateTime.now(),
              controller: _controller,
              selectionColor: sColor,
              selectedTextColor: Colors.white,
              onDateChange: (date) {
                _selectedValue = date;
              },
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                child: defaultButton(
                    text: "Book",
                    onTap: () {

                      bookingProvider.booking(
                          docName: model.name,
                          location: model.location,
                          dateTime: _selectedValue.toString());
                      print(_selectedValue.toString());

                    //  bookingProvider.appointments.clear();



                    }),
              ),
            )
          ],
        ),
      ),
    );
  }




}
