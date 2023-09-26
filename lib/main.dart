import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/firebase_options.dart';
import 'package:social_app/layouts/home_layout/home_screen.dart';
import 'package:social_app/modules/login_screen/Login_Screen.dart';
import 'package:social_app/shared/BLOC_OBSERVER.dart';
import 'package:social_app/shared/constance/constance.dart';
import 'package:social_app/shared/network/local/cashe_helper.dart';
import 'package:social_app/shared/styles/ThemeData.dart';
import 'package:firebase_app_check/firebase_app_check.dart';
import 'layouts/home_layout/cupit/home_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // await FirebaseAppCheck.instance.activate(
  //   webRecaptchaSiteKey: 'recaptcha-v3-site-key',
  //   androidProvider: AndroidProvider.debug,
  //   appleProvider: AppleProvider.appAttest,
  // );
  Bloc.observer = MyBlocObserver();
  await CasheHelper.init();
  uId = CasheHelper.getData(key: 'uId');
  runApp(MyApp(uId));
}

class MyApp extends StatelessWidget {
  var uId;

  MyApp(this.uId);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getUserData()..getPosts(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: LightTheme,
        darkTheme: DarkTheme,
        //themeMode: ThemeMode.dark,
        home: openScreen(),
      ),
    );
  }


  Widget openScreen() {
    if (uId != null) {
      return const HomeScreen();
    } else {
      return LoginScreen();
    }
  }
}




