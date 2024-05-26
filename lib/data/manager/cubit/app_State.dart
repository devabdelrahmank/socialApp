// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: file_names

abstract class AppState {}

class AppIntialState extends AppState {}

//! login

class LodingLoginState extends AppState {}

class SuccessLoginState extends AppState {}

class ErrorLoginState extends AppState {
  final String error;

  ErrorLoginState({required this.error});
}

class ShownoShowIconState extends AppState {}

//! signup

class LodingSignUpState extends AppState {}

class SuccessSignUpState extends AppState {
  final String id;
  SuccessSignUpState({
    required this.id,
  });
}

class ErrorSignUpState extends AppState {
  final String error;

  ErrorSignUpState({required this.error});
}

//! restPassword

class LodingRestPasswordState extends AppState {}

class SuccessRestPasswordState extends AppState {}

class ErrorRestPasswordState extends AppState {
  final String error;

  ErrorRestPasswordState({required this.error});
}

//! GaleryImage

class SuccessGaleryImageState extends AppState {}

class ErrorGaleryImageState extends AppState {}
//! CameraImage

class SuccessCameraImageState extends AppState {}

class ErrorCameraImageState extends AppState {}

//! GaleryCover

class SuccessGaleryCoverState extends AppState {}

class ErrorGaleryCoverState extends AppState {}
//! CameraCover

class SuccessCameraCoverState extends AppState {}

class ErrorCameraCoverState extends AppState {}

//! Signout

class LodingSignoutState extends AppState {}

class SuccessSignoutState extends AppState {}

//! addDetailsUserProfile

class SuccessaddDetailsUserProfileState extends AppState {}

class ErroraddDetailsUserProfileState extends AppState {
  final String error;

  ErroraddDetailsUserProfileState({required this.error});
}

//! getUserData

class LodinggetUserDataState extends AppState {}

class SuccessgetUserDataState extends AppState {}

class ErrorgetUserDataState extends AppState {
  final String error;

  ErrorgetUserDataState({required this.error});
}

//! UpdateUserDetails

class LoadingupdateUserState extends AppState {}

class SuccessupdateUserState extends AppState {}

class ErrorupdateUserState extends AppState {
  final String error;

  ErrorupdateUserState({required this.error});
}

class ChangeBottomNavState extends AppState {}

//! UploadProfileImage

class LoadingUploadProfileImageState extends AppState {}

class SuccessUploadProfileImageState extends AppState {}

class ErrorUploadProfileImageState extends AppState {
  final String error;

  ErrorUploadProfileImageState({required this.error});
}

//! UploadCoverImage

class LoadingUploadCoverImageState extends AppState {}

class SuccessUploadCoverImageState extends AppState {}

class ErrorUploadCoverImageState extends AppState {
  final String error;

  ErrorUploadCoverImageState({required this.error});
}

//! postImagewithcamera

class SuccesspostImagewithcameraState extends AppState {}

class ErrorpostImagewithcameraState extends AppState {}

//! postImagewithgallery

class SuccesspostImagewithgalleryState extends AppState {}

class ErrorpostImagewithgalleryState extends AppState {}

//! closepostImage

class ClosepostImageState extends AppState {}

//! createPost

class LoadingCreatePostState extends AppState {}

class SuccessCreatePostState extends AppState {}

class ErrorCreatePostState extends AppState {
  final String error;
  ErrorCreatePostState({required this.error});
}

//! uploadPostImage

class LoadinguploadPostImageState extends AppState {}

class SuccessuploadPostImageState extends AppState {}

class ErroruploadPostImageState extends AppState {
  final String error;
  ErroruploadPostImageState({required this.error});
}

//! getPostdata

class LoadinggetPostdataState extends AppState {}

class SuccessgetPostdataState extends AppState {}

class ErrorgetPostdataState extends AppState {
  final String error;
  ErrorgetPostdataState({required this.error});
}

//! likepost

class SuccesslikepostState extends AppState {}

class ErrorlikepostState extends AppState {
  final String error;
  ErrorlikepostState({required this.error});
}

//! dislikepost

class SuccessdislikepostState extends AppState {}

class ErrordislikepostState extends AppState {
  final String error;
  ErrordislikepostState({required this.error});
}

//! commentpost

class LodingcommentpostState extends AppState {}

class SuccesscommentpostState extends AppState {}

class ErrorcommentpostState extends AppState {
  final String error;
  ErrorcommentpostState({required this.error});
}

//! getAllUsers

class LodinggetAlUsersState extends AppState {}

class SuccessgetAlUsersState extends AppState {}

class ErrorgetAlUsersState extends AppState {
  final String error;
  ErrorgetAlUsersState({required this.error});
}

//! SendMessage

class LodingSendMessageState extends AppState {}

class SuccessSendMessageState extends AppState {}

class ErrorSendMessageState extends AppState {
  final String error;
  ErrorSendMessageState({required this.error});
}

//! GetMessage

class LodingGetMessageState extends AppState {}

class SuccessGetMessageState extends AppState {}

class ErrorGetMessageState extends AppState {
  final String error;
  ErrorGetMessageState({required this.error});
}

//! HomeNavigationBar

class HomeNavigationBar extends AppState {}

//! DeletePost

class SuccessDeletePostState extends AppState {}

class ErrorDeletePostState extends AppState {
  final String error;
  ErrorDeletePostState({required this.error});
}
