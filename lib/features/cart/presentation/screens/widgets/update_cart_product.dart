import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utilis/app_dialogues.dart';
import '../../cubits/cart_cubit/cart_cubit.dart';
import '../../cubits/cubit/cart_functions_cubit.dart';

class UpdateCartProductListener extends StatelessWidget {
  const UpdateCartProductListener({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<CartFunctionsCubit, CartFunctionsState>(
      listenWhen: (previous, current) {
        if (current is CartUpdateLoading ||
            current is CartUpdateFailure ||
            current is CartUpdateSuccess) {
          if (previous is CartUpdateLoading && current is! CartUpdateLoading) {
            Navigator.pop(context);
          }
          return true;
        } else {
          return false;
        }
      },
      listener: (context, state) {
        if (state is CartUpdateLoading) {
          AppDialogs.showLoading(context: context);
        } else if (state is CartUpdateFailure) {
          AppDialogs.showErrorDialog(
              context: context, errorMassage: state.message);
        } else if (state is CartUpdateSuccess) {
          context.read<CartCubit>().getCartData();
        }
      },
      child: const SizedBox(),
    );
  }
}
