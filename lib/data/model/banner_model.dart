class BannerModel {
  String? banner_img;

  BannerModel(this.banner_img);

  BannerModel.fromJson(Map<String, dynamic> json) {
    banner_img = json['banner_img'];
  }

  Map<String, dynamic> toMap() {
    return {
      'banner_img': banner_img,
    };
  }
}
