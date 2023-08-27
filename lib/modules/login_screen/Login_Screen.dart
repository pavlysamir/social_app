import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/modules/Regester_Screen/Regester_Screen.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/cupit/login_cupit/login_cubit.dart';
import 'package:social_app/shared/cupit/login_cupit/login_state.dart';
import 'package:social_app/shared/network/local/cashe_helper.dart';

import '../../layouts/home_layout/home_screen.dart';


class LoginScreen extends StatelessWidget {
  bool isVisible = false;
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
          if (state is LoginErrorState) {
            showToast(
                messege: '${state.error}',
                colorToast: ColorStates.ERROR);
          }
          else if(state is LoginSuccessState){

            CasheHelper.SaveData(key: 'uId', value: state.uId).then((value) {
              NavigateAndFinish(context, HomeScreen());
            });
          }
        },
        builder: (context, State) {
          return Scaffold(
              appBar: AppBar(),
              body: Form(
                key: formKey,
                child: Center(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'LOGIN',
                            style: TextStyle(fontSize: 35),
                          ),
                          const Text(
                            'login now to communicate with friends',
                            style: TextStyle(fontSize: 20, color: Colors.grey),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: emailController,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'please enter your email address';
                              }
                            },
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              label: Text('Email Address'),
                              prefixIcon: Icon(Icons.email),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: passwordController,
                            onFieldSubmitted: (value) {
                              if (formKey.currentState!.validate()) {
                                // LoginCubit.get(context)!.userLogin(
                                //     email: emailController.text,
                                //     password: passwordController.text);
                              }
                            },
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: LoginCubit.get(context)!.obSurepass,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return 'Password is to short';
                              }
                            },
                            decoration: InputDecoration(
                              border:const OutlineInputBorder(),
                              label:const Text('Password'),
                              prefixIcon:const Icon(Icons.lock),
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    LoginCubit.get(context)!.isVisibleeye();
                                  },
                                  icon: Icon(
                                    LoginCubit.get(context)!.iconData,
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          ConditionalBuilder(
                            condition: State is! LoginLoadingState,
                            builder: (context) =>
                                SizedBox(
                                    width: double.infinity,
                                    height: 55,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          if (formKey.currentState!
                                              .validate()) {
                                            LoginCubit.get(context)!.userLogin(
                                                email: emailController.text,
                                                password: passwordController
                                                    .text);
                                          }
                                        },
                                        child: const Text('LOGIN'))),
                            fallback: (context) =>
                            const Center(child: CircularProgressIndicator()),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const  Text(
                                'Don\'t have an account? ',
                                style: TextStyle(fontSize: 20),
                              ),
                              TextButton(
                                  onPressed: () {
                                    NavigateTo(context, RegesterScreen());
                                  },
                                  child:const Text(
                                    'REGISTER',
                                    style: TextStyle(fontSize: 20),
                                  )),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ));
        },
      ),
    );
  }
}
