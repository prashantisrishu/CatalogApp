import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:catalogapp/utils/routes.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool isChanged = false;
  final _formKey = GlobalKey<FormState>();

  moveToHome(BuildContext context) async{
    if(_formKey.currentState!.validate()) {
      setState(() {
        isChanged = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        isChanged = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: context.canvasColor,
      child: SingleChildScrollView(
        child:Form(
          key: _formKey,
          child: Column(
            children: [ 
              SizedBox(
                height:20,
              ),  
              Image.asset("assets/images/login_image.png",
              fit: BoxFit.cover,
              ),
              SizedBox(
                height:20.0,
              ),
              Text("Welcome $name",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height:20.0
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0 , horizontal: 32.0),
                child: Column(
                  children: [
                    TextFormField(
                      onChanged: (value) {
                        setState(() {
                          name = value;
                        });
                      },
                      decoration: InputDecoration(
                        hintText: "Enter UserName",
                        labelText: "UserName"
                      ),
                      validator: (value) {
                        if(value!.isEmpty) {
                          return "Username Cannot be Empty";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Enter Password",
                        labelText: "Password" 
                      ),
                      validator: (value) {
                        if(value!.isEmpty)
                          return "Password cannot be empty";
                        else if(value.length < 6)
                          return "Length of Password should be atleast 6";
                        return null;
                      },
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: () => moveToHome(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width:  isChanged ? 50 : 120,
                        height: 50,
                        alignment: Alignment.center,
                        child: isChanged ?
                        Icon(
                          Icons.done,
                          color: Colors.white,
                        ) 
                        :
                        Text("Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18, 
                          ),
                        ), 
                        decoration: BoxDecoration(
                          color: context.theme.buttonColor,
                          borderRadius: BorderRadius.circular(isChanged? 50 : 8),  
                        ),
                      ), 
                    ),
                  ], 
                ),
              ),
            ],
          ),
        ), 
      ),
    );
  }
}