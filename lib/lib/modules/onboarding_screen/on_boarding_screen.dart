import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:social/lib/modules/welcome_screen/welcome_screen.dart';
import 'package:social/lib/shared/components/components.dart';
import 'package:social/lib/shared/network/local/cache_helper.dart';

class OnBoardingModel{
  final String title;
  final String image;
  final String body;
  OnBoardingModel(
      this.title,
      this.image,
      this.body
      );
}
class onBoardingScreen extends StatelessWidget {
  bool isLast = false;
  var boardingController = PageController();
  List<OnBoardingModel> boarding = [
    OnBoardingModel(
        'E-Books',
        'assets/images/encryptedbook.png',
        'Many people turn to e-books because they find them very time-saving, as the individual uses the phone most of his time at a time when everyone is turning to technology.'),
    OnBoardingModel(
        'Encrypted Books',
        'assets/images/e-book.png',
        'And with this happening, books must be encrypted to preserve the ownership of the books for their owners and so that they are not stolen, we had to program this program.'),
  ];
   void submit(context){
     CacheHelper.saveData(key: 'onBoarding', value: true).then((value)
     {
       if(value)
       {
         navigateAndEnd(context, WelcomeScreen());
       }
     });
   }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: (){
                submit(context);
              },
              child: const Text('SKIP'))
        ],
        elevation: 0.0,
        backwardsCompatibility: false,
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index){
                  if(index == boarding.length - 1){
                    isLast = true ;
                  }else{
                    isLast = false;
                  }
                },
                controller: boardingController,
                itemCount: boarding.length,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context,index)=> BoardingItem(boarding[index]),
              ),
            ),
            const SizedBox(height: 30.0,),
            Row(
              children: [
                SmoothPageIndicator(
                    effect: const ExpandingDotsEffect(
                      activeDotColor: Colors.blue,
                      dotColor: Colors.grey,
                      dotWidth: 10.0,
                      dotHeight: 10.0,
                      expansionFactor: 3.5,
                      spacing: 5.0
                    ),
                    controller: boardingController,
                    count: boarding.length),
                const Spacer(),
                FloatingActionButton(
                  onPressed: (){
                    if(isLast == true){
                      submit(context);
                    }else{
                      boardingController.nextPage(duration: const Duration(milliseconds: 750), curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: const Icon(Icons.arrow_forward_ios),)
              ],
            ),
          ],
        ),
      ),
    );
  }
  
  Widget BoardingItem(OnBoardingModel model)=> Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(
        child:
        Image(
            image: AssetImage(model.image)
        ),
      ),
      Text(model.title,
        style: const TextStyle(
          fontSize: 24.0,
        ),),
      const SizedBox(height: 15.0,),
      Text(model.body,
        style: const TextStyle(
          fontSize: 14.0,
        ),),
      const SizedBox(height: 30.0,),
    ],
  );
}