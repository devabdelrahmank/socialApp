import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:silent_corner_social/core/cache/shared.dart';
import 'package:silent_corner_social/core/function/flutter_toast.dart';
import 'package:silent_corner_social/core/utils/bloc_observer.dart';
import 'package:silent_corner_social/core/utils/constant.dart';
import 'package:silent_corner_social/data/manager/cubit/app_cubit.dart';
import 'package:silent_corner_social/feature/auth/presentation/views/widgets/Login_BackGround.dart';
import 'package:silent_corner_social/firebase_options.dart';
import 'package:silent_corner_social/layout/presentation/views/bottom_navigation_bar.dart';
import 'core/function/check_state_auth.dart';

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  debugPrint(message.data.toString());
  toastMessage(state: ToastStates.SUCCESS, text: message.data.toString());
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  CacheHelper().init();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  late Widget widget;
  checkStateAuth();
  // debugPrint('auth:${FirebaseAuth.instance.currentUser!.uid}');
  // debugPrint(id);
  FirebaseAuth.instance.currentUser == null
      ? widget = const LoginBackGround()
      : id == ''
          ? widget = const LoginBackGround()
          : widget = const BottomNavBar();

  var token = await FirebaseMessaging.instance.getToken();
  debugPrint(token);

  FirebaseMessaging.onMessage.listen((event) {
    debugPrint(event.data.toString());
  });

  FirebaseMessaging.onMessageOpenedApp.listen((event) {
    debugPrint(event.data.toString());
  });

  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);

  runApp(MyApp(widget: widget));
}

class MyApp extends StatelessWidget {
  final Widget widget;
  const MyApp({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()
        ..getallusers()
        ..getpostdata(),
      child: MaterialApp(
        title: 'Social App',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            color: Color.fromARGB(255, 246, 237, 225),
            iconTheme: IconThemeData(color: Colors.black),
            elevation: 0,
            titleTextStyle: TextStyle(
              color: Colors.black,
              fontSize: 22,
            ),
          ),
          scaffoldBackgroundColor: const Color.fromARGB(255, 246, 237, 225),
          iconTheme: const IconThemeData(color: Colors.black),
          useMaterial3: false,
        ),
        home: widget,
      ),
    );
  }
}
