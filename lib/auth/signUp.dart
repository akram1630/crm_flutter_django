import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../components.dart';


class signUp extends StatelessWidget {

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
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
                      'REGISTER',
                      style: null
                  ),
                  Text(
                    'Register now to browse our hot offers',
                    style: null,
                  ),
                  SizedBox(height: 5,),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: nameController,
                    validator: (value){
                      if(value!.isEmpty)
                        return 'please enter your name';
                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('User Name'),
                        prefix: Icon(Icons.person)
                    ),
                  ),
                  SizedBox(height: 5,),
                  TextFormField(
                    keyboardType: TextInputType.phone,
                    controller: phoneController,
                    validator: (value){
                      if(value!.isEmpty)
                        return 'please enter your phone number';
                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Phone Number'),
                        prefix: Icon(Icons.phone)
                    ),
                  ),
                  SizedBox(height: 5,),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    validator: (value){
                      if(value!.isEmpty)
                        return 'please enter your email';
                      return null;
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Email'),
                        prefix: Icon(Icons.email)
                    ),
                  ),
                  SizedBox(height: 5,),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: passwordController,
                    validator: (value){
                      if(value!.isEmpty)
                        return 'password is too short';
                      return null;
                    },

                    //obscureText: shopRegisterCubit.get(context).isPassword,
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
                        text: 'register' , isUppercase: true,
                        function: (){

                        }
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );

  }
}