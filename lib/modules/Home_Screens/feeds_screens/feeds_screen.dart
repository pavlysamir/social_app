import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/layouts/home_layout/cupit/home_cubit.dart';

import 'feeds_views/post_view.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return ConditionalBuilder(
            condition: HomeCubit.get(context).posts.isNotEmpty && HomeCubit.get(context).userModel != null,
            builder: (context)=>SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Card(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      elevation: 5,
                      margin: const EdgeInsets.all(8),
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Image(
                            image: const NetworkImage(
                                'https://img.freepik.com/premium-photo/indoor-portrait-young-ginger-female-with-freckles-posing-pink-background_295783-16909.jpg'),
                            fit: BoxFit.cover,
                            height: MediaQuery.of(context).size.height * 0.29,
                            width: MediaQuery.of(context).size.width,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Communicate with friends',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      )),
                  ListView.builder(
                    itemBuilder: (context, index) => PostViewItem(
                        postModel: HomeCubit.get(context).posts[index],
                        index: index
                    ),
                    itemCount: HomeCubit.get(context).posts.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                  ),
                  const SizedBox(
                    height: 8,
                  )
                ],
              ),
            ),
            fallback: (context)=>const Center(
              child:  CircularProgressIndicator(),
            ));
      },
    );
  }
}
