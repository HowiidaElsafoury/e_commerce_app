import 'package:e_commerce_app/features/profile/presentation/screens/widgets/edit_profile_app_bar.dart';
import 'package:flutter/material.dart';

class EditProfileView extends StatelessWidget {
  static const String routeName = "edit profile view";
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: EditProfileAppBar(),
    );
  }
}
