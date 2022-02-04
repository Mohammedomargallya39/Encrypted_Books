import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social/lib/shared/cubit/cubit.dart';
import 'package:social/lib/shared/styles/colors.dart';

import 'constants.dart';



void navigateAndEnd(context,Widget widget){
  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>widget), (route) => false);


}

void navigateTo(context,Widget widget){
  Navigator.push(context, MaterialPageRoute(builder: (context)=>widget),);
}

void showToast({required String message, required ToastStates state}){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 5,
      backgroundColor: toastColor(state),
      textColor: Colors.white,
      fontSize: 16.0
  );
}

enum ToastStates{SUCCESS, ERROR , WARNING}

Color toastColor(ToastStates state){
  Color color ;
  switch (state){
    case ToastStates.SUCCESS:
      color = Colors.green;
    break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.yellow;
      break;
  }
  return color;
}


// Color toastColor(toastStates state){
//   Color color ;
//   switch (state){
//     case toastStates.SUCCESS:
//       color = Colors.green;
//       break;
//     case toastStates.ERROR:
//       color = Colors.white;
//       break;
//     case toastStates.WARNING:
//       color = Colors.yellow;
//       break;
//   }
//   return color;
// }

Widget defaultFormField({

  required String text,
  isPassword = false,
  required TextEditingController controller,
  required IconData prefix,
  IconData? suffix,
  Function? suffixPressed,
  required Function? validate,
  Function? onSubmit,
  required TextInputType type ,
  required context,
  int maxLines = 1,


})
{
  return TextFormField(
    maxLines: maxLines,
    controller: controller,
    obscureText: isPassword,
    // onFieldSubmitted: (value){
    //   return onSubmit!(value);
    // },
    validator:(value){
      return validate!(value);
    },
    keyboardType: type,

    style: TextStyle(
        color: ThemeCubit.get(context).darkTheme ? Colors.white: Colors.black,
        fontWeight: FontWeight.bold),

    decoration: InputDecoration(
      labelText: text,
      filled: false,
      labelStyle: const TextStyle(
          color:  defaultColor
      ),
      fillColor: defaultColor ,
      prefixIcon: Icon(prefix , color: defaultColor,),
      suffixIcon: IconButton(onPressed: (){
        return suffixPressed!();
        }, icon: Icon(suffix),color:defaultColor,),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0 ),
        borderSide: const BorderSide(color: defaultColor , width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0 ),
        borderSide: const BorderSide(color: defaultColor , width: 2),

      ),


    ),

  );




}


class SignOutAlertDialog extends StatefulWidget {
  const SignOutAlertDialog({
    Key? key,
    required this.title,
    required this.description,
  }) : super(key: key);

  final String title, description;

  @override
  _SignOutAlertDialogState createState() => _SignOutAlertDialogState();
}
class _SignOutAlertDialogState extends State<SignOutAlertDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      //backgroundColor: Color(0xffffffff),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 15),
          Text(
            "${widget.title}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 22),
          Text("${widget.description},",
            style: TextStyle(
              fontSize: 22.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),),
          SizedBox(height: 20),
          Divider(
            height: 1,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: InkWell(
              highlightColor: Colors.grey[200],
              onTap: ()
              {
                signOut(context);
              },
              child: Center(
                child: Text(
                  "Yes",
                  style: TextStyle(
                    fontSize: 18.0,
                    color:Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Divider(
            height: 1,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 50,
            child: InkWell(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
              highlightColor: Colors.grey[200],
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Center(
                child: Text(
                  "Cancel",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}



