import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthapp/core/router.dart';
import 'package:healthapp/presentation/splash_screen/splash_screen.dart';
import 'package:healthapp/shared/style/colors.dart';
import 'domain/bloc/splash_bloc/splash_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarIconBrightness: Brightness.light,
    statusBarColor: MCColors.blue, // status bar color
  ));
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiBlocProvider(
        providers: [
          BlocProvider<SplashBloc>(
            create: (BuildContext context) =>
                SplashBloc()..replaceSplashScreen(),
          ),
        ],
        child: SplashScreen(),
      ),
      onGenerateRoute: MCRouter.generateRoute,
    );
  }
}
