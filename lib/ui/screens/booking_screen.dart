import 'package:flutter/material.dart';
import 'package:medical_app/business_logic/medical/provider.dart';
import 'package:medical_app/ui/widgets/doctor_item.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MedicalProvider>(
        builder: (context, model, child) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    alignment: AlignmentDirectional.topStart,
                    child: Text(
                      "BOOKING :",
                      style: TextStyle(
                        fontSize: 36,
                        color: sColor,
                        fontFamily: 'Asmaa',
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, index) => InkWell(
                      onTap: (){},
                        child:
                            doctorItem(model.doctors[index], context, index)),
                    itemCount: model.doctors.length,
                  )
                ],
              ),
            ));
  }
}
