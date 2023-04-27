import 'package:flutter/material.dart';
import 'package:rkapp/utils/routes.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  bool changebutton = false;
  final _formkey = GlobalKey<FormState>();

  movetoHome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        changebutton = true;
      });
      await Future.delayed(const Duration(seconds: 2));
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, Myroute.homeroute);
      setState(() {
        changebutton = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("login page"),
          backgroundColor: Colors.blue,
        ),
        body: SingleChildScrollView(
            child: Form(
          key: _formkey,
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Image.asset(
                "assets/imagess/2.png",
                fit: BoxFit.cover,
                height: 100,
              ),
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 30,
              ),
              Text("Welcome $name"),
              const SizedBox(
                width: 20.0,
                height: 40,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 30, horizontal: 50),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "enter username",
                        labelText: "Username",
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "cannot be empty";
                        }
                        return null;
                      },
                      onChanged: (value) {
                        name = value;
                        setState(() {});
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
                        hintText: "enter password",
                        labelText: "Password",
                      ),
                      validator: (value) {
                        if (value!.length < 6) {
                          return "should be greater than 6";
                        }
                      },
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    InkWell(
                      onTap: () => movetoHome(context),
                      child: AnimatedContainer(
                        height: 40,
                        width: changebutton ? 50 : 80,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.purple,
                          borderRadius:
                              BorderRadius.circular(changebutton ? 15 : 8),
                        ),
                        duration: const Duration(seconds: 1),
                        child: changebutton
                            ? const Icon(Icons.done, color: Colors.white)
                            : const Text(
                                "login",
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                      ),
                    ),
                    // ElevatedButton(
                    //   style: TextButton.styleFrom(
                    //       backgroundColor: Colors.blue,
                    //       minimumSize: const Size(100, 50)),
                    //   onPressed: () {
                    //     Navigator.pushNamed(context, Myroute.homeroute);
                    //   },
                    //   child: const Text(
                    //     "Login",
                    //     style: TextStyle(
                    //       fontStyle: FontStyle.italic,
                    //       color: Colors.yellow,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
