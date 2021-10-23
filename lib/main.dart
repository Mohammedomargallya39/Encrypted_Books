import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/modules/login_screen/login_screen.dart';
import 'package:social/lib/modules/onboarding_screen/on_boarding_screen.dart';
import 'package:social/lib/shared/bloc_observer.dart';
import 'package:social/lib/shared/styles/themes.dart';
import 'lib/shared/cubit/cubit.dart';
import 'lib/shared/cubit/states.dart';
import 'lib/shared/network/local/cache_helper.dart';
void main () async
{
  WidgetsFlutterBinding.ensureInitialized();

  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();

  bool isDark= CacheHelper.getData(key: 'isDark') == true;

  bool onBoarding= CacheHelper.getData(key: 'onBoarding') == true;
  //print(onBoarding);

  runApp(MyApp(
    isDark: isDark,
    onBoarding: onBoarding,
  ));
}

class MyApp extends StatelessWidget {

  final bool? isDark;
  final bool onBoarding;

   const MyApp({Key? key, this.isDark, required this.onBoarding}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (BuildContext context) => ThemeCubit()..changeAppMode(fromShared: isDark),),
        BlocProvider(create: (BuildContext context) => AppCubit(),),
        //BlocProvider(create: (BuildContext context) => EncryptionLoginCubit(),),
      ],
      child: BlocConsumer<ThemeCubit, ThemeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: ThemeCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light,
            home: onBoarding ? EncryptionLoginScreen() : OnBoardingScreen(),
          );
        },
      ),
    );
  }
}









