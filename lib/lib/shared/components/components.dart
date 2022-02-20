import 'package:animated_button/animated_button.dart';
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
Widget defaultButton({
  // Color background = defaultColor,
  double width = double.infinity,
  dynamic color = defaultColor,
  dynamic textColor = Colors.white,
  double height = 66,
  bool isUpperCase = true,
  double radius = 6.0,
  required Function() function,
  required String text,
  required BuildContext context,
}) {
  return  Container(
    alignment: Alignment.center,
    width: width,
    height: height,
    child: AnimatedButton(
      onPressed: function,
      child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style: Theme.of(context).textTheme.button!.copyWith(
            color: textColor,
            fontSize: 16,
          )
      ),
      enabled: true,
      shadowDegree: ShadowDegree.light,
      color: color,
    ),
  );
}

Widget defaultTextButton({
  required Function()? onPressed,
  required String text,
  dynamic color = defaultColor,
  double fontSize = 16,
}) =>
    TextButton(
      onPressed: onPressed,
      child: Text(
        text.toUpperCase(),
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

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
    Size size = MediaQuery.of(context).size;
    return Dialog(
      elevation: 0,
      //backgroundColor: Color(0xffffffff),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: size.height * 0.015),
          Text(
            "${widget.title}",
            style: TextStyle(
              color: Colors.black,
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: size.height * 0.015),
          Text("${widget.description}",
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),),
          SizedBox(height: size.height * 0.015),
          Divider(
            height: size.height * 0.00222,
          ),
          Container(
            width: size.width,
            height: size.height * 0.05,
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
                    fontSize: 16.0,
                    color:Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Divider(
            height: size.height * 0.00222,
          ),
          Container(
            width: size.width,
            height: size.height * 0.05,
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