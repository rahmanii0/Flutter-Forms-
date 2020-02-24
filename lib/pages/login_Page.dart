import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  bool _obsecure =true;

  String _userEmail, _userPassword;

  Widget _showTitle() {
    return Text(
      'Login',
      style: Theme.of(context).textTheme.headline1,
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
            color: Theme.of(context).accentColor,
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
              onPressed: () => Navigator.pushReplacementNamed(context, '/register'),
              child: Text(
                'New user ? Register',
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
      print('Email:$_userEmail,Password:$_userPassword');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
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
