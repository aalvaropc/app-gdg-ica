class Sponsor {
  String? name;
  String? image;
  String? desc;
  String? url;
  String? logo;

  Sponsor({this.name, this.image, this.desc, this.url, this.logo});

  Sponsor.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    desc = json['desc'];
    url = json['url'];
    logo = json['logo'];
  }

    // final Map<String, dynamic> data = new Map<String, dynamic>();
  //removing this
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = Map<String, dynamic>();
  //   data['name'] = name;
  //   data['image'] = image;
  //   data['desc'] = desc;
  //   data['url'] = url;
  //   data['logo'] = logo;
  //   return data;
  // }
    Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'name': name,
      'image': image,
      'desc': desc,
      'url': url,
      'logo': logo,
    };
    return data;
  }
}
