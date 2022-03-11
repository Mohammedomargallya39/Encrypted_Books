import 'package:animated_button/animated_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/admin_drawer.dart';
import 'package:social/lib/shared/cubit/cubit.dart';
import 'package:social/lib/shared/cubit/states.dart';
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
  double height = 77,
  bool isUpperCase = true,
  double radius = 6.0,
  required Function() function,
  required String text,
  required BuildContext context,
  double fontSize = 16,
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
            fontSize: fontSize,
          ),
        textAlign: TextAlign.center,
        //textWidthBasis: TextWidthBasis.parent,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
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
  ValueChanged<String>? onChange,
  IconData? suffix,
  Function? suffixPressed,
   Function? validate,
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
    onChanged: onChange,
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

Widget ProfileScreen (
{
  required Function()? floatingActionButtonOnPressed,
  required Function()? imageOnPressed,
  required dynamic containerWidth,
  required dynamic containerHeight,
  required dynamic positionedWidth,
  required dynamic gestureDetectorWidth,
  required dynamic gestureDetectorHeight,
  required String profileImage,
  required dynamic sizedBoxHeight,
  required String id,
  required dynamic IdFontSize,
  required dynamic fontSize,
  required dynamic sizedBoxWidth,
  required String name,
  required dynamic cubitFontSize,
  required String email,
  required String phone,
  required String numberOfBooks,
  required String createdIn,
  required String updatedIn,
  required dynamic sizedBoxDataHeight,
})
{
  return Scaffold(
      floatingActionButton: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: floatingActionButtonOnPressed,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      body: Container(
        width: containerWidth,
        height: containerHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset('assets/images/main_top.png',
                width: positionedWidth,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset('assets/images/login_bottom.png',
                width: positionedWidth,),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(17.5,0,17.5,0),
              child: SingleChildScrollView(
                child: BlocConsumer<ThemeCubit,ThemeStates>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children:
                      <Widget>
                      [
                        Center(
                          child: GestureDetector(
                            child: SizedBox(
                              width:  gestureDetectorWidth,
                              height: gestureDetectorHeight,
                              child: Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children:[
                                  Center(
                                    child: CircleAvatar(
                                      radius: 111,
                                      backgroundImage:  NetworkImage(
                                          //'${AppCubit.get(context).homeModel!.pic}'
                                        profileImage
                                      ),
                                    ),
                                  ),
                                ] ,
                              ),
                            ),
                            onTap: imageOnPressed,
                          ),
                        ),
                        SizedBox(height: sizedBoxHeight,),
                        Center(
                          child: Text(
                            //AppCubit.get(context).homeModel!.email!.split('@').first,
                            id,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: IdFontSize,
                            ),
                          ),
                        ),
                        SizedBox(height: sizedBoxHeight,),
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(bottom:  BorderSide(color: Colors.grey),),
                          ),
                        ),
                        SizedBox(height: sizedBoxHeight,),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              Text('Name:',
                                style: TextStyle(
                                    fontSize: fontSize,
                                    fontWeight: FontWeight.bold),),
                              SizedBox(width: sizedBoxWidth,),
                              Expanded(
                                child: Text(
                                  //'${AppCubit.get(context).homeModel!.name}',
                                  name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: cubitFontSize,
                                      color: ThemeCubit.get(context).darkTheme?Colors.grey.shade300 :Colors.grey.shade800
                                  ),),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: sizedBoxDataHeight,),
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(bottom:  BorderSide(color: Colors.grey),),
                          ),
                        ),
                        SizedBox(height: sizedBoxDataHeight,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('E-mail:',
                                style: TextStyle(
                                    fontSize: fontSize,
                                    fontWeight: FontWeight.bold),),
                              SizedBox(width: sizedBoxWidth),
                              Expanded(
                                child: Text(
                                  //'${AppCubit.get(context).homeModel!.email}',
                                  email,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: cubitFontSize,
                                      color: ThemeCubit.get(context).darkTheme?Colors.grey.shade300 :Colors.grey.shade800
                                  ),),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: sizedBoxDataHeight,),
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(bottom:  BorderSide(color: Colors.grey),),
                          ),
                        ),
                        SizedBox(height: sizedBoxDataHeight,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Phone:',
                                style: TextStyle(
                                    fontSize: fontSize,
                                    fontWeight: FontWeight.bold),),
                              SizedBox(width: sizedBoxWidth),
                              Expanded(
                                child: Text(
                                  //'${AppCubit.get(context).homeModel!.phone}',
                                  phone,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: cubitFontSize,
                                      color: ThemeCubit.get(context).darkTheme?Colors.grey.shade300 :Colors.grey.shade800
                                  ),),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: sizedBoxDataHeight,),
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(bottom:  BorderSide(color: Colors.grey),),
                          ),
                        ),
                        SizedBox(height: sizedBoxDataHeight,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Number Of Your Books:',
                                style: TextStyle(
                                    fontSize: fontSize,
                                    fontWeight: FontWeight.bold),),
                              SizedBox(width: sizedBoxWidth),
                              Expanded(
                                child: Text(
                                  //'${AppCubit.get(context).homeModel!.books!.length}',
                                  numberOfBooks,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: cubitFontSize,
                                      color: ThemeCubit.get(context).darkTheme?Colors.grey.shade300 :Colors.grey.shade800
                                  ),),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: sizedBoxDataHeight,),
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(bottom:  BorderSide(color: Colors.grey),),
                          ),
                        ),
                        SizedBox(height: sizedBoxDataHeight,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Created In:',
                                style: TextStyle(
                                    fontSize: fontSize,
                                    fontWeight: FontWeight.bold),),
                              SizedBox(width: sizedBoxWidth),
                              Expanded(
                                child: Text(
                                  //'${AppCubit.get(context).homeModel!.createdAt!.substring(0,9)} || ${AppCubit.get(context).homeModel!.createdAt!.substring(11,18)}',
                                  createdIn,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: cubitFontSize,
                                      color: ThemeCubit.get(context).darkTheme?Colors.grey.shade300 :Colors.grey.shade800
                                  ),),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: sizedBoxDataHeight,),
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(bottom:  BorderSide(color: Colors.grey),),
                          ),
                        ),
                        SizedBox(height: sizedBoxDataHeight,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Text('Updated In:',
                                style: TextStyle(
                                    fontSize: fontSize,
                                    fontWeight: FontWeight.bold),),
                              SizedBox(width: sizedBoxWidth),
                              Expanded(
                                child: Text(
                                  //'${AppCubit.get(context).homeModel!.updatedAt!.substring(0,9)} || ${AppCubit.get(context).homeModel!.updatedAt!.substring(11,18)}',
                                  updatedIn,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      fontSize: fontSize,
                                      color: ThemeCubit.get(context).darkTheme?Colors.grey.shade300 :Colors.grey.shade800
                                  ),),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: sizedBoxDataHeight,),
                        Container(
                          decoration: const BoxDecoration(
                            border: Border(bottom:  BorderSide(color: Colors.grey),),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      )
  );
}

