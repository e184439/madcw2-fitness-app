import 'package:flutter/material.dart';


class myprofile extends StatelessWidget {
  const myprofile({Key? key}) : super(key: key);


  @override

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MY PROFILE'),
          backgroundColor: Color(0xff127157),
          toolbarHeight: 100.0, // double
          centerTitle: true,
        ),
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
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'First Name',
                    hintText: 'First Name',
                    prefixIcon: Icon(Icons.account_box_rounded),
                    border: OutlineInputBorder(),
                  ),
                  onChanged:(String value){

                  },
                  validator: (value) {
                    return value!.isEmpty ? 'Please enter First Name' : null;
                  },
                ),
                SizedBox(height: 15,),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: TextFormField(
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      labelText: 'Sur Name',
                      hintText: 'Sur Name',
                      prefixIcon: Icon(Icons.account_box_rounded),
                      border: OutlineInputBorder(),
                    ),
                    onChanged:(String value){
                    },
                    validator: (value) {
                      return value!.isEmpty ? 'Please enter Sur Name' : null;
                    },
                  ),
                ),
                SizedBox(height: 15,),

                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: MaterialButton(
                    minWidth: double.infinity,
                    onPressed: (){},
                    child: Text('Update'),
                    color: Color(0xFFE51561),
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(height: 30,),


              ],
            )),
          )
        ],
      ),
    );
  }
}