import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login_controller.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: _buildForm(context),
      ),
    );
  }

  Widget _buildForm(BuildContext context) {
    return Align(
      alignment: const Alignment(0, -1 / 3),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _usernameInput(context),
          const Padding(padding: EdgeInsets.all(12)),
          _codeInput(context),
          const Padding(padding: EdgeInsets.all(12)),
          _sendSmsCodeButton(context),
          const Padding(padding: EdgeInsets.all(12)),
          _loginButton(context),
        ],
      ),
    );
  }

  Widget _usernameInput(BuildContext context) {
    return TextField(
      key: const Key('loginForm_usernameInput_textField'),
      onChanged: (username) => {controller.isLoginFailed = false},
      controller: controller.loginUsernameController,
      decoration: const InputDecoration(
        labelText: 'phone number',
        // errorText: state.phone == "1" ? 'invalid username' : null,
      ),
    );
  }

  Widget _codeInput(BuildContext context) {
    return TextField(
      key: const Key('loginForm_codeInput_textField'),
      onChanged: (code) => {controller.isLoginFailed = false},
      controller: controller.loginCodeController,
      obscureText: true,
      decoration: InputDecoration(
        labelText: 'verification code',
        errorText: controller.isLoginFailed ? 'invalid code' : null,
      ),
    );
  }

  Widget _sendSmsCodeButton(BuildContext context) {
    return ElevatedButton(
      key: const Key('loginForm_sendCode_raisedButton'),
      onPressed: () {
        controller.getSmsCode(context);
      },
      child: const Text('Send SMS Code'),
    );
  }

  Widget _loginButton(BuildContext context) {
    return ElevatedButton(
      key: const Key('loginForm_continue_raisedButton'),
      onPressed: () {
        controller.login(context);
      },
      child: const Text('Login'),
    );
  }
}
