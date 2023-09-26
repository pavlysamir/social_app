import 'package:flutter/material.dart';
import 'package:social_app/layouts/home_layout/cupit/home_cubit.dart';
import 'package:social_app/models/post_model.dart';

import '../../../../shared/styles/convert_font.dart';



class PostViewItem extends StatelessWidget {
  PostViewItem({Key? key,required this.postModel,required this.index}) : super(key: key);
  PostModel postModel;
  int index;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5,
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                   CircleAvatar(
                    radius: 25,
                    backgroundImage: NetworkImage(
                        '${postModel.image}'),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '${postModel.name}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(height: 1.4),
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            const Icon(
                              Icons.check_circle,
                              color: Colors.blue,
                              size: 15,
                            )
                          ],
                        ),
                        Text(
                          '${postModel.dateTime}',
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(height: 1.4),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.more_horiz,
                        size: 20,
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Container(
                  width: double.infinity,
                  height: 1.0,
                  color: Colors.grey[300],
                ),
              ),
              Text('${postModel.text}',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  width: double.infinity,
                  child: Wrap(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: SizedBox(
                          height: 20,
                          child: MaterialButton(
                            padding: EdgeInsets.zero,
                            minWidth: 1,
                            onPressed: (){},
                            child: Text('#software',
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.blue),),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 5),
                        child: SizedBox(
                          height: 20,
                          child: MaterialButton(
                            padding: EdgeInsets.zero,
                            minWidth: 1,
                            onPressed: (){},
                            child: Text('#flutter',
                              style: Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.blue),),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ), //tags
              if(postModel.postImage != '')
                Padding(
                padding: const EdgeInsets.only(
                  top: 15
                ),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.18,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      image: DecorationImage(
                          image: NetworkImage(
                              '${postModel.image}'
                          ),fit: BoxFit.cover
                      )
                  ),
                ),
              ), // image
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){

                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              const  Icon(IconBroken.Heart,
                                size: 16,
                                color: Colors.red,
                              ),
                              const SizedBox(width: 5,),
                              Text('0',style: Theme.of(context).textTheme.bodySmall,)
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: (){},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const  Icon(IconBroken.Chat,
                                size: 16,
                                color: Colors.amber,
                              ),
                              const SizedBox(width: 5,),
                              Text('0 comments',style: Theme.of(context).textTheme.bodySmall,)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                height: 1.0,
                color: Colors.grey[300],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){},
                        child: Row(
                          children: [
                             CircleAvatar(
                              radius: 15,
                              backgroundImage: NetworkImage(
                                  '${HomeCubit.get(context).userModel!.image}'),
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Expanded(
                              child: Text(
                                'Write a comment....',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(height: 1.4),
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        HomeCubit.get(context).likePosts(HomeCubit.get(context).postsId[index]);
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const  Icon(IconBroken.Heart,
                              size: 16,
                              color: Colors.red,
                            ),
                            const SizedBox(width: 5,),
                            Text('Like',style: Theme.of(context).textTheme.bodySmall,)
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
