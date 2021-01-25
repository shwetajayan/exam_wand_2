import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginPage(),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String email, password,name,desig;
  bool isSignupScreen = true;
  List<bool> isSelected = [true,false];

  Widget _build_Logo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          'Exam Wand',
          style: TextStyle(
            fontSize: MediaQuery
                .of(context)
                .size
                .height / 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20),),
          child: Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.6,
            width: MediaQuery
                .of(context)
                .size
                .width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSignupScreen = false;
                        });
                      },
                      child: Column(children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isSignupScreen ? Colors.grey[600] : Colors
                                .blue[900],
                          ),
                        ),
                        if(!isSignupScreen)
                          Container(
                            margin: EdgeInsets.only(top: 3),
                            height: 2,
                            width: 55,
                            color: Colors.orange,
                          ),
                      ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSignupScreen = true;
                        });
                      },

                      child: Column(children: [
                        Text(
                          'SIGNUP',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isSignupScreen ? Colors.blue[900] : Colors
                                .grey[600],
                          ),
                        ),
                        if(isSignupScreen)
                          Container(
                            margin: EdgeInsets.only(top: 3),
                            height: 2,
                            width: 55,
                            color: Colors.orange,
                          ),
                      ],
                      ),
                    ),
                  ],
                ),
                _buildDesignation(),
                _buildName(),
                _buildEmailRow(),
                _buildPasswordRow(),
                _buildSignUpButton(),
                _buildOrRow(),
                _buildSocialBtnRow(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildEmailRow() {
    return Padding(padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        onChanged: (value) {
          setState(() {
            email = value;
          });
        },
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.email,
              color: Colors.blue[800],
            ),
            labelText: 'E-mail'
        ),
      ),
    );
  }

  Widget _buildPasswordRow() {
    return Padding(padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.text,
        obscureText: true,
        onChanged: (value) {
          setState(() {
            password = value;
          });
        },
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock,
              color: Colors.blue[800],
            ),
            labelText: 'Password'
        ),
      ),
    );
  }

  Widget _buildForgetPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FlatButton(onPressed: () {}, child: Text("Forgot Password"),)
      ],
    );
  }
  
  Widget _buildDesignation(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

    children:[ ToggleButtons(
      isSelected: isSelected,
      selectedColor: Colors.white,
      color: Colors.black,
      fillColor: Colors.blue[800],
      borderRadius: BorderRadius.circular(24),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Text('Student',
        style: TextStyle( fontSize: 12,fontWeight: FontWeight.bold),),
        ),
        Padding(
          padding: const EdgeInsets.all(8),
        child:Text('Teacher',
          style: TextStyle( fontSize: 12,fontWeight: FontWeight.bold),),
        ),
      ],
      onPressed: (val){if(val==0)
        desig='Student';
      else
        desig = 'Teacher';},
    ),
    ],
    );
  }

  Widget _buildLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.4 * (MediaQuery
              .of(context)
              .size
              .height / 20),
          width: 5 * (MediaQuery
              .of(context)
              .size
              .width / 10),
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            elevation: 5.0,
            color: Colors.blue[800],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: () {},
            child: Text("Login",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: MediaQuery
                    .of(context)
                    .size
                    .height / 40,
              ),),
          ),
        ),
      ],
    );
  }
  Widget _buildSignUpButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 1.4 * (MediaQuery
              .of(context)
              .size
              .height / 20),
          width: 5 * (MediaQuery
              .of(context)
              .size
              .width / 10),
          margin: EdgeInsets.only(bottom: 20),
          child: RaisedButton(
            elevation: 5.0,
            color: Colors.blue[800],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0),
            ),
            onPressed: () {},
            child: Text("Sign Up",
              style: TextStyle(
                color: Colors.white,
                letterSpacing: 1.5,
                fontSize: MediaQuery
                    .of(context)
                    .size
                    .height / 40,
              ),),
          ),
        ),
      ],
    );
  }

  Widget _buildOrRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Text(
            '- OR -',
            style: TextStyle(
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }
  
  Widget _buildName(){
    return Padding(padding: EdgeInsets.all(8),
      child: TextFormField(
        keyboardType: TextInputType.text,
        onChanged: (value) {
          setState(() {
            name = value;
          });
        },
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.account_circle,
              color: Colors.blue[800],
            ),
            labelText: 'Name'
        ),
      ),
    );
  }

  Widget _buildSocialBtnRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.blue[800],
              boxShadow: [
                BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0, 2),
                    blurRadius: 6.0
                )
              ],

            ),
            child: Icon(FontAwesomeIcons.google,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildContainer2() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(20),),
          child: Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.6,
            width: MediaQuery
                .of(context)
                .size
                .width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSignupScreen = false;
                        });
                      },
                      child: Column(children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isSignupScreen ? Colors.grey[600] : Colors
                                .blue[900],
                          ),
                        ),
                        if(!isSignupScreen)
                          Container(
                            margin: EdgeInsets.only(top: 3),
                            height: 2,
                            width: 55,
                            color: Colors.orange,
                          ),
                      ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isSignupScreen = true;
                        });
                      },

                      child: Column(children: [
                        Text(
                          'SIGNUP',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isSignupScreen ? Colors.blue[900] : Colors
                                .grey[600],
                          ),
                        ),
                        if(isSignupScreen)
                          Container(
                            margin: EdgeInsets.only(top: 3),
                            height: 2,
                            width: 55,
                            color: Colors.orange,
                          ),
                      ],
                      ),
                    ),
                  ],
                ),
                _buildEmailRow(),
                _buildPasswordRow(),
                _buildForgetPasswordButton(),
                _buildLoginButton(),
                _buildOrRow(),
                _buildSocialBtnRow(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Stack(
              children: <Widget>[
          Container(
          height: MediaQuery.of(context).size.height * 0.7,
          width: MediaQuery
              .of(context)
              .size
              .width,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.blue[800],
                borderRadius: BorderRadius.only(
                  bottomLeft: const Radius.circular(70),
                  bottomRight: const Radius.circular(70),
                )
            ),
          ),
        ),
        Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
            _build_Logo(),
        if(isSignupScreen)
    _buildContainer(),
              if(!isSignupScreen)
                _buildContainer2(),

    ],
    ),
    ],
    )
    ,
    )
    ,
    );
  }
}