Widget ProfileImageDetails(
{
  required Function()? onPressed,
  required dynamic containerWidth,
  required dynamic containerHeight,
  required String image,
})
{
  return Scaffold(
    floatingActionButton: IconButton(icon:Icon(Icons.arrow_back_ios)
      ,onPressed: onPressed
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    body: GestureDetector(
      child: Container(
        width: containerWidth,
        height: containerHeight,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(child: Image(image: NetworkImage(
                // '${AppCubit.get(context).userModel!.image}'
              image
            ),
            ),
            ),
          ],
        ),
      ),
      onTap: onPressed,
    ),
  );
}

Widget StudentsList(
{
  required Function()? onPressed,
  required Function()? onTap,
  required dynamic width,
  required dynamic height,
  required dynamic padding,
  required int itemCount,
  required String image,
  required String name,
  required String id,
}
    )
{
  return Scaffold(
    floatingActionButton: IconButton(icon:Icon(Icons.arrow_back_ios)
      ,onPressed: onPressed
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
    body: Container(
      width: width,
      height: height,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset('assets/images/main_top.png',
              width: width * 0.35,),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.asset('assets/images/login_bottom.png',
              width: width * 0.4,),
          ),
          Positioned(
            top: height * 0.04,
            //left: 0,
            // bottom: 0,
            //right: 0,
            child: SvgPicture.asset('assets/images/admin_cover.svg',
              width: width * 0.3,
              height: height * 0.18,
              //color: Colors.blue.withOpacity(0.2),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
                0,
                height * 0.2,
                0,
                0
            ),
            child: AnimationLimiter(
              child: ListView.builder(
                padding: EdgeInsets.all(padding / 30),
                physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                itemCount: itemCount,
                itemBuilder: (BuildContext context,int index) {
                  indexStudent = index;
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    delay: Duration(milliseconds: 100),
                    child: SlideAnimation(
                      duration: Duration(milliseconds: 2500),
                      curve: Curves.fastLinearToSlowEaseIn,
                      verticalOffset: -250,
                      child: ScaleAnimation(
                        duration: Duration(milliseconds: 1500),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: Container(
                          child: InkWell(
                            child: Row(
                              children: <Widget>
                              [
                                Container(
                                  margin: const EdgeInsets.all(10),
                                  width: width * .18,
                                  height:height * .07,
                                  decoration:   BoxDecoration(shape: BoxShape.circle,
                                    image: DecorationImage(image:
                                    NetworkImage(image),
                                        fit: BoxFit.fill
                                    ),
                                  ),
                                ),
                                SizedBox(width: width * 0.001,),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children:  <Widget>
                                    [
                                      Text(name ,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold ,
                                          fontSize: width * 0.04,
                                          //    color: Colors.black,
                                        ),
                                      ),
                                      SizedBox(height:height * 0.0075,),
                                      Text(id,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold ,
                                          fontSize: width * 0.04,
                                          //  color: Colors.black,

                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const Spacer(),
                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                                  child: Icon(Icons.arrow_forward_ios,
                                    // color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            onTap: onTap
                          ) ,
                          margin: EdgeInsets.only(bottom: padding / 20),
                          height: padding / 4,
                          decoration: BoxDecoration(
                            color: ThemeCubit.get(context).darkTheme?Colors.grey.shade700:Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.1),
                                blurRadius: 40,
                                spreadRadius: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          )
        ],
      ),
    ),
  );
}
