import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/shared/cubit/states.dart';

class AppCubit extends Cubit<AppStates>
{

  AppCubit() : super(EncryptionAppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);


}

