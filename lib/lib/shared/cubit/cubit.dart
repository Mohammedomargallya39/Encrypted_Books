import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/shared/cubit/states.dart';
import 'package:social/lib/shared/network/local/cache_helper.dart';

class ThemeCubit extends Cubit<ThemeStates>
{
  ThemeCubit() : super(AppInitialState());
  static ThemeCubit get(context) => BlocProvider.of(context);
  bool isDark = false ;
  ThemeMode appMode= ThemeMode.dark;
  void changeEncryptionMode({bool? fromShared})
  {
    if (fromShared != null)
    {
      isDark = fromShared;
    } else
    {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
      });
    }
  }

 void changeAppMode({bool? fromShared}) {
   if (fromShared != null)
   {
     isDark = fromShared;
     emit(ThemeModeSuccessState());
   } else
   {
     isDark = !isDark;
     CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value)
     {
       emit(ThemeModeState());
     });
   }
 }
}

