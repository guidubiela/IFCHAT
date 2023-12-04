import 'package:flutter/material.dart';
import 'package:project/components/SignupForm.dart';
import 'package:project/core/models/auth_form_data.dart';
import 'package:project/core/services/auth/auth_firebase_service.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  Future<void> _handleSubmit(AuthFormData formData) async {
    try {
      AuthFirebaseService().signup(
          formData.name, formData.email, formData.password, formData.image);
    } catch (error) {
      print('Erro: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: SignupForm(onSubmit: _handleSubmit),
        ),
      ),
    );
  }
}
