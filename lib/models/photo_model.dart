class Photo {
  Photo({
    required this.originalname,
    required this.filename,
    required this.location,
  });
  late final String originalname;
  late final String filename;
  late final String location;
  
  Photo.fromJson(Map<String, dynamic> json){
    originalname = json['originalname'];
    filename = json['filename'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['originalname'] = originalname;
    _data['filename'] = filename;
    _data['location'] = location;
    return _data;
  }

}