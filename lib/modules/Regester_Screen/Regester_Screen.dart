import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layouts/home_layout/home_screen.dart';
import 'package:social_app/shared/components/components.dart';
import 'package:social_app/shared/cupit/register_cupit/registratuon_cubit.dart';

class RegesterScreen extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var phoneController = TextEditingController();
  var nameController = TextEditingController();

  RegesterScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistratuonCubit(),
      child: BlocConsumer<RegistratuonCubit, RegistratuonState>(
        listener: (context, state) {
          if(state is RegisterCreateUserSuccessState){
            NavigateAndFinish(context, HomeScreen());
          }
        },
        builder: (context, state) {
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
                          'REGISTER',
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
                          controller: nameController,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'please enter your name';
                            }
                          },
                          decoration:const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('User Name'),
                            prefixIcon: Icon(Icons.person),
                          ),
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
                          decoration:const InputDecoration(
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
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: RegistratuonCubit.get(context)!.obSurepass,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Password is to short';
                            }
                          },
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            label:const Text('Password'),
                            prefixIcon:const Icon(Icons.lock),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  RegistratuonCubit.get(context)!.isVisibleeye();
                                },
                                icon: Icon(
                                  RegistratuonCubit.get(context)!.iconData,
                                )),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          controller: phoneController,
                          onFieldSubmitted: (value) {
                            if (formKey.currentState!.validate()) {
                              RegistratuonCubit.get(context)!.userRegister(
                                name: nameController.text,
                                email: emailController.text,
                                password: passwordController.text,
                                phone: phoneController.text,
                              );
                            }
                          },
                          keyboardType: TextInputType.phone,
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return 'Please Enter your phone';
                            }
                          },
                          decoration:const InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text('Phone'),
                            prefixIcon: Icon(Icons.phone),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ConditionalBuilder(
                          condition: State is! RegisterLoadingState,
                          builder: (context) =>
                              SizedBox(
                                  width: double.infinity,
                                  height: 55,
                                  child: ElevatedButton(
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          RegistratuonCubit.get(context)!.userRegister(
                                            name: nameController.text,
                                            email: emailController.text,
                                            password: passwordController.text,
                                            phone: phoneController.text,
                                          );
                                        }
                                      },
                                      child: const Text('REGISTER'))),
                          fallback: (context) =>
                             const Center(child: CircularProgressIndicator()),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
