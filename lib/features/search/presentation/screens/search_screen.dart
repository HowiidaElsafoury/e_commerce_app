import 'package:e_commerce_app/features/search/presentation/cubits/cubit/search_cubit.dart';
import 'package:e_commerce_app/features/search/presentation/screens/search_app_bar.dart';
import 'package:e_commerce_app/features/search/presentation/screens/widgets/search_product_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatelessWidget {
  static const String routeName = "search screen";
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppBarSearchWidget(),
        body: BlocBuilder<SearchCubit, SearchState>(
          builder: (context, state) {
            if (state is SearchLoading) {
              return const CircularProgressIndicator();
            } else if (state is SearchFailure) {
              return Text(state.message);
            } else if (state is SearchSuccess) {
              return SearchProductList(product: state.data);
            } else if (state is SearchEmpty) {
              return const Center(
                child: Text("Oops"),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
