import 'package:e_commerce_app/core/app_constants/app_constants.dart';
import 'package:e_commerce_app/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:e_commerce_app/features/profile/presentation/screens/edit_profile_view.dart';
import 'package:e_commerce_app/features/profile/presentation/screens/widgets/custom_list_tile.dart';
import 'package:e_commerce_app/features/profile/presentation/screens/widgets/custom_switch_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileView extends StatefulWidget {
  static const String routeName = "profile view";
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    super.initState();
    context.read<ProfileCubit>().GetLoggedUserData();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          "assets/images/Logo.png",
          height: 35.h,
          width: 95.w,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_outlined,
                size: 28,
              ),
            ),
          )
        ],
      ),
      body: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading) {
            return const CircularProgressIndicator();
          } else if (state is ProfileFailure) {
            return Text(state.message);
          } else if (state is ProfileSuccess) {
            return SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    ClipOval(
                      child: Image.asset(
                        "assets/images/Photo.png",
                        fit: BoxFit.cover,
                        height: 81.h,
                        width: 81.w,
                      ),
                    ),
                    8.verticalSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          state.profileUserEntity?.userEntity.firstName ?? "",
                          style: theme.textTheme.bodyLarge,
                        ),
                        5.horizontalSpace,
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, EditProfileView.routeName);
                          },
                          child: Image.asset("assets/images/edit_icon.png"),
                          // child: SvgPicture.asset(
                          //   "assets/images/edit_icon.png",
                          // ),
                        )
                      ],
                    ),
                    6.verticalSpace,
                    Text(
                      state.profileUserEntity?.userEntity.email ?? "",
                      style: theme.textTheme.bodyLarge!
                          .copyWith(color: AppConstants.kGreyColor),
                    ),
                    24.verticalSpace,
                    Padding(
                      padding: EdgeInsets.all(8.0.sp),
                      child: Column(
                        children: [
                          const CustomListTile(
                            leadingIcon: Icons.list_alt,
                            title: "My Orders",
                            trailingIcon: Icons.arrow_forward_ios,
                          ),
                          const CustomListTile(
                            leadingIcon: Icons.location_on_outlined,
                            title: "Saved Address",
                            trailingIcon: Icons.arrow_forward_ios,
                          ),
                          Divider(
                            color: Colors.black,
                            thickness: 0.5.h,
                          ),
                          const CustomSwitchTile(
                            title: "Notification",
                            trailingIcon: Icons.arrow_forward_ios,
                          ),
                          Divider(
                            color: Colors.black,
                            thickness: 0.5.h,
                          ),
                          CustomListTile(
                            leadingIcon: Icons.translate,
                            title: "Language",
                            subtitle: "English",
                            subtitleStyle: theme.textTheme.bodyMedium!
                                .copyWith(color: Colors.pink),
                          ),
                          const CustomListTile(
                            title: "About Us",
                            trailingIcon: Icons.arrow_forward_ios,
                          ),
                          const CustomListTile(
                            title: "Terms & Condition",
                            trailingIcon: Icons.arrow_forward_ios,
                          ),
                          Divider(
                            color: Colors.black,
                            thickness: 0.5.h,
                          ),
                          const CustomListTile(
                            leadingIcon: Icons.logout,
                            title: "Log out",
                            trailingIcon: Icons.logout,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      ),
    );
  }
}
