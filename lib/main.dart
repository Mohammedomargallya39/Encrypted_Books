import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/modules/login_screens/cubit/cubit.dart';
import 'package:social/lib/modules/login_screens/login_screen.dart';
import 'package:social/lib/modules/onboarding_screen/on_boarding_screen.dart';
import 'package:social/lib/modules/user_screens/user_home_screen/user_drawer.dart';
import 'package:social/lib/shared/bloc_observer.dart';
import 'package:social/lib/shared/network/shared/dio_ocr.dart';
import 'package:social/lib/shared/styles/themes.dart';
import 'lib/modules/admin_screens/admin_home_screen/admin_drawer.dart';
import 'lib/shared/components/constants.dart';
import 'lib/shared/cubit/cubit.dart';
import 'lib/shared/cubit/states.dart';
import 'lib/shared/network/local/cache_helper.dart';
import 'lib/shared/network/shared/dio_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  DioHelper.init();
  DioOcr.init();

  bool isDark = CacheHelper.getData(key: 'isDark') == true;
  Widget? widget;
  bool onBoarding = CacheHelper.getData(key: 'onBoarding') == true;
  isAdmin = CacheHelper.getData(key: 'isAdmin') == true;
  token = CacheHelper.getData(key: 'token');
  if (onBoarding == true) {
    if (token != null) {
      if (isAdmin!) {
        widget = AdminDrawerScreen();
      } else {
        widget = UserDrawerScreen();
      }
    } else
      widget = LoginScreen();
  } else {
    widget = onBoardingScreen();
  }
  print('token is ---------------------------------->${token}');

  runApp(MyApp(
    isDark: isDark,
    startWidget: widget,
  ));
}
class MyApp extends StatelessWidget {
  final bool? isDark;
  final Widget startWidget;

  const MyApp({Key? key, this.isDark, required this.startWidget})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) =>
                UserLoginCubit()
        ),
        BlocProvider(
          create: (BuildContext context) =>
              ThemeCubit()..changeTheme(fromShared: isDark),
        ),
        BlocProvider(
          create: (BuildContext context) => AppCubit()..getUserData()..getAdminBooks(),
        ),
      ],
      child: BlocConsumer<ThemeCubit, ThemeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeCubit.get(context).darkTheme
                ? ThemeMode.dark
                : ThemeMode.light,
            home: startWidget,
          );
        },
      ),
    );
  }
}