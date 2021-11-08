import 'package:flutter/material.dart';
import 'package:flutter_remix/flutter_remix.dart';
import 'package:medical_app/business_logic/medical/provider.dart';
import 'package:medical_app/constants.dart';
import 'package:medical_app/ui/widgets/form_field.dart';
import 'package:provider/provider.dart';


class EditProfileScreen extends StatelessWidget {

  late var nameController = TextEditingController();
  late var phoneController = TextEditingController();
  late var addressController = TextEditingController();

  EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MedicalProvider>(
        builder: (context, model, child) => Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(backgroundColor: mainColor,

      title:  Text("Edit Profile",style: TextStyle(color:sColor),),
      elevation: 0,
        iconTheme: IconThemeData(color: sColor),

        actions: [IconButton(onPressed: (){}, icon: const Icon(FlutterRemix.upload_line))],
      ),

body: Padding(
        padding: const EdgeInsets.all(15.0),
    child: Center(
      child: Column(
      children: [
      defaultFormField(
      controller: nameController,
      type: TextInputType.text,
      validate: () {},
      label: "${ model.userModel!.name}",
      prefix: FlutterRemix.account_box_line),
      const SizedBox(
      height: 15.0,
      ),
      defaultFormField(
      controller: addressController,
      type: TextInputType.text,
      validate: () {},
      label: "${ model.userModel!.address}",
      prefix: FlutterRemix.information_line),
      const SizedBox(
      height: 15.0,
      ),
      defaultFormField(
      controller: phoneController,
      type: TextInputType.text,
      validate: () {},
      label:"${ model.userModel!.phone}",
      prefix: FlutterRemix.phone_line),
      ],
      ),
    ),


    )));
  }
}
