import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/shared_widgets/custom_button.dart';
import '../../../../../core/shared_widgets/custom_text_button.dart';
import '../../../../../core/shared_widgets/custom_text_form_field.dart';
import '../../../../../core/utilis/loading_dialogue.dart';
import '../../../../../core/utilis/validator.dart';
import '../cubits/login_cubit/login_cubit.dart';
import 'register_view.dart';

class LoginView extends StatefulWidget {
  static const String routeName = "Login View";
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController emailController;

  late TextEditingController passwordController;

  var formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Login",
          style: theme.textTheme.titleLarge,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Form(
          key: formKey,
          child: BlocListener<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginLoading) {
                showLoadingDialogue(context);
              } else if (state is LoginSuccess) {
                Navigator.pop(context);
                const snackBar = SnackBar(
                  content: Text("Login Success"),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else if (state is LoginFailure) {
                Navigator.pop(context);
                final snackBar = SnackBar(
                  content: Text(state.message),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  CustomTextFormField(
                      labelText: "Email",
                      hintText: "Enter your Email",
                      controller: emailController,
                      validator: Validator.validateEmail),
                  const SizedBox(
                    height: 25,
                  ),
                  CustomTextFormField(
                    labelText: "Password",
                    hintText: "Enter your password",
                    controller: passwordController,
                    validator: Validator.validatePassword,
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.check_box_outline_blank_rounded),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Remember me",
                            style: theme.textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      const CustomTextButton(
                        title: "Forget Password?",
                        color: Colors.black,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  CustomButton(
                    buttonText: "Login",
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        context.read<LoginCubit>().login(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: Text(
                        "Continue as  guest",
                        style: theme.textTheme.bodyLarge,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account?",
                        style: theme.textTheme.bodyLarge,
                      ),
                      CustomTextButton(
                          onTap: () => Navigator.pushNamed(
                              context, RegisterView.routeName),
                          title: "Sign Up",
                          color: theme.primaryColor)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
