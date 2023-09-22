import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layouts/home_layout/cupit/home_cubit.dart';
import '../../../shared/components/components.dart';
import '../../../shared/styles/convert_font.dart';

class EditeProfileView extends StatelessWidget {
  const EditeProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var bioController = TextEditingController();
    var phoneController = TextEditingController();

    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var userModel = HomeCubit.get(context).userModel;
        var profileImage = HomeCubit.get(context).profileImage;
        var coverImage = HomeCubit.get(context).coverImage;
        // nameController.text = userModel!.name!;
        // bioController.text = userModel.bio!;
        // phoneController.text = userModel.phone!;

        return Scaffold(
          appBar:
              defaultAppBar(context: context, title: 'Edite Profile',
                  actions: [
            defaultButton(title: 'UPDATE',function: (){
              HomeCubit.get(context).updateUser(
                name: nameController.text == ''? userModel!.name! : nameController.text,
                phone: phoneController.text== ''? userModel!.phone! : phoneController.text,
                bio: bioController.text== ''? userModel!.bio! : bioController.text,);
            }),
            const SizedBox(
              width: 15,
            ),
          ]),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  if(state is UserUpdateLoadingState)
                     const LinearProgressIndicator(),
                  if(state is UserUpdateLoadingState)
                     const  SizedBox(height: 10,),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.28,
                    child: Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(5),
                                        topLeft: Radius.circular(5)),
                                    image: DecorationImage(
                                      image:coverImage == null
                                          ? NetworkImage('${userModel!.cover}')
                                          : FileImage(coverImage) as ImageProvider,
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 20,
                                  child: IconButton(
                                    onPressed: () {
                                      HomeCubit.get(context).getCoverImageFromDevice();
                                    },
                                    icon: const Icon(
                                      IconBroken.Camera,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Stack(
                          alignment: AlignmentDirectional.bottomEnd,
                          children: [
                            CircleAvatar(
                              radius: 63,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 60,
                                backgroundImage: profileImage == null
                                    ? NetworkImage('${userModel!.image}')
                                    : FileImage(profileImage) as ImageProvider,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                radius: 20,
                                child: IconButton(
                                  onPressed: () {
                                    HomeCubit.get(context)
                                        .getProfileImageFromDevice();
                                  },
                                  icon: const Icon(
                                    IconBroken.Camera,
                                    size: 16,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  if(HomeCubit.get(context).profileImage != null || HomeCubit.get(context).coverImage != null)
                    Row(
                    children: [
                      if(HomeCubit.get(context).profileImage != null)
                        Expanded(
                          child:
                       Column(
                         children: [
                              defaultButtonAbdAllah(
                              function: (){
                                HomeCubit.get(context).uploadProfileImage(
                                  name: nameController.text == ''? userModel!.name! : nameController.text,
                                  phone: phoneController.text== ''? userModel!.phone! : phoneController.text,
                                  bio: bioController.text== ''? userModel!.bio! : bioController.text,
                                );
                              },
                              text: 'upload Profile Image'
                              ),
                           if(state is UserUpdateLoadingState)
                                const SizedBox(
                             height: 5,
                           ),
                           if(state is UserUpdateLoadingState)
                              const LinearProgressIndicator(),

                         ],
                       ),
                       ),
                      const SizedBox(width: 5,),
                      if(HomeCubit.get(context).coverImage != null)
                         Expanded(
                          child:  Column(
                            children: [
                              defaultButtonAbdAllah(
                                  function: (){
                                    HomeCubit.get(context).uploadCoverImage(
                                      name: nameController.text == ''? userModel!.name! : nameController.text,
                                      phone: phoneController.text== ''? userModel!.phone! : phoneController.text,
                                      bio: bioController.text== ''? userModel!.bio! : bioController.text,);
                                  },
                                  text: 'upload Cover Cover'
                              ),
                              if(state is UserUpdateLoadingState)
                                 const SizedBox(
                                height: 5,
                              ),
                              if(state is UserUpdateLoadingState)
                                 const LinearProgressIndicator(),

                            ],
                          ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  defaultTextFormField(
                    hintText: userModel!.name!,
                      keyboardType: TextInputType.name,
                      label: 'Name',
                      iconData: IconBroken.User,
                      controller: nameController,
                      validationMessage: 'name must not be empty'),
                  const SizedBox(
                    height: 10,
                  ),

                  defaultTextFormField(
                    hintText: userModel.bio!,
                      keyboardType: TextInputType.text,
                      label: 'Bio',
                      iconData: IconBroken.Info_Circle,
                      controller: bioController,
                      validationMessage: 'Bio must not be empty'),
                  const SizedBox(
                    height: 10,
                  ),
                  defaultTextFormField(
                    hintText: userModel.phone!,
                      keyboardType: TextInputType.phone,
                      label: 'Phone',
                      iconData: IconBroken.Call,
                      controller: phoneController,
                      validationMessage: 'Phone must not be empty'),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
