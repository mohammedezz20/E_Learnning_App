import 'package:e_learning_app/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserData extends StatelessWidget {
  const UserData({super.key});

  @override
  Widget build(BuildContext context) {
    return    Row(children: [
                      Expanded(
                        child: Column(
                          children: [
                            Text('25',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontSize: 24.sp,
                              ),
                            ),
                            Text(S.of(context).courses,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                 fontSize: 15.sp,
                                ),
                            )
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            Text('2k',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                 fontSize: 24.sp,

                              ),
                            ),
                            Text(S.of(context).student,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                    fontSize: 15.sp,

                                ),
                            )
                            
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                             Text('200',
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                 fontSize: 22.sp,
                              ),
                            ),
                            Text(S.of(context).reviews,
                                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 15.sp,

                                ),
                            )
                          ],
                        ),
                      ),
                    ],);
  }
}