import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/admin_drawer.dart';
import 'package:social/lib/modules/user_screens/user_home_screen/user_drawer.dart';
import 'package:social/lib/modules/user_screens/user_profile_screen/user_details_photo_screen.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/styles/colors.dart';
import 'change_password.dart';

class UserSettingsScreen extends StatefulWidget {
  UserSettingsScreen({Key? key}) : super(key: key);

  @override
  State<UserSettingsScreen> createState() => _UserSettingsScreenState();
}

class _UserSettingsScreenState extends State<UserSettingsScreen> {
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();

  var phoneController = TextEditingController();

  var passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    nameController.text = AppCubit.get(context).userModel!.name;
    phoneController.text = AppCubit.get(context).userModel!.phone;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: AppCubit.get(context).userModel != null,
          builder: (context) => Scaffold(
              floatingActionButton: IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  navigateTo(
                      context,
                      AppCubit.get(context).userModel!.isAdmin
                          ? AdminDrawerScreen()
                          : UserDrawerScreen());
                },
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
              body: Container(
                width: size.width,
                height: size.height,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      child: Image.asset(
                        'assets/images/main_top.png',
                        width: size.width * 0.35,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image.asset(
                        'assets/images/login_bottom.png',
                        width: size.width * 0.4,
                      ),
                    ),
                    Form(
                      key: formKey,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(11, 17, 11, 11),
                          child: Column(
                            children: <Widget>[
                              Center(
                                child: GestureDetector(
                                  child: SizedBox(
                                    width: size.width * 0.5,
                                    height: size.height * 0.23,
                                    child: Stack(
                                      alignment: AlignmentDirectional.bottomEnd,
                                      children: [
                                        if (AppCubit.get(context).imageFile !=
                                            null)
                                          Center(
                                            child: CircleAvatar(
                                              radius: 111,
                                              backgroundImage: FileImage(
                                                  AppCubit.get(context)
                                                      .imageFile!),
                                            ),
                                          ),
                                        if (AppCubit.get(context).imageFile ==
                                            null)
                                          Center(
                                            child: CircleAvatar(
                                              radius: 111,
                                              backgroundImage: NetworkImage(
                                                  '${AppCubit.get(context).userModel!.image}'),
                                            ),
                                          ),
                                        IconButton(
                                          color: defaultColor,
                                          iconSize: 28,
                                          onPressed: () {
                                            AppCubit.get(context).selectImage();
                                          },
                                          icon: const Icon(Icons.camera_alt),
                                        ),
                                      ],
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (_) {
                                      return const UserDetailsPhotoDetails();
                                    }));
                                  },
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.019,
                              ),
                              Text(
                                AppCubit.get(context)
                                    .userModel!
                                    .email
                                    .split('@')
                                    .first,
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              SizedBox(
                                height: size.height * 0.04,
                              ),
                              defaultFormField(
                                type: TextInputType.name,
                                controller: nameController,
                                prefix: Icons.person,
                                text: 'Change Name',
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'write *${AppCubit.get(context).userModel!.name}* if you will not change your name';
                                  }
                                },
                                context: context,
                              ),
                              SizedBox(
                                height: size.height * 0.019,
                              ),
                              defaultFormField(
                                type: TextInputType.phone,
                                controller: phoneController,
                                prefix: Icons.phone,
                                text: 'Change Phone',
                                validate: (String value) {
                                  if (value.isEmpty) {
                                    return 'write *${AppCubit.get(context).userModel!.phone}* if you will not change your phone';
                                  }
                                },
                                context: context,
                              ),
                              SizedBox(
                                height: size.height * 0.05,
                              ),
                              defaultButton(
                                function: () {
                                  if (formKey.currentState!.validate()) {
                                    if (AppCubit.get(context).imageFile !=
                                        null) {
                                      AppCubit.get(context).updateUserImage(
                                          pic:
                                              AppCubit.get(context).imageFile!);
                                      showToast(
                                          message: 'Updated',
                                          state: ToastStates.SUCCESS);
                                    }
                                    if (AppCubit.get(context).imageFile ==
                                        null) {
                                      AppCubit.get(context).userModel!.image;
                                    }
                                    AppCubit.get(context).updateUserData(
                                        name: nameController.text,
                                        phone: phoneController.text,
                                        password: passwordController.text);
                                    showToast(
                                        message: 'Updated',
                                        state: ToastStates.SUCCESS);
                                  }
                                },
                                text: 'Update Profile Data',
                                context: context,
                                height: size.height * 0.08,
                                width: size.width,
                              ),
                              SizedBox(
                                height: size.height * 0.019,
                              ),
                              defaultTextButton(
                                onPressed: () {
                                  navigateTo(context, ChangePasswordScreen());
                                },
                                text: 'change password',
                                color: Colors.green,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
