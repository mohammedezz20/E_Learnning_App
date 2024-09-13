import 'package:e_learning_app/features/Cources/presentation/pages/message%20instructor/pages/message_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InsContactWidget extends StatelessWidget {
  const InsContactWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return     Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: (){
                            },
                            child: Container(
                                height: 50.h,
                                padding: EdgeInsets.all(7.r),
                                decoration:BoxDecoration(
                                     borderRadius: BorderRadius.circular(20,),
                                    color: Colors.blue,
                                ),
                                child:
                                Row(
                                  mainAxisAlignment:MainAxisAlignment.center,
                                  children: [
                                    TextButton(
                                      onPressed: (){
                                          Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context){ 
                                          return  ChatScreen();
                                          }
                                      ),
                                    );
                                      },
                                      child: Text('Message',
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                         color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(width: 5,),
                                  ],
                                )
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w,),

                        Expanded(
                          child: GestureDetector(
                            onTap: (){},
                            child:  Container(
                                  height: 50.h,
                                  padding: const EdgeInsets.all(7),
                                  decoration:BoxDecoration(
                                       borderRadius: BorderRadius.circular(20,),
                                  border: Border.all(color: Colors.blue,width: 1.5)
                                  ),
                                  child:
                                  Row(
                                    mainAxisAlignment:MainAxisAlignment.center,
                                    children: [
                                      Text('Website',
                                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                        color: Colors.blue
                                        ),
                                      ),

                                    ],
                                  )
                              ),
                            
                          ),
                        ),
                      ],
                    );
  }
}