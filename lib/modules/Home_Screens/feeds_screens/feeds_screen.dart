import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';

import 'feeds_views/post_view.dart';

class FeedsScreen extends StatelessWidget {
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics:const BouncingScrollPhysics(),
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
                    image: const NetworkImage('https://img.freepik.com/premium-photo/indoor-portrait-young-ginger-female-with-freckles-posing-pink-background_295783-16909.jpg'),
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
              itemBuilder: (context ,index)=> const PostViewItem(),
            itemCount: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),

          ),
         const SizedBox(
            height: 8,
          )
        ],
      ),
    );
  }
}
