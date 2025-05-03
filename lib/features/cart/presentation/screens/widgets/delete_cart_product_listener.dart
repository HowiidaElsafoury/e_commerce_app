import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utilis/app_dialogues.dart';
import '../../cubits/cart_cubit/cart_cubit.dart';
import '../../cubits/cubit/cart_functions_cubit.dart';

class DeleteCartDataListener extends StatelessWidget {
  const DeleteCartDataListener({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartFunctionsCubit, CartFunctionsState>(
      listenWhen: (previous, current) {
        if (current is CartDeleteLoading ||
            current is CartDeleteFailure ||
            current is CartDeleteSuccess) {
          if (previous is CartDeleteLoading && current is! CartDeleteLoading) {
            Navigator.pop(context);
          }
          return true;
        } else {
          return false;
        }
      },
      listener: (context, state) {
        if (state is CartDeleteLoading) {
          AppDialogs.showLoading(context: context);
        } else if (state is CartDeleteFailure) {
          AppDialogs.showErrorDialog(
              context: context, errorMassage: state.message);
        } else if (state is CartDeleteSuccess) {
          context.read<CartCubit>().getCartData();
        }
      },
      child: const SizedBox(),
    );
  }
}
