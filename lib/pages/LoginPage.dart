import 'package:flutter/material.dart';
import 'package:project/components/LoginForm.dart';
import 'package:project/core/models/auth_form_data.dart';
import 'package:project/core/services/auth/auth_service.dart';
class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loading();
  }

  void loading() {
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        isLoading = false;
      });
    });

    setState(() {
      isLoading = true;
    });
  }

  Future<void> _handleSubmit(AuthFormData formData) async {
    try {
      await AuthService().login(formData.email, formData.password);
    } catch (error) {
      print('Erro: $error');
    } 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: isLoading ? CircularProgressIndicator(color: Colors.greenAccent.shade700,) : LoginForm(onSubmit: _handleSubmit),
        ),
      ),
    );
  }
}
