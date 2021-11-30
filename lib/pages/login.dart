import 'package:banking_app/components/alert_dialog.dart';
import 'package:banking_app/components/form_field_entry.dart';
import 'package:banking_app/components/page_loading_indicator.dart';
import 'package:banking_app/components/rounded_button.dart';
import 'package:banking_app/constants/app_colors.dart';
import 'package:banking_app/helpers/exceptions/network_exceptions.dart';
import 'package:banking_app/helpers/exceptions/user_exceptions.dart';
import 'package:banking_app/helpers/validators.dart';
import 'package:banking_app/models/login_response.dart';
import 'package:banking_app/utils/routes.dart';
import 'package:banking_app/viewmodels/user_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:global_configuration/global_configuration.dart';
import 'package:banking_app/models/user.dart';
import 'package:provider/provider.dart';

enum LoginFormField { email, password }

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final Map<LoginFormField, String> _credentials = {
    LoginFormField.email: null,
    LoginFormField.password: null
  };

  bool passwordNotVisible = true;
  bool _isLoading = false;

  void _login(UserViewModel userViewModel) {
    userViewModel
        .login(_credentials[LoginFormField.email],
            _credentials[LoginFormField.password])
        .then((LoginResponse loginResponse) {
      if (loginResponse == null) {
        CustomAlertDialog.okDialog(
          context: context,
          title: 'Login failed',
          content:
              'Your email or password was entered incorrectly. Please connect and try again.',
        );
      } else {
        userViewModel
            .getClientDetails(userViewModel.loginResponse.localId,
                userViewModel.loginResponse.idToken)
            .then((User user) {
          if (user == null) {
            CustomAlertDialog.okDialog(
              context: context,
              title: 'Login failed',
              content:
                  'Your email or password was entered incorrectly. Please connect and try again.',
            );
          }
          Navigator.pushNamed(context, AppRoutes.bottom_nav_bar);
        });
      }
    }).catchError((e) {
      if (e is NoInternetException) {
        CustomAlertDialog.okDialog(
          context: context,
          title: 'Login failed',
          content:
              'No internet connection is available. Please connect and try again.',
        );
      } else if (e is LoginFailed) {
        CustomAlertDialog.okDialog(
          context: context,
          title: 'Login Service Failed',
          content: e.toString(),
        );
      } else {
        CustomAlertDialog.okDialog(
          context: context,
          title: 'Login failed',
          content: 'Unexpected error: ${e.toString()}',
        );
      }
    }).whenComplete(() {
      setState(() {
        _isLoading = false;
      });
    });
  }

  void _validateLoginForm(BuildContext context, UserViewModel userViewModel) {
    final form = _formKey.currentState;
    if (form.validate()) {
      SystemChannels.textInput.invokeMethod('TextInput.hide'); //hides keyboard

      form.save();
      setState(() {
        _isLoading = true;
      });
      _login(userViewModel);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.light,
        body: Consumer<UserViewModel>(
          builder: (BuildContext context, UserViewModel viewmodel, Widget _) {
            return PageLoadingIndicator(
              child: loginInterface(viewmodel),
              statusState: _isLoading,
            );
          },
        ),
      ),
    );
  }

  Widget loginInterface(UserViewModel userViewModel) {
    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 30.0,
            ),
            _loginHeading(),
            SizedBox(
              height: 15.0,
            ),
            _loginSubHeading(),
            Container(
              margin: EdgeInsets.only(
                  top: 60.0, left: 40.0, right: 40.0, bottom: 15.0),
              child: Column(
                children: <Widget>[
                  _loginForm(userViewModel),
                  TextButton(
                    child: Text(' Forgot password?',
                        style:
                            TextStyle(color: AppColors.primary, fontSize: 14)),
                    onPressed: () {
                      //functionality will be added upon request :)
                    },
                  ),
                  CheckboxListTile(
                    value: false,
                    title: Text('Remember Me'),
                    onChanged: (newValue) {},
                    controlAffinity: ListTileControlAffinity.leading,
                    contentPadding: EdgeInsets.all(0),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  RoundedButton(
                    title: 'Login',
                    textColour: AppColors.light,
                    colour: AppColors.primary,
                    onPressed: () {
                      _validateLoginForm(context, userViewModel);
                    },
                    elevation: 6.0,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _loginHeading() {
    return Text(
      'Login',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColors.primary,
        fontSize: 55.0,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Widget _loginSubHeading() {
    return Text(
      'Log in to your ' +
          GlobalConfiguration().getValue<String>('appTitle') +
          ' account',
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.grey,
        fontSize: 17.0,
      ),
    );
  }

  Widget _loginForm(UserViewModel viewModel) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          FormFieldEntry(
            title: 'Email',
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
              _credentials[LoginFormField.email] =
                  value.toString().toLowerCase().trim();
            },
            onSaved: (value) {
              _credentials[LoginFormField.email] =
                  value.toString().toLowerCase().trim();
            },
            hintText: 'Enter your email',
            validator: validateEmail,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
            //  initialValue: rememberMyLoginCredentials(), was attempting to make initial value displayed on the email if user has logged in before
            inputFormatters: [
              FilteringTextInputFormatter.deny(
                //checks if charcaters / , \ and spaces are present, then they get denied
                RegExp(r'[/\\' + noSpacePattern + ' ]'),
              ),
              LengthLimitingTextInputFormatter(40),
            ],
          ),
          SizedBox(
            height: 15.0,
          ),
          FormFieldEntry(
            title: 'Password',
            onChanged: (value) {
              _credentials[LoginFormField.password] = value;
            },
            onSaved: (value) {
              _credentials[LoginFormField.password] = value;
            },
            hintText: 'Enter your password',
            validator: validatePassword,
            onEditingComplete: () => FocusScope.of(context).nextFocus(),
            suffixIcon: IconButton(
              icon: Icon(
                passwordNotVisible ? Icons.visibility_off : Icons.visibility,
                color: Colors.grey,
              ),
              onPressed: () {
                setState(() {
                  passwordNotVisible = !passwordNotVisible;
                });
              },
            ),
            onFieldSubmitted: (String _) {
              _validateLoginForm(context, viewModel);
            },
            obscureText: passwordNotVisible,
            inputFormatters: [
              FilteringTextInputFormatter.deny(
                RegExp(noSpacePattern),
              ),
              LengthLimitingTextInputFormatter(50),
            ],
          ),
        ],
      ),
    );
  }
}
