import 'package:flutter/material.dart';

class login extends StatelessWidget {
  const login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(1.0),
               child: Image(image: AssetImage('assets/logo.png')),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(child: Column(
                children: [
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      hintText: 'Enter Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(),
                    ),
                    onChanged:(String value){

                    },
                    validator: (value) {
                      return value!.isEmpty ? 'Please enter email' : null;
                    },
                  ),
SizedBox(height: 15,),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: TextFormField(
                      keyboardType: TextInputType.visiblePassword,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter Password',
                        prefixIcon: Icon(Icons.password),
                        border: OutlineInputBorder(),
                      ),
                      onChanged:(String value){

                      },
                      validator: (value) {
                        return value!.isEmpty ? 'Please enter email' : null;
                      },
                    ),
                  ),
                  SizedBox(height: 15,),
                  Column(
                    children: [
                      Text('Forgot Password',
                            style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: MaterialButton(
                      minWidth: double.infinity,
                      onPressed: (){},
                      child: Text('Login'),
                      color: Color(0xFFE51561),
                      textColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30,),
                  Column(
                    children: [
                      Text('Dont have an account?',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.black,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                      Text('Create Account',
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFFE51561),
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ],
                  ),

                ],
              )),
            )
          ],
        ),
      )
    );
  }
}
