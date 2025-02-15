import 'package:e_commerce_app/core/shared_widgets/product_card_with_list/product_card_list.dart';
import 'package:e_commerce_app/features/best_seller/presentation/screens/best_seller_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/best_seller_cubit.dart';

class BestSellerView extends StatefulWidget {
  static const String routeName = "best seller view";
  const BestSellerView({super.key});

  @override
  State<BestSellerView> createState() => _BestSellerViewState();
}

class _BestSellerViewState extends State<BestSellerView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<BestSellerCubit>().getBestSellerData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const BestSellerAppBar(),
        body: BlocBuilder<BestSellerCubit, BestSellerState>(
          builder: (context, state) {
            if (state is BestSellerloading) {
              return const CircularProgressIndicator();
            } else if (state is BestSellerFailure) {
              return Text(state.message);
            } else if (state is BestSellerSuccess) {
              return ProductCardList(product: state.data);
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
