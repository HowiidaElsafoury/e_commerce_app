import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileAppBar extends StatefulWidget implements PreferredSizeWidget {
  const EditProfileAppBar({super.key});

  @override
  State<EditProfileAppBar> createState() => _EditProfileAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 25.h);
}

class _EditProfileAppBarState extends State<EditProfileAppBar> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AppBar(
      automaticallyImplyLeading: false,
      title: Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      " Edit Profile",
                      style: theme.textTheme.titleLarge,
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_outlined,
                        size: 32,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
