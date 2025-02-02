import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/shared_widgets/custom_button.dart';
import '../../../../../core/shared_widgets/custom_text_button.dart';
import '../../../../../core/shared_widgets/custom_text_form_field.dart';
import '../../../../../core/utilis/app_dialogues.dart';
import '../../../../../core/utilis/enums/gender_enums.dart';
import '../../../../../core/utilis/validator.dart';
import '../../../data/models/requests/register_request_body.dart';
import '../cubits/register_cubit/register_cubit.dart';
import 'login_view.dart';

class RegisterView extends StatefulWidget {
  static const String routeName = "Register view";
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final formKey = GlobalKey<FormState>();
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController emailController;
  late final TextEditingController passwordController;
  late final TextEditingController confirmPasswordController;
  late final TextEditingController phoneNumberController;

  Gender gender = Gender.female;

  @override
  void initState() {
    firstNameController = TextEditingController();
    lastNameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    phoneNumberController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  void signUp() {
    if (formKey.currentState!.validate()) {
      context.read<RegisterCubit>().register(
            RegisterRequestBody(
                firstName: firstNameController.text,
                lastName: lastNameController.text,
                email: emailController.text,
                password: passwordController.text,
                rePassword: confirmPasswordController.text,
                phone: phoneNumberController.text,
                gender: gender.toStr().toLowerCase()),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: theme.textTheme.titleLarge,
        ),
      ),
      body: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoading) {
            AppDialogs.showLoading(context: context);
          } else if (state is RegisterSuccess) {
            AppDialogs.hideDialog(context);
            AppDialogs.showSuccessDialog(context: context, message: "");
          } else if (state is RegisterFailure) {
            AppDialogs.hideDialog(context);

            AppDialogs.showErrorDialog(
                context: context, errorMassage: state.message);
          }
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0.w),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          labelText: "First Name",
                          hintText: "Enter your First Name",
                          controller: firstNameController,
                          validator: (value) => Validator.validateName(value),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: CustomTextFormField(
                          labelText: "Last Name",
                          hintText: "Enter your Last Name",
                          controller: lastNameController,
                          validator: (value) => Validator.validateName(value),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextFormField(
                    labelText: "E-mail",
                    hintText: "Enter your E-mail",
                    controller: emailController,
                    validator: (value) => Validator.validateEmail(value),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          labelText: "password",
                          hintText: "Enter your password",
                          controller: passwordController,
                          validator: (value) =>
                              Validator.validatePassword(value),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: CustomTextFormField(
                          labelText: "confirm password",
                          hintText: "Enter your confirm password",
                          controller: confirmPasswordController,
                          validator: (value) =>
                              Validator.validatePasswordConfirmation(
                            password: passwordController.text,
                            confirmPassword: value,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  CustomTextFormField(
                    labelText: "Phone Number",
                    hintText: "Enter your phone number",
                    controller: phoneNumberController,
                    validator: (value) => Validator.validatePhoneNumber(value),
                  ),
                  24.verticalSpace,
                  Row(
                    children: [
                      Text("Gender", style: theme.textTheme.bodyLarge),
                      50.horizontalSpace,
                      Radio(
                          value: Gender.female,
                          groupValue: gender,
                          onChanged: (value) {
                            if (value != gender) {
                              gender = value!;
                              setState(() {});
                            }
                          }),
                      Text(
                        "Female",
                        style: theme.textTheme.bodyLarge,
                      ),
                      Radio(
                          value: Gender.male,
                          groupValue: gender,
                          onChanged: (value) {
                            if (value != gender) {
                              gender = value!;
                              setState(() {});
                            }
                          }),
                      Text(
                        "Male",
                        style: theme.textTheme.bodyLarge,
                      )
                    ],
                  ),
                  80.verticalSpace,
                  CustomButton(
                    buttonText: "Sign Up",
                    onTap: signUp,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: theme.textTheme.bodyLarge,
                      ),
                      CustomTextButton(
                          onTap: () => Navigator.pushReplacementNamed(
                              context, LoginView.routeName),
                          title: "Login",
                          color: theme.primaryColor),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
