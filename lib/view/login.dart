import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_signup_screen/controller/authcontroller.dart';
import 'package:login_signup_screen/view/contents-page.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //email : fridge@fridge.com
    //password : 123456
    String ?password;
    String ?email;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.only(top: 100),
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/background.png"),
                              fit: BoxFit.fitHeight
                          ),

                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40),
                    child: Column(
                      children: <Widget>[

                        inputFile(hint:"enter email here",onchange: (value){
                          AuthController.to.email.value=value;
                        },icon:  Icon(
                          Icons.email,
                          color: Colors.lightBlueAccent,
                        ),),

                        SizedBox(
                          height: 20,
                        ),
                        inputFile(hint:"enter password here",obscureText:true,onchange: (value){
                          AuthController.to.password.value=value;
                        },icon:  Icon(
                          Icons.password,
                          color: Colors.lightBlueAccent,
                        ),),

                      ],
                    ),
                  ),
                    Padding(padding:
                    EdgeInsets.symmetric(horizontal: 40),
                    child: Container(
                        padding: EdgeInsets.only(top: 3, left: 3),
                        decoration:
                          BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border(
                              bottom: BorderSide(color: Colors.black),
                              top: BorderSide(color: Colors.black),
                              left: BorderSide(color: Colors.black),
                              right: BorderSide(color: Colors.black),

                            )



                          ),
                        child: MaterialButton(
                          minWidth: double.infinity,
                          height: 60,
                          onPressed: () {
                            AuthController.to.login();
                          },
                          color: Color(0xff0095FF),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),

                          ),
                          child: Text(
                            "Login", style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.white,

                          ),
                          ),

                        ),
                      ),
                    ),

                ],
              ))
            ],
          ),
        ),
      ),
    );
  }

}


// we will be creating a widget for text field
Widget inputFile({hint, obscureText = false,onchange,icon})
{
  return  Container(
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
              blurRadius: 10,
              spreadRadius: 7,
              offset: const Offset(1, 1),
              color: Colors.grey.withOpacity(0.2)
          )
        ]
    ),
    child:TextField(
      obscureText: obscureText,
      onChanged: onchange,
      decoration: InputDecoration(
          hintText: hint,
          prefixIcon: icon,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                  color: Colors.white,
                  width: 1.0
              )
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: const BorderSide(
                  color: Colors.white,
                  width: 1.0
              )
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30)
          )
      ),
    ),
  );
}
