import 'package:flutter/material.dart';

import '../../../../shared/styles/convert_font.dart';



class PostViewItem extends StatelessWidget {
  const PostViewItem({Key? key}) : super(key: key);

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
            children: [
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
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
                            const Icon(
                              Icons.check_circle,
                              color: Colors.blue,
                              size: 15,
                            )
                          ],
                        ),
                        Text(
                          'march 21, 2021 at 11:00 pm',
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
              Text('Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
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
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.18,
                width: MediaQuery.of(context).size.width,
                decoration:const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    image: DecorationImage(
                        image: NetworkImage(
                            'https://img.freepik.com/premium-photo/indoor-portrait-young-ginger-female-with-freckles-posing-pink-background_295783-16909.jpg'
                        ),fit: BoxFit.cover
                    )
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Row(
                  children: [
                    Expanded(
                      child: InkWell(
                        onTap: (){},
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            children: [
                              const  Icon(IconBroken.Heart,
                                size: 16,
                                color: Colors.red,
                              ),
                              const SizedBox(width: 5,),
                              Text('120',style: Theme.of(context).textTheme.bodySmall,)
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
                              Text('120 comments',style: Theme.of(context).textTheme.bodySmall,)
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
                            const CircleAvatar(
                              radius: 15,
                              backgroundImage: NetworkImage(
                                  'https://img.freepik.com/free-photo/happy-boy-little-cute-adorable-white-t-shirt-blue-jeans-pink_179666-322.jpg?w=996&t=st=1693699910~exp=1693700510~hmac=de9c296e4a707363e877f674d5bf55c45ed9a951c7efae0a6a56b4da8090ba24'),
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
                      onTap: (){},
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
