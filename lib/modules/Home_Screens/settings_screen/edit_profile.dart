import 'package:flutter/material.dart';

import '../../../shared/constance/constance.dart';
import '../../../shared/styles/convert_font.dart';

class EditeProfileView extends StatelessWidget {
  const EditeProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(IconBroken.Arrow___Left_2),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Edite Profile'),
        titleSpacing: 0.0,
        actions: [
          ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor:
                      const MaterialStatePropertyAll<Color>(Colors.white),
                  elevation: const MaterialStatePropertyAll<double>(0.0),
                  overlayColor:
                      MaterialStatePropertyAll<Color>(Colors.blue.shade100)),
              child: Text(
                'UPDATE',
                style: TextStyle(
                    color: primaryColore,
                    fontWeight: FontWeight.bold),
              )),
          const SizedBox(
            width: 15,
          ),
        ],
      ),
    );
  }
}
