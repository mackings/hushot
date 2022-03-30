import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hushot_technologies/Views/Homescreen.dart';
import 'package:flutter_overlay_loader/flutter_overlay_loader.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {

TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();





  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
        
          child: Container(
            child: Column(
              children: [
        
                SizedBox(height: 170,),
        
                Text('Welcome back',style: TextStyle( fontFamily: 'montserrat',fontSize: 30,fontWeight:FontWeight.bold)),
                
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                     
                      SizedBox(height:10),
                      Text('Sign in to continue',style: TextStyle( fontFamily: 'montserrat',fontSize: 20,fontWeight:FontWeight.bold)),
                      
                    ],
                  ),
                ),
        
                SizedBox(height: 20,),
        
        
                 SizedBox(height: 20,),
        
                Center(
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width -30,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
        
        
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Enter Email',
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.email,color: Colors.white,),
                        hintStyle: TextStyle(fontFamily: 'montserrat'),
                      ),
                      ),
                    ),
                  ),
        
                  
                ),
        
                 SizedBox(height: 20,),
        
              
        
                Center(
                  child: Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width -30,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      borderRadius: BorderRadius.circular(10),
                    ),
        
        
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter Password',
                        border: InputBorder.none,
                        suffixIcon: Icon(Icons.visibility_off,color: Colors.white,),
                        hintStyle: TextStyle(fontFamily: 'montserrat'),
                      ),
                      ),
                    ),
                  ),
        
                  
                ),

                 SizedBox(height: 20,),
        
                Center(
                  child: GestureDetector(
                    onTap: (){
                     
                      Loader.show(context,
                      isBottomBarOverlay: true,
                      overlayColor: Colors.black,
                      
                      progressIndicator: const CircularProgressIndicator(
                        backgroundColor: Colors.black,
                      ),
                      );

                      Future.delayed(Duration(seconds: 10)).then((value) {
                        Loader.hide();
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
                      });


                      Loader.hide();
                     // Navigator.push(context, MaterialPageRoute(builder: (Context)=>HomeScreen()));
                    },
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width -30,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                          
                          
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(child: Text('Login',style:TextStyle(color:Colors.white, fontFamily: 'montserrat') )),
                      ),
                    ),
                  ),
        
                  
                ),

                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Text(' Forgot Password? ',style: TextStyle(fontFamily: 'montserrat'),),
                      GestureDetector(
                        onTap: (){

                        },
                        child: Text(' RESET',style: TextStyle(fontFamily: 'montserrat',color: Colors.amber),)),
                    ],
                  ),
                )
        
        
        
        
        
        
              ],
            ),
          ),
        )      
     
      ),
    );
  }
}
