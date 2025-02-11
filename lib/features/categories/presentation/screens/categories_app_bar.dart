import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../layout/presentation/cubit/layout_cubit.dart';
import '../../../search/presentation/screens/search_screen.dart';

class CategoriesAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CategoriesAppBar({super.key});

  @override
  State<CategoriesAppBar> createState() => _CategoriesAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 25.h);
}

class _CategoriesAppBarState extends State<CategoriesAppBar> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return AppBar(
      title: Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    context.read<LayoutCubit>().navigateToPrevPage();
                  },
                  icon: const Icon(Icons.arrow_back_ios)),
              Expanded(
                child: SearchAnchor(
                  suggestionsBuilder: (context, controller) => [],
                  builder: (context, controller) {
                    return TextField(
                      controller: controller,
                      readOnly: true, // Prevents typing directly
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          SearchScreen.routeName,
                        );
                      },
                      decoration: InputDecoration(
                        hintText: "Search...",
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
