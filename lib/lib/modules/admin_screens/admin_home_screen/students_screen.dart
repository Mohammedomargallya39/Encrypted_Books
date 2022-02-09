import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social/lib/cubit/cubit.dart';
import 'package:social/lib/cubit/states.dart';
import 'package:social/lib/models/students_model.dart';
import 'package:social/lib/modules/admin_screens/admin_home_screen/student_details_screen.dart';
import 'package:social/lib/shared/components/components.dart';

class StudentsScreen extends StatelessWidget {
  const StudentsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: AppCubit.get(context).studentsModelWithOutAdmin != null,
          builder: (context) => Scaffold(
            appBar: AppBar(
              title: const Text(
                  'Students'),
              actions: [
                IconButton(
                  onPressed: (){},
                  icon: const Icon(Icons.search_outlined),
                ),
              ],
            ),
            body: ListView.separated(
                physics: const BouncingScrollPhysics(),
                itemBuilder:  (context,index) {
                 // AppCubit.get(context).indexStudent= index;
                  return InkWell(
                    child: studentsItem(StudentsModel(
                      name: AppCubit.get(context).studentsModelWithOutAdmin![index].name,
                      email: AppCubit.get(context).studentsModelWithOutAdmin![index].email!.split('@').first,
                      image: AppCubit.get(context).studentsModelWithOutAdmin![index].image,
                      sId: AppCubit.get(context).studentsModelWithOutAdmin![index].sId,

                    ) , context),
                    onTap: ()
                    {
                      navigateTo(context, StudentDetailsScreen(
                        StudentId: index,
                      ),
                      );
                    },
                  );
                },
                separatorBuilder:(context,index)=> Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 1.0,
                    width: double.infinity,
                    color: Colors.grey,
                  ),
                ),
                itemCount: AppCubit.get(context).studentsModelWithOutAdmin!.length
            ),
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }

  Widget studentsItem(StudentsModel studentsModel , context)
  {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: <Widget>
      [
        Container(
          margin: const EdgeInsets.all(10),
          width: size.width * .18,
          height:size.height * .07,
          decoration:   BoxDecoration(shape: BoxShape.circle,
            image: DecorationImage(image:
            NetworkImage(studentsModel.image!),
                fit: BoxFit.fill
            ),
          ),
        ),
         SizedBox(width: size.width * 0.001,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:  <Widget>
            [
              Text(studentsModel.name! ,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold ,
                  fontSize: 16 ,
                ),
              ),
              SizedBox(height: size.height * 0.0075,),
              Text(studentsModel.email!.split('@').first ,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontWeight: FontWeight.bold ,
                  fontSize: 16 ,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
          child: Icon(Icons.arrow_forward_ios),
        ),
      ],
    ) ;
  }
}

