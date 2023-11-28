import 'package:bird_task/core/utils/app_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/config/routes.dart';
import '../../../../core/utils/cache.dart';
import '../../../../core/utils/colors.dart';
import '../../../../core/utils/constants.dart';
import '../manager/cubit.dart';
import '../manager/states.dart';
import '../widgets/form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});


  @override
  Widget build(BuildContext context) {
    bool isChecked = false;
    return BlocConsumer<LoginCubit, LoginStates>(listener: (context, state) {
      if (state is LoginSuccessState) {
        Navigator.pop(context);
        CacheHelper.saveData(key: "UserToken", value: state.loginEntity.accessToken);

        Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.home,
            arguments: state.loginEntity,
            (route) => false);
      } else if (state is LoginLoadingState) {
        showDialog(
          context: context,
          builder: (context) => const AlertDialog(
            backgroundColor: Colors.transparent,
            title: Center(
                child: CircularProgressIndicator(
                    color: AppColors.secondry,
                    )),
          ),
        );
      } else if (state is LoginErrorState) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text(AppStrings.error),
            content: Text(state.failures.message),
          ),
        );
      }
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: AppColors.primary,
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                   SizedBox(
                    height: 141.h,
                  ),
                  Center(
                    child: Column(
                      children: [
                        Text(
                          AppStrings.welcome,
                          style: TextStyle(
                              fontFamily: 'CircularStdB',
                              fontSize: 23.sp,
                              fontWeight: FontWeight.normal,
                              color: AppColors.mainText),
                        ),
                        SizedBox(
                          height: 7.h,
                        ),
                        Text(
                          AppStrings.continueToLogin,
                          style: TextStyle(
                              fontFamily: 'CircularStd',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.normal,
                              color: AppColors.mainText),
                        ),
                        SizedBox(
                          height: 32.h,
                        ),
                      ],
                    ),
                  ),
                  defaultFormField(
                      controller: LoginCubit.get(context).emailController,
                      label: AppStrings.emailAddress,
                      givenIcon:  Icon(
                        Icons.mail_outlined,
                        size: 20.sp,
                      ),),
                  SizedBox(
                    height: 21.h,
                  ),
                  defaultFormField(
                      controller: LoginCubit.get(context).passwordController,
                      label: AppStrings.password,
                      givenIcon:  Icon(
                        Icons.lock_outline,
                        size: 20.sp,
                      ),
                      isPassword: true),

                  Row(
                    children: [
                      Row(
                        children: [
                          Checkbox(
                              value: isChecked,
                              shape: const CircleBorder(),
                              onChanged: (val) {}),
                           Text(
                            AppStrings.rememberMe,
                            style: TextStyle(fontFamily:'CircularStd',fontSize: 13.sp, color: Colors.black),
                          )
                        ],
                      ),
                       SizedBox(
                        width: 150.w,
                      ),
                      InkWell(
                          onTap: () {},
                          child:  Text(
                            AppStrings.forgotPassword,
                            textAlign: TextAlign.end,
                            style: TextStyle(
                                fontFamily:'CircularStd',
                                fontSize: 14.sp,
                                fontWeight: FontWeight.normal,
                                color: AppColors.darkGrey),
                          )),
                    ],
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Column(
                    children: [
                      Card(
                        elevation: 8,
                        child: SizedBox(
                          height: 56.h,
                          width: 444.w,
                          child: ElevatedButton(
                            onPressed: () {
                              LoginCubit.get(context).login();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.purble,
                            ),
                            child:  Text(
                              AppStrings.login,
                              style: TextStyle(fontFamily:'CircularStdB',fontSize: 18.sp),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 27.h,
                      ),
                       Text(
                        AppStrings.or,
                        style: TextStyle(
                          fontFamily:'CircularStd',
                          fontSize: 14.sp,
                        ),
                      ),
                      SizedBox(
                        height: 26.h,
                      ),
                      Card(
                        elevation: 8,
                        child: SizedBox(
                          height: 56.h,
                          width: 444.w,
                          child: ElevatedButton.icon(
                            icon: Image.asset(AppImages.google,
                                width: 20.0, height: 20.0),
                            onPressed: () {
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            label: const Text(
                              AppStrings.googleLogin,
                              style: TextStyle(
                                  fontFamily:'CircularStdB',
                                  fontSize: 14,
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 26.h,
                      ),
                      Card(
                        elevation: 8,
                        child: SizedBox(

                          height: 56.h,
                          width: 444.w,
                          child: ElevatedButton.icon(
                            icon: Image.asset(AppImages.apple,
                                width: 22.0, height: 22.0),
                            onPressed: () {
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                            ),
                            label: const Text(
                              AppStrings.appleLogin,
                              style: TextStyle(
                                  fontFamily:'CircularStdB',
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 26.h,
                      ),
                      Card(
                        elevation: 8,
                        child: SizedBox(
                          height: 56.h,
                          width: 444.w,
                          child: ElevatedButton.icon(
                            icon: Image.asset(AppImages.facebook,
                                width: 18.0, height: 18.0),
                            onPressed: () {
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.blue,
                            ),
                            label:  Text(
                              AppStrings.facebookLogin,
                              style: TextStyle(
                                  fontFamily:'CircularStdB',
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.normal),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text(
                            AppStrings.accountAsk,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 14.sp,
                                color: Colors.black),
                          ),
                          TextButton(
                            onPressed: () {},
                            child:  Text(AppStrings.signUp,
                                style: TextStyle(
                                    color: AppColors.purble,
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.normal)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 31.9.h,
                      ),
                      SizedBox(
                        height: 100.h,
                        width: 200.w,
                        child: Column(
                          children: [
                             Text(
                              AppStrings.agreePolicy,
                              style: TextStyle(
                                fontSize: 9.sp,
                                color: const Color.fromRGBO(0, 0, 0, 0.66),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                 Text(
                                  AppStrings.patch,
                                  style: TextStyle(
                                    fontSize: 9.sp,
                                    color: const Color.fromRGBO(0, 0, 0, 0.66),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {},
                                  child:  Text(AppStrings.termsOfService,
                                      style: TextStyle(
                                          fontSize: 9.sp,
                                          color: const Color.fromRGBO(
                                              122, 95, 201, 0.66))),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ]),
          ),
        ),
      );
    });
  }
}
