import 'dart:convert';

import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
    bool _obsecure =true;


  String _userName, _userEmail, _userPassword;

  Widget _showTitle() {
    return Text(
      'Register',
      style: Theme.of(context).textTheme.headline1,
    );
  }

  Widget _userNameInput() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
        onSaved: (val) => _userName = val,
        validator: (val) => val.length < 6 ? 'UserName Is Short' : null,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'username',
          hintText: 'Enter username ,min length 6',
          icon: Icon(
            Icons.face,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _userEmailInput() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
        onSaved: (val) => _userEmail = val,
        validator: (val) => !val.contains('@') ? 'invalid Email' : null,
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          labelText: 'userEmail',
          hintText: 'Enter a valid Email',
          icon: Icon(
            Icons.mail,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _userPasswordInput() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: TextFormField(
        
        onSaved: (val) => _userPassword = val,
        validator: (val) => val.length < 6 ? 'Password Is Short' : null,
        obscureText: _obsecure,
        decoration: InputDecoration(
           suffixIcon: GestureDetector(
            onTap: (){
              setState(()=> _obsecure = !_obsecure);
            },
            child: Icon(_obsecure?Icons.visibility: Icons.visibility_off),
          ),
          border: OutlineInputBorder(),
          labelText: 'password',
          hintText: 'Enter password ,min length 6',
          icon: Icon(
            Icons.lock,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }

  Widget _showFormActions() {
    return Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        children: <Widget>[
          RaisedButton(
            color: Theme.of(context).primaryColor,
            child: Text(
              'Submit',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Colors.black),
            ),
            elevation: 8.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            onPressed: _submit,
          ),
          FlatButton(
              onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
              child: Text(
                'Existing user ? login',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.redAccent),
              ))
        ],
      ),
    );
  }

  void _submit() {
    final form = _formKey.currentState;
    if(form.validate()){
      form.save();
    }
  }

// void _registerUser() async{
//  http.Response response = await http.post('http://localhost:1337/auth/local/register',body: {
//     "username" : _userName,
//     "email": _userEmail,
//     "password": _userPassword
//   });
//   final responseData = json.decode(response.body);
//   print(responseData);
// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    _showTitle(),
                    _userNameInput(),
                    _userEmailInput(),
                    _userPasswordInput(),
                    _showFormActions()
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
