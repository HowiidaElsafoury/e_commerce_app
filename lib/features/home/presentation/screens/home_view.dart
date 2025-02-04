import 'package:e_commerce_app/features/home/presentation/screens/widgets/home_data_list.dart';
import 'package:e_commerce_app/features/search/presentation/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubits/home_cubits/home_cubit.dart';

class HomeView extends StatefulWidget {
  static String routeName = "home";
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getHomeData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Column(
            children: [
              SizedBox(
                height: 15.h,
              ),
              SearchAnchor(
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
            ],
          ),
          // title: TextButton(
          //     onPressed: () =>
          //         Navigator.pushNamed(context, SearchScreen.routeName),
          //     child: const Text("Search")),
        ),
        body: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoading) {
              return const CircularProgressIndicator();
            } else if (state is HomeFailure) {
              return Text(state.message);
            } else if (state is HomeSuccess) {
              return HomeDataList(data: state.homeDataEntity);
            } else {
              return const SizedBox();
            }
          },
        ));
  }
}
