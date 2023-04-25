import 'package:flutter/material.dart';
import 'package:rkapp/utils/routes.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("login page"),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Image.asset("assets/imagess/l.png", fit: BoxFit.cover),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "login page",
              style: TextStyle(
                fontSize: 20,
                fontStyle: FontStyle.normal,
                color: Colors.red,
              ),
            ),
            const SizedBox(
              width: 20.0,
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
              child: Column(
                children: [
                  TextFormField(
                    decoration: const InputDecoration(
                      hintText: "enter username",
                      labelText: "Username",
                    ),
                  ),
                  TextFormField(
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: "enter password",
                      labelText: "Password",
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  ElevatedButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue,
                        minimumSize: const Size(100, 50)),
                    onPressed: () {
                      Navigator.pushNamed(context, Myroute.homeroute);
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )));
  }
}
