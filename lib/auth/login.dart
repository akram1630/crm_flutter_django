import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';

import '../components.dart';

class login extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView( // to not let the keyboard makes error on screen
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'LOGIN',
                      style: null
                  ),
                  Text(
                    'Login now to browse our hot offers',
                    style: null
                  ),
                  SizedBox(height: 5,),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: (value){
                      if(value!.isEmpty)
                        return 'please enter ur email address';
                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('EMAIL ADDRESS'),
                        prefix: Icon(Icons.email_outlined)
                    ),
                  ),
                  SizedBox(height: 15,),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: passwordController,
                    validator: (value){
                      if(value!.isEmpty)
                        return 'password is too short';
                      return null;
                    },

                    onFieldSubmitted: (str){
                      //print('$str\n\n\n');
                      if(formKey.currentState!.validate()){

                      }
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('password'),
                      prefix: Icon(Icons.lock_outline),
                      suffix: IconButton(
                          onPressed: (){

                            } ,
                          icon: Icon(Icons.remove_red_eye)
                      ),
                    ),
                  ),
                  SizedBox(height: 15,),
                  ConditionalBuilder(
                    condition: true,
                    fallback: (context)=> Center(child: CircularProgressIndicator()),
                    builder: (context)=> defaultButton(
                      radius: 10,
                      function: (){
                        if(formKey.currentState!.validate()){

                        }
                      },
                      text: 'LOGIN' , isUppercase: true,
                    ),
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Don\'t have an account?'),
                      //Spacer(),
                      SizedBox(width: 10,),
                      TextButton(
                          onPressed: (){
                            //navigateAndFinish(context, shopRegisterScreen());
                          }, child: Text('REGISTRE'))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
