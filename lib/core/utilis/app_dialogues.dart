import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class AppDialogs {
  static Future<void> showLoading({
    required BuildContext context,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: Lottie.asset(
            "assets/animations/loading.json",
            height: 50.h,
            width: 20.w,
          ),
        );
      },
    );
  }

  static void showErrorDialog({
    required BuildContext context,
    required String errorMassage,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        icon: Lottie.asset("assets/animations/error_animation.json",
            height: 80.h),
        content: Text(
          textAlign: TextAlign.center,
          errorMassage,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        /************
                actions: [
                TextButton(
                onPressed: () {
                Navigator.of(context).pop();
                },
                child: Text(
                'Got it',
                style: AppFonts.font20BlackWeight400,
                ),
                ),
                ],
             ************/
      ),
    );
  }

  static void showSuccessDialog({
    required BuildContext context,
    required String message,
    VoidCallback? whenAnimationFinished,
  }) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        icon: Lottie.asset(
          "assets/animations/success_animation.json",
          height: 80.h,
          repeat: false,
          onLoaded: (composition) {
            Future.delayed(
              composition.duration,
              () {
                if (context.mounted) {
                  Navigator.of(context).pop();
                  if (whenAnimationFinished != null) {
                    whenAnimationFinished();
                  }
                }
              },
            );
          },
        ),
      ),
    );
  }

  static void hideDialog(BuildContext context) {
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    }
  }

  // static void logoutDialog({
  //   required BuildContext context,
  // }) {
  //   showDialog(
  //     context: context,
  //     builder: (context) => AlertDialog(
  //       backgroundColor: Colors.white,
  //       content: SizedBox(
  //         width: 240.w,
  //         height: 150.h,
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.center,
  //           children: [
  //             Text(
  //               "LOGOUT",
  //               style: AppFonts.font18BlackWeight500
  //                   .copyWith(fontWeight: FontWeight.w600),
  //             ),
  //             SizedBox(
  //               height: 5.h,
  //             ),
  //             Text(
  //               "Confirm logout!!",
  //               style: AppFonts.font16BlackWeight500
  //                   .copyWith(fontWeight: FontWeight.w400),
  //             ),
  //             Row(
  //               children: [
  //                 ElevatedButton(
  //                   style: ElevatedButton.styleFrom(
  //                     minimumSize: Size(20.w, 45.h),
  //                     backgroundColor: AppColors.kWhite,
  //                     shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(50.r),
  //                       side: BorderSide(
  //                         color: Colors.transparent,
  //                         width: 1.w,
  //                       ),
  //                     ),
  //                   ),
  //                   onPressed: () {},
  //                   child: Text(
  //                     textAlign: TextAlign.center,
  //                     "cancel",
  //                     style: AppFonts.font14GreyWeight400,
  //                   ),
  //                 ),
  //                 SizedBox(
  //                   width: 10.w,
  //                 ),
  //                 ElevatedButton(
  //                   style: ElevatedButton.styleFrom(
  //                     minimumSize: Size(20.w, 45.h),
  //                     backgroundColor: AppColors.kPink,
  //                     shape: RoundedRectangleBorder(
  //                       borderRadius: BorderRadius.circular(50.r),
  //                       side: BorderSide(
  //                         color: Colors.transparent,
  //                         width: 1.w,
  //                       ),
  //                     ),
  //                   ),
  //                   onPressed: () {},
  //                   child: Text(
  //                     textAlign: TextAlign.center,
  //                     "logout",
  //                     style: AppFonts.font15WhiteWeight500,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }
}
