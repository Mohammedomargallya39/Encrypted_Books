// // import 'package:bloc/bloc.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'lib/layout/encrypted_home_screen.dart';
// // import 'lib/modules/login_screen/login_screen.dart';
// // import 'lib/modules/on_boarding_screen.dart';
// // import 'lib/shared/bloc_observer.dart';
// // import 'lib/shared/components/constants.dart';
// // import 'lib/shared/network/local/cache_helper.dart';
// // import 'lib/shared/network/shared/dio_helper.dart';
// // import 'lib/shared/styles/themes.dart';
// //
// //
// // void main() async{
// //   WidgetsFlutterBinding.ensureInitialized();
// //   DioHelper.init();
// //   Bloc.observer = MyBlocObserver();
// //   await CacheHelper.init();
// //   var onBoarding = CacheHelper.getData(key: 'onBoarding');
// //   late Widget widget;
// //   if(onBoarding != null){
// //     if(token != null) {
// //       widget = EncryptionLayout();
// //     } else {
// //       widget = EncryptionLoginScreen();
// //     }
// //
// //   }else{
// //     widget = OnBoardingScreen();
// //   }
// //   runApp(MyApp(onBoarding: onBoarding, startWidget: widget,));
// // }
// //
// // class MyApp extends StatelessWidget {
// //
// //
// //
// //   final onBoarding;
// //   final Widget startWidget;
// //   MyApp({required this.onBoarding, required this.startWidget});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       debugShowCheckedModeBanner: false,
// //       title: 'Book Encryption',
// //       themeMode: ThemeMode.light,
// //       theme: lightTheme,
// //       darkTheme: darkTheme,
// //       home: startWidget,
// //     );
// //   }
// // }
// import 'package:bloc/bloc.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:social/lib/layout/encrypted_home_screen.dart';
// import 'lib/modules/login_screen/login_screen.dart';
// import 'lib/modules/on_boarding_screen.dart';
// import 'lib/shared/bloc_observer.dart';
// import 'lib/shared/cubit/cubit.dart';
// import 'lib/shared/cubit/states.dart';
// import 'lib/shared/network/local/cache_helper.dart';
// import 'lib/shared/network/shared/dio_helper.dart';
// import 'lib/shared/styles/themes.dart';
//
// void main() async {
//
//   WidgetsFlutterBinding.ensureInitialized();
//
//   Bloc.observer = MyBlocObserver();
//   DioHelper.init();
//   await CacheHelper.init();
//
//   bool isDark = CacheHelper.getData(key: 'isDark') == true;
//   Widget widget ;
//   bool? onBoarding = CacheHelper.getData(key: 'onBoarding');
//   dynamic token = CacheHelper.getData(key: 'token');
//
//
//   if(onBoarding != null)
//   {
//     if(token != null) {
//       widget = EncryptionLayout();
//     } else {
//       widget = EncryptionLoginScreen();
//     }
//   }
//   else
//   {
//     widget = OnBoardingScreen();
//
//   }
//
//   runApp(MyApp(
//     isDark: isDark,
//     startWidget: widget ,
//   ));
//
// }
//
// class MyApp extends StatelessWidget
//
//
// {
//
//   final bool isDark ;
//   final Widget startWidget ;
//
//   MyApp({
//     required this.isDark ,
//     required this.startWidget
//   });
//
//
//   @override
//   Widget build(BuildContext context)
//   {
//
//
//     return
//       BlocProvider(
//
//         create: (BuildContext context) => AppCubit()..changeEncryptionMode(fromShared: isDark,),
//
//         child: BlocConsumer<AppCubit , AppStates>(
//           listener: (context , state) {},
//           builder:  (context , state)
//           {
//             return   MaterialApp(
//
//               debugShowCheckedModeBanner: false,
//               theme: lightTheme,
//               darkTheme: darkTheme ,
//               themeMode: AppCubit.get(context).isDark ? ThemeMode.dark : ThemeMode.light ,
//
//               home:startWidget,
//             );
//
//           }
//           ,
//         ),
//       );
//
//
//
//   }
//
//
//
// }
//
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









