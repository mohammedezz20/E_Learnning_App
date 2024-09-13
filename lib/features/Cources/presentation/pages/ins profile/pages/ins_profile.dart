import 'package:e_learning_app/features/Cources/presentation/pages/ins%20profile/widgets/ins_contact_widget.dart';
import 'package:e_learning_app/features/Cources/presentation/pages/ins%20profile/widgets/ins_reach.dart';
import 'package:e_learning_app/features/Cources/presentation/pages/ins%20profile/widgets/ins_tabs_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class InsProfile extends StatelessWidget {
  const InsProfile({super.key});
  @override
  Widget build(BuildContext context) {
    var screenSize =MediaQuery.of(context).size;
           return Scaffold(
            appBar: AppBar(
              title: Row(
                children: [
                  Text('', 
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey
                  ),
                  ),
                ],
              ),
               ),
            body:
            DefaultTabController(
              length: 3,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        SizedBox(
                          height:screenSize.height/4.5,
                          child: CircleAvatar(
                           backgroundImage: const AssetImage(
                               'assets/mentor-image.jpg'),
                         radius: screenSize.width/5,
                            ),
                              
                        ) ,
                      SizedBox(
                        height: 5.h,
                      ),
                      Column(
                   
                        children: [
                          Text('jonathan william',
                            style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                fontSize: 25.sp
                              ),
                          ),
                        SizedBox(height: 5.h,),
              
                          Text('senior flutter developer',
                              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                fontSize: 14.sp
                              ))
                        ],
                      ),
                      SizedBox(height: 20.h,),
                     const UserData(),
                      SizedBox(height: 20.h,),
                     const InsContactWidget(), 
                      SizedBox(height: 10.h,),
                    const AboutInsTabs()
                       ]
                  ),
              
                ),
              ),
            ),
          );
  
  }
}
