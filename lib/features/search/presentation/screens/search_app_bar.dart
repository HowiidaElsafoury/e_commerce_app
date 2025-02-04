import 'package:e_commerce_app/core/app_constants/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utilis/debouncer.dart';
import '../cubits/cubit/search_cubit.dart';

class AppBarSearchWidget extends StatefulWidget implements PreferredSizeWidget {
  const AppBarSearchWidget({super.key});

  @override
  State<AppBarSearchWidget> createState() => _AppBarSearchWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight + 20.h);
}

class _AppBarSearchWidgetState extends State<AppBarSearchWidget> {
  late TextEditingController _searchController;
  final Debouncer _debouncer = Debouncer(milliseconds: 800);
  String lastQuery = "";

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  // debounce search query to avoid multiple requests
  // send search request only when user stop typing
  void _onSearchQueryChanged(String query) {
    _debouncer.run(() {
      if (query != lastQuery) {
        lastQuery = query;
        context.read<SearchCubit>().searchData(query);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.only(top: 16.0.h),
      child: TextField(
        controller: _searchController,
        onChanged: (value) => _onSearchQueryChanged(value),
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        autofocus: true,
        style: theme.textTheme.bodyMedium,
        decoration: InputDecoration(
          hintText: "What are you looking for?",
          hintStyle: theme.textTheme.bodySmall,
          prefixIcon: Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: IconButton(
              onPressed: () => Navigator.pop(context),
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              color: AppConstants.kprimaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
