class Data {
  int? id;

  String? imagePath;

  Data([
    this.imagePath,
  ]);
//named constructor
  Data.withId(
    this.id, [
    this.imagePath,
  ]);

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'imagePath': imagePath,
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }

  Data.fromMapObject(Map<String, dynamic> map) {
    // map id key value assign to id
    id = map['id'];
    imagePath = map['imagePath'];
  }
}
