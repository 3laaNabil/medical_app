class AppointmentModel {
  String? docName;
  String? uId;
  String? location;
  String? dateTime;

  AppointmentModel(this.docName, this.uId, this.location, this.dateTime);

  AppointmentModel.fromJson(Map<String, dynamic> json) {
    docName = json['docName'];
    uId = json['uId'];
    location = json['location'];
    dateTime = json['dateTime'];
  }

  Map<String, dynamic> toMap() {
    return {
      'docName': docName,
      'uId': uId,
      'location': location,
      'dateTime': dateTime,
    };
  }
}
