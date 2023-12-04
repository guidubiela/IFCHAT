import 'package:flutter/material.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircularProgressIndicator(
              color: Colors.greenAccent.shade700,
            ),
            /*SizedBox(height: 10,),
            Text("Carregando...", style: TextStyle(color: Colors.greenAccent.shade700)),*/
          ],
        ),
      ),
    );
  }
}