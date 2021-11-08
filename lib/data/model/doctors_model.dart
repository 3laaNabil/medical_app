class DoctorsModel {
  String? name;
  String? rate;
  String? location;
  String? image;
  String? doc_id;
  String? category;

  DoctorsModel(this.name, this.rate, this.location, this.image, this.doc_id,
      this.category);

  DoctorsModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    rate = json['rate'];
    location = json['location'];
    image = json['image'];
    doc_id = json['doc_id'];
    category = json['category'];
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'rate': rate,
      'location': location,
      'image': image,
      'doc_id': doc_id,
      'category': category,
    };
  }
}
