class PostModel {
  late String imagepost;
  late String name;
  late String text;
  late String time;
  late String uid;
  late String imageprof;
  PostModel({
    required this.imagepost,
    required this.name,
    required this.text,
    required this.time,
    required this.uid,
    required this.imageprof,
  });

  PostModel.fromJson(Map<String, dynamic> json) {
    imagepost = json['imagepost'];
    name = json['name'];
    text = json['text'];
    time = json['time'];
    uid = json['uid'];
    imageprof = json['imageprof'];
  }

  Map<String, dynamic> toMap() {
    return {
      'imagepost': imagepost,
      'name': name,
      'text': text,
      'time': time,
      'uid': uid,
      'imageprof': imageprof,
    };
  }
}
