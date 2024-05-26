// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {
  late String phone;
  late String name;
  late String email;
  late String uid;
  late String bio;
  late String imageprofile;
  late String imagecover;

  UserModel({
    required this.phone,
    required this.name,
    required this.email,
    required this.uid,
    required this.bio,
    required this.imageprofile,
    required this.imagecover,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    uid = json['uid'];
    bio = json['bio'];
    imageprofile = json['imageprofile'];
    imagecover = json['imagecover'];
  }

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'name': name,
      'phone': phone,
      'uid': uid,
      'bio': bio,
      'imageprofile': imageprofile,
      'imagecover': imagecover,
    };
  }

  // factory UserModel.fromSnapshot(
  //     DocumentSnapshot<Map<String, dynamic>> documnt) {
  //   final data = documnt.data()!;
  //   return UserModel(
  //     email: data['email'] ?? '',
  //     name: data['name'] ?? '',
  //     phone: data['phone'] ?? '',
  //     uid: documnt.id,
  //   );
  // }
}
