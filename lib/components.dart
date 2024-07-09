import "package:flutter/material.dart";

// parameters required or (optional-default)
Widget defaultButton(
        {double radius = 0,
        double width = double.infinity,
        Color color = Colors.blue,
        required void function(),
        required String text,
        bool isUppercase = true}) =>
    Container(
      width: width,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(radius)),
      child: MaterialButton(
        onPressed: function,
        child: Text(
          isUppercase ? text.toUpperCase() : text,
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
      ),
    );

Widget defaultFormField(
        {required TextEditingController controller,
        required TextInputType type,
        void onSubmit(String? h)?, // we will be back after dart revision
        //Function onChanged ,
        bool isPassword = false,
        required String? Function(String? h) validate, // ? can return null
        required void suffixPressed(), //no required should
        required String label,
        required void onChange(dynamic? h),
        required IconData prefix,
        IconData? suffix,
        required void onTap() //we will be back

        }) =>
    TextFormField(
      onTap: onTap,
      controller: controller, // the value entered
      validator: validate,
      obscureText: isPassword,
      decoration: InputDecoration(
          labelText: label, // value
          prefixIcon: Icon(prefix),
          suffix: suffix != null
              ? IconButton(
                  icon: Icon(suffix),
                  onPressed: suffixPressed,
                )
              : null,
          border: OutlineInputBorder() // shape of cadre form
          ),
      keyboardType: type, // type='email'
      onChanged: onChange,

      onFieldSubmitted: onSubmit,
/*onChanged: (String valeur){ // print and concatinat all char entered
                            print("Onchanged---> ${valeur}");
                          },
*/
    );

/*************************************/
Widget myDivider() => Padding(
      padding: EdgeInsetsDirectional.only(start: 20),
      child: Container(
        color: Colors.grey,
        width: double.infinity,
        height: 2,
      ),
    );

void navigateTo(context, widget) => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => widget,
    ));

void navigateAndFinish(context, widget) => Navigator.pushAndRemoveUntil(
    context, //// we can't return the previous screen when we click back
    MaterialPageRoute(
      // and it will get u out of the app (quitter)
      builder: (context) => widget,
    ),
    (route) => false // we shoud put false to not return
    );
/********************SHOP_APP*****************************/
// void showToast({required String text, required toastStates state}) {
//   Fluttertoast.showToast(
//       msg: text,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.BOTTOM,
//       timeInSecForIosWeb: 5,
//       backgroundColor: chooseToastColor(state),
//       textColor: Colors.white,
//       fontSize: 16.0);
// }

enum toastStates { SECCESS, ERROR, WARNING } // like a mini class

Color chooseToastColor(toastStates state) {
  Color color;
  switch (state) {
    case toastStates.SECCESS:
      color = Colors.green;
      break;
    case toastStates.ERROR:
      color = Colors.red;
      break;
    case toastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}

Container myTextForm(
    {required String label,
    Icon? icon,
    double? height,
    double? width,
    TextEditingController? controller,
    Color? color,
    int numOfForm = 0,
    bool obscureText = false,
    void Function()? prefixPressed}) {
  return Container(
    color: Colors.black.withOpacity(0.055),
    child: TextFormField(
      obscureText: obscureText,
      controller: controller,
      validator: (value) {
/* if (numOfForm == 1) //password
        if (value!.isEmpty || !isValidString(value))
          return 'password should have numbers & majuscule';
        if (numOfForm == 2) //Email
        if (value!.isEmpty || !isValidEmail(value))
          return 'please enter a valide email address';*/
        return null;
      },
      decoration: InputDecoration(
        prefixIcon: icon,
        suffix: numOfForm == 1
            ? IconButton(
                icon: Icon(obscureText
                    ? Icons.remove_red_eye_rounded
                    : Icons.remove_red_eye_outlined),
                onPressed: prefixPressed,
              )
            : null,
        border: OutlineInputBorder(),
        label: Text(label),
      ),
    ),
  );
}
