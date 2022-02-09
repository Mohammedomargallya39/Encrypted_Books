import 'package:restart_app/restart_app.dart';
import 'package:social/lib/modules/login_screens/login_screen.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/network/local/cache_helper.dart';

void signOut (context)
{
  CacheHelper.removeData(key: 'token',).then((value)
  {
    if(value)
    {
      navigateAndEnd(context, LoginScreen(),);
      Restart.restartApp();
    }
  });
}
String? token = '';
bool? isAdmin = false;


