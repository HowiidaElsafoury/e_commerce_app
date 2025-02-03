import 'package:e_commerce_app/features/home/presentation/screens/widgets/home_data_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
            // title:SearchAnchor.bar(suggestionsBuilder: (context,searchController){
            //   final String input=searchController.text;
            //   return
            // }),
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
