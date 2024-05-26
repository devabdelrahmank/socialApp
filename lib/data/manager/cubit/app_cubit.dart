// ignore_for_file: depend_on_referenced_packages

import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:silent_corner_social/core/utils/constant.dart';
import 'package:silent_corner_social/feature/messages/presentation/views/message_Screen.dart';
import 'package:silent_corner_social/feature/share_post/presentation/views/share_Screen.dart';
import 'package:silent_corner_social/model/messages_model.dart';
import 'package:silent_corner_social/model/user_model.dart';
import 'package:silent_corner_social/model/post_model.dart';
import 'package:silent_corner_social/data/manager/cubit/app_State.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../feature/home/presentation/views/home_screen.dart';
import '../../../feature/setting/presentation/views/setting_Screen.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppIntialState());
  static AppCubit get(context) => BlocProvider.of(context);

  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var bioController = TextEditingController();
  bool isShow = true;
  IconData icon = CupertinoIcons.eye;
  var picker = ImagePicker();
  File? profileImage;
  File? coverImage;
  File? postImage;
  String? urlImageprofile;
  String? urlImagecover;
  UserModel? modelUser;
  MessageModel? modelMessage;
  int index = 0;
  List<PostModel> posts = [];
  List<String> postId = [];
  List<int> numlikes = [];
  int currentIndex = 0;

  List<Widget> buildScreens = [
    const homeScreen(),
    const MessageScreen(),
    const ShareScreen(),
    const SettingScreen(),
  ];

  void changebottom(int index) {
    currentIndex = index;
    emit(HomeNavigationBar());
  }

  void signout() async {
    emit(LodingSignoutState());
    await FirebaseAuth.instance.signOut();
    emit(SuccessSignoutState());
  }

  void passwordShowSuffix() {
    isShow = !isShow;
    icon = isShow ? CupertinoIcons.eye : CupertinoIcons.eye_slash;
    emit(ShownoShowIconState());
  }

  Future<void> createUserWithEmailAndPassword() async {
    try {
      emit(LodingSignUpState());
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      )
          .then(
        (value) {
          addDetailsUserProfile();
          print('###@@@###@@@@####@@@@@###@@@@');
          print("uid=${FirebaseAuth.instance.currentUser!.uid}");
          verifyEmail();
          emit(SuccessSignUpState(id: FirebaseAuth.instance.currentUser!.uid));
        },
      );
    } on FirebaseAuthException catch (e) {
      _errorHandleCreateUser(e);
    } catch (e) {
      emit(ErrorSignUpState(error: e.toString()));
    }
  }

  void _errorHandleCreateUser(FirebaseAuthException e) {
    if (e.code == 'weak-password') {
      emit(ErrorSignUpState(error: 'The password provided is too weak.'));
    } else if (e.code == 'email-already-in-use') {
      emit(ErrorSignUpState(
          error: 'The account already exists for that email.'));
    } else {
      emit(ErrorSignUpState(error: 'Check your Email And Password'));
    }
  }

  Future<void> signInWithEmailAndPassword() async {
    try {
      emit(LodingLoginState());
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: emailController.text, password: passwordController.text)
          .then((value) {
        emit(SuccessLoginState());
      });
    } on FirebaseAuthException catch (e) {
      _errorHandleSignIn(e);
    } catch (e) {
      emit(ErrorLoginState(error: e.toString()));
    }
  }

  void _errorHandleSignIn(FirebaseAuthException e) {
    if (e.code == 'user-not-found') {
      emit(ErrorLoginState(error: 'No user found for that email.'));
    } else if (e.code == 'wrong-password') {
      emit(ErrorLoginState(error: 'Wrong password provided for that user.'));
    } else {
      emit(ErrorLoginState(error: 'Check your Email And Password'));
    }
  }

  Future<void> verifyEmail() async {
    await FirebaseAuth.instance.currentUser!.sendEmailVerification();
  }

  Future<void> resetPasswordWithLink() async {
    try {
      emit(LodingRestPasswordState());
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: emailController.text);
      emit(SuccessRestPasswordState());
    } catch (e) {
      emit(
        ErrorRestPasswordState(error: e.toString()),
      );
    }
  }

  Future<void> addDetailsUserProfile() async {
    try {
      UserModel model = UserModel(
        phone: phoneController.text,
        name: nameController.text,
        email: emailController.text,
        uid: FirebaseAuth.instance.currentUser!.uid,
        bio: bioController.text,
        imagecover:
            'https://media.istockphoto.com/id/1421485330/vector/abstract-cube-hexagon-shape-background.webp?s=2048x2048&w=is&k=20&c=TLDdiCf2qmD5h9dNBoog_228sC0OE71QL_qLGGzZTIg=',
        imageprofile:
            'https://media.istockphoto.com/id/1173458627/photo/abstract-digital-human-face.webp?s=2048x2048&w=is&k=20&c=RnI0sjhKgGggCnV8k2F14MVkqq58MMrxdYsadTJDigo=',
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(
            model.toMap(),
          );
      emit(SuccessaddDetailsUserProfileState());
    } on Exception catch (e) {
      emit(
        ErroraddDetailsUserProfileState(error: e.toString()),
      );
    }
  }

  Future<void> getgalleryimage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(SuccessGaleryImageState());
      //   getUserData();
    } else {
      emit(ErrorGaleryImageState());
      //   getUserData();
    }
  }

  Future<void> getCameraImage() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(SuccessCameraImageState());
      //  getUserData();
    } else {
      emit(ErrorCameraImageState());
      // getUserData();
    }
  }

  Future<void> getgalleryCover() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(SuccessGaleryCoverState());
      //    getUserData();
    } else {
      emit(ErrorGaleryCoverState());
      //   getUserData();
    }
  }

  Future<void> getCameraCover() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      coverImage = File(pickedFile.path);
      emit(SuccessCameraCoverState());
      //  getUserData();
    } else {
      emit(ErrorCameraCoverState());
      // getUserData();
    }
  }

  Future<void> uploadprofileimage({
    required String name,
    required String phone,
    required String bio,
    required String imagecover,
    required String imageprofile,
  }) async {
    emit(LoadingUploadProfileImageState());

    await FirebaseStorage.instance
        .ref()
        .child('userprofile/${Uri.file(profileImage!.path).pathSegments.last}')
        .putFile(profileImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(SuccessUploadProfileImageState());
        updateUserDetails(
          image: value,
          name: name,
          bio: bio,
          phone: phone,
          imagecover: imagecover,
          imageprofile: imageprofile,
        );
        print(value);
      }).catchError((e) {
        emit(
          ErrorUploadProfileImageState(error: e.toString()),
        );
      });
    }).catchError((e) {
      emit(
        ErrorUploadProfileImageState(error: e.toString()),
      );
    });
  }

  Future<void> uploadCoverimage({
    required String name,
    required String phone,
    required String bio,
    required String imagecover,
    required String imageprofile,
  }) async {
    emit(LoadingUploadCoverImageState());

    await FirebaseStorage.instance
        .ref()
        .child('userCover/${Uri.file(coverImage!.path).pathSegments.last}')
        .putFile(coverImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(SuccessUploadCoverImageState());
        updateUserDetails(
          cover: value,
          name: name,
          bio: bio,
          phone: phone,
          imagecover: imagecover,
          imageprofile: imageprofile,
        );
      }).catchError((e) {
        emit(
          ErrorUploadCoverImageState(error: e.toString()),
        );
      });
    }).catchError((e) {
      emit(
        ErrorUploadCoverImageState(error: e.toString()),
      );
    });
  }

  void updateUserDetails({
    String? cover,
    String? image,
    required String name,
    required String bio,
    required String phone,
    required String imagecover,
    required String imageprofile,
  }) async {
    emit(LoadingupdateUserState());

    await FirebaseFirestore.instance
        .collection('users')
        .doc(id ?? FirebaseAuth.instance.currentUser!.uid)
        .update({
      'phone': phoneController.text == '' ? phone : phoneController.text,
      'bio': bioController.text == '' ? bio : bioController.text,
      'imagecover': cover ?? imagecover,
      'name': nameController.text == '' ? name : nameController.text,
      'imageprofile': image ?? imageprofile,
    });
    emit(SuccessupdateUserState());
  }

  void getimagePostwithcamera() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      emit(SuccesspostImagewithcameraState());
    } else {
      emit(ErrorpostImagewithcameraState());
    }
  }

  void getimagePostwithgallery() async {
    final pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedFile != null) {
      postImage = File(pickedFile.path);
      emit(SuccesspostImagewithgalleryState());
    } else {
      emit(SuccesspostImagewithgalleryState());
    }
  }

  void closePostImage() {
    postImage = null;
    emit(ClosepostImageState());
  }

  void createPost(
      {required String text,
      String? imagepost,
      required String datatime,
      required String name,
      required String imageProfile}) async {
    try {
      emit(LoadingCreatePostState());
      PostModel postModel = PostModel(
        imageprof: imageProfile,
        imagepost: imagepost ?? '',
        name: name,
        text: text ?? '',
        time: datatime,
        uid: id ?? FirebaseAuth.instance.currentUser!.uid,
      );
      await FirebaseFirestore.instance
          .collection('posts')
          .add(postModel.toMap());
      emit(SuccessCreatePostState());
      closePostImage();
    } on Exception catch (e) {
      emit(
        ErrorCreatePostState(error: e.toString()),
      );
    }
  }

  void uploadPostImage(
      {required String text,
      required String datatime,
      required String name,
      required String imageProfile}) async {
    emit(LoadinguploadPostImageState());
    await FirebaseStorage.instance
        .ref()
        .child('postImage/${Uri.file(postImage!.path).pathSegments.last}')
        .putFile(postImage!)
        .then((value) {
      value.ref.getDownloadURL().then((value) {
        emit(SuccessuploadPostImageState());
        createPost(
          text: text,
          imagepost: value,
          datatime: datatime,
          name: name,
          imageProfile: imageProfile,
        );
      }).catchError((e) {
        emit(
          ErroruploadPostImageState(error: e.toString()),
        );
      });
    }).catchError((e) {
      emit(
        ErroruploadPostImageState(error: e.toString()),
      );
    });
  }

  Future<void> getpostdata() async {
    try {
      emit(LoadinggetPostdataState());
      posts.clear();
      await FirebaseFirestore.instance.collection('posts').get().then((value) {
        value.docs.forEach((element) {
          element.reference.collection('likes').get().then((value) {
            numlikes.add(value.docs.length);
            posts.add(PostModel.fromJson(element.data()));
            postId.add(element.id);
          });
        });
      });
      emit(SuccessgetPostdataState());
    } on Exception catch (e) {
      emit(
        ErrorgetPostdataState(error: e.toString()),
      );
    }
  }

  bool like = false;
  void likepost(String postId) async {
    try {
      like = !like; //!like;

      if (like) {
        FirebaseFirestore.instance
            .collection('posts')
            .doc(postId)
            .collection('likes')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .set({
          'like': true,
        });
      } else {
        dislikepost(postId);
      }

      emit(SuccesslikepostState());
    } on Exception catch (e) {
      emit(
        ErrorgetPostdataState(error: e.toString()),
      );
    }
  }

  Future<void> deletePost(String postId) async {
    try {
      await FirebaseFirestore.instance.collection('posts').doc(postId).delete();
      emit(SuccessDeletePostState());
    } on Exception catch (e) {
      emit(
        ErrorDeletePostState(
          error: e.toString(),
        ),
      );
    }
  }

  void dislikepost(String postId) {
    try {
      FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .collection('likes')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .delete();
      emit(SuccessdislikepostState());
    } on Exception catch (e) {
      emit(
        ErrordislikepostState(error: e.toString()),
      );
    }
  }

  List<UserModel> users = [];

  void getallusers() async {
    try {
      emit(LodinggetAlUsersState());
      users = [];
      var result = await FirebaseFirestore.instance.collection('users').get();

      for (var element in result.docs) {
        if (element.data()['uid'] != id) {
          users.add(UserModel.fromJson(element.data()));
        }
      }
      debugPrint('Length' + users.length.toString());

      emit(SuccessgetAlUsersState());
      print("@@@###Successgetalluser@@@###");
    } on Exception catch (e) {
      emit(
        ErrorgetAlUsersState(
          error: e.toString(),
        ),
      );
    }
  }

  Future<void> sendmessage({
    required String text,
    required String datatime,
    required String receiverId,
  }) async {
    modelMessage = MessageModel(
      text: text,
      dateTime: datatime,
      receiverId: receiverId,
      senderId: id ?? FirebaseAuth.instance.currentUser!.uid,
    );

    await FirebaseFirestore.instance
        .collection('users')
        .doc(id ?? FirebaseAuth.instance.currentUser!.uid)
        .collection('chat')
        .doc(receiverId)
        .collection('messages')
        .add(modelMessage!.toMap())
        .then((value) {
      emit(SuccessSendMessageState());
    }).catchError((e) {
      emit(ErrorSendMessageState(error: e.toString()));
    });

    await FirebaseFirestore.instance
        .collection('users')
        .doc(receiverId)
        .collection('chat')
        .doc(id ?? FirebaseAuth.instance.currentUser!.uid)
        .collection('messages')
        .add(modelMessage!.toMap())
        .then((value) {
      emit(SuccessSendMessageState());
    }).catchError((e) {
      emit(ErrorSendMessageState(error: e.toString()));
    });
  }

  List<MessageModel> messages = [];
  void getMessages({required String receverId}) {
    emit(LodingGetMessageState());
    FirebaseFirestore.instance
        .collection('users')
        .doc(modelUser!.uid)
        .collection('chat')
        .doc(receverId)
        .collection('messages')
        .orderBy('dateTime')
        .snapshots()
        .listen((event) {
      messages = [];
      event.docs.forEach((element) {
        messages.add(MessageModel.fromJson(element.data()));
        emit(SuccessGetMessageState());
        debugPrint('@@@###SuccessGetMessageState@@###');
      });
    }).onError((error) {
      emit(ErrorGetMessageState(error: error.toString()));
    });
  }

  void sendComment(String postId, String commentController) {
    try {
      emit(LodingcommentpostState());
      FirebaseFirestore.instance
          .collection('posts')
          .doc(postId)
          .collection('comments')
          .add(
        {
          "text": commentController,
        },
      );
      emit(SuccesscommentpostState());
    } on Exception catch (e) {
      emit(
        ErrorcommentpostState(error: e.toString()),
      );
    }
  }
}
