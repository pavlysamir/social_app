import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layouts/home_layout/cupit/home_cubit.dart';
import '../../../shared/components/components.dart';
import '../../../shared/styles/convert_font.dart';

class NewPostView extends StatelessWidget {
  const NewPostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var textController = TextEditingController();
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar:
              defaultAppBar(context: context, title: 'Create Post', actions: [
            defaultButton(
                title: 'POST',
                function: () {
                  var now = DateTime.now();
                  if (HomeCubit.get(context).postImage == null) {
                    HomeCubit.get(context).createPost(
                        dateTime: now.toString(), text: textController.text);
                  } else {
                    HomeCubit.get(context).uploadPostImage(
                        dateTime: now.toString(), text: textController.text);
                  }
                })
          ]),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Column(
                    children: [
                      if (state is CreatePostLoadingState)
                        const LinearProgressIndicator(),
                      if (state is CreatePostLoadingState)
                        const SizedBox(
                          height: 10,
                        ),
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 25,
                            backgroundImage: NetworkImage(
                                'https://img.freepik.com/free-photo/happy-boy-little-cute-adorable-white-t-shirt-blue-jeans-pink_179666-322.jpg?w=996&t=st=1693699910~exp=1693700510~hmac=de9c296e4a707363e877f674d5bf55c45ed9a951c7efae0a6a56b4da8090ba24'),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Row(
                              children: [
                                Text(
                                  'Bavly samir',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(height: 1.4),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 15,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height*0.8,
                    child: Column(
                      children: [
                        Expanded(
                          child: TextFormField(
                            onTapOutside: (event) {
                              FocusManager.instance.primaryFocus?.unfocus();
                            },
                            controller: textController,
                            decoration: const InputDecoration(
                                hintText: 'whats is on your mind...',
                                border: InputBorder.none),
                          ),
                        ),

                        const SizedBox(
                          height: 20,
                        ),
                        if (HomeCubit.get(context).postImage != null)
                          Stack(
                            alignment: AlignmentDirectional.topEnd,
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * 0.2,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(4.0),
                                    image: DecorationImage(
                                      image: FileImage(
                                          HomeCubit.get(context).postImage!),
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CircleAvatar(
                                  radius: 20,
                                  child: IconButton(
                                    onPressed: () {
                                      HomeCubit.get(context)
                                          .removePostImageFromDevice();
                                    },
                                    icon: const Icon(
                                      Icons.close,
                                      size: 16,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                  onPressed: () {
                                    HomeCubit.get(context)
                                        .getPostImageFromDevice();
                                  },
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(IconBroken.Image),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text('add photo'),
                                    ],
                                  )),
                            ),
                            Expanded(
                              child: TextButton(
                                onPressed: () {},
                                child: const Text('# tags'),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
