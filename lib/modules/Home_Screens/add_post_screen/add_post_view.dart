import 'package:flutter/material.dart';

import '../../../shared/components/components.dart';
import '../../../shared/styles/convert_font.dart';

class NewPostView extends StatelessWidget {
  const NewPostView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(
        context: context,
        title: 'Create Post',
          actions:[
            defaultButton(title:'POST' , function: (){})
          ]
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
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
            Expanded(
              child: TextFormField(
                onTapOutside: (event){
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                decoration:const InputDecoration(
                  hintText: 'whats is on your mind...',
                  border: InputBorder.none
                ),
              ),
            ),
            Row(

              children: [
                Expanded(
                  child: TextButton(
                      onPressed: (){},
                      child:const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(IconBroken.Image),
                          SizedBox(
                            width: 5,
                          ),
                          Text('add photo'),
                        ],
                      )
                  ),
                ),
                Expanded(
                  child: TextButton(
                      onPressed: (){},
                      child:const Text('# tags'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
