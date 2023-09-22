

import 'package:flutter/material.dart';
import 'package:icon_broken/icon_broken.dart';

import '../constance/constance.dart';


void navigateTo(context , widget){
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context)=> widget),
  );
}

void navigateAndFinish(context , widget){
  Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context)=> widget),
      (route) => false);
}

void showToast(
    {required String messege,
     required ColorStates colorToast,
    }
    ){
  // Fluttertoast.showToast(
  //     msg: messege,
  //     toastLength: Toast.LENGTH_LONG,
  //     gravity: ToastGravity.BOTTOM,
  //     timeInSecForIosWeb: 1,
  //     backgroundColor: shooseCloreToast(colorToast),
  //     textColor: Colors.white,
  //     fontSize: 16.0);
}

enum ColorStates{SUCCESS,ERROR,WARNING}

Color shooseCloreToast(ColorStates state)
{
  Color color;
  if(state == ColorStates.SUCCESS){
     color = Colors.green.withOpacity(0.8);
  }else  if(state == ColorStates.ERROR){
     color = Colors.red;
  }else {
    color = Colors.amber;
  }

  return color;
}

PreferredSizeWidget defaultAppBar ({required BuildContext context,String? title,List<Widget>? actions}){
  return AppBar(
    leading: IconButton(
      icon:const Icon(IconBroken.Arrow___Left_2),
      onPressed: () {Navigator.pop(context);  },
    ),
    titleSpacing: 0.0,
    title: Text(title!),
    actions: actions,
  );
}
Widget defaultButton({required String title,required Function() function}){
  return ElevatedButton(
      onPressed: function,
      style: ButtonStyle(
          backgroundColor:
          const MaterialStatePropertyAll<Color>(Colors.white),
          elevation: const MaterialStatePropertyAll<double>(0.0),
          overlayColor:
          MaterialStatePropertyAll<Color>(Colors.blue.shade100)),
      child: Text(
        title,
        style: TextStyle(
            color: primaryColore,
            fontWeight: FontWeight.bold),
      ));
}

Widget defaultTextFormField({
  TextEditingController? controller,
  required TextInputType keyboardType,
  String? validationMessage,
  required String label,
  required IconData iconData,
  required String hintText

}){
  return TextFormField(
    controller: controller,
    keyboardType: keyboardType,
    validator: (String? value) {
      if (value!.isEmpty) {
        return validationMessage;
      }
    },
    onChanged: (value){},
    onFieldSubmitted: (value){},
    enabled: true,
    onTapOutside: (event){
      FocusManager.instance.primaryFocus?.unfocus();
    },
    decoration:  InputDecoration(
      border:const OutlineInputBorder(),
      label: Text(label),
      floatingLabelBehavior: FloatingLabelBehavior.always,
      hintText: hintText,
      prefixIcon: Icon(iconData),
    ),
  );

}

Widget defaultButtonAbdAllah({
  double width = double.infinity,
  Color background = Colors.blue,
  bool isUpperCase = true,
  double radius = 3.0,
  required Function() function,
  required String text,
}) =>
    Container(
      width: width,
      height: 50.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          radius,
        ),
        color: background,
      ),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUpperCase ? text.toUpperCase() : text,
          style:const TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );

Widget defaultTextButtonAbdAllah({
  required Function() function,
  required String text,
}) =>
    TextButton(
      onPressed: function,
      child: Text(
        text.toUpperCase(),
      ),
    );

Widget defaultFormField({
  required TextEditingController controller,
  required TextInputType type,
  Function(String)? onSubmit,
  Function(String)? onChange,
  Function()? onTap,
  bool isPassword = false,
  required String? Function(String?)? validate,
  required String label,
  required IconData prefix,
  IconData? suffix,
  Function()? suffixPressed,
  bool isClickable = true,
}) =>
    TextFormField(
      controller: controller,
      keyboardType: type,
      obscureText: isPassword,
      enabled: isClickable,
      onFieldSubmitted: onSubmit,
      onChanged: onChange,
      onTap: onTap,
      validator: validate,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(
          prefix,
        ),
        suffixIcon: suffix != null
            ? IconButton(
          onPressed: suffixPressed,
          icon: Icon(
            suffix,
          ),
        )
            : null,
        border: const OutlineInputBorder(),
      ),
    );