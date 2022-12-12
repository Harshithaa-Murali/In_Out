import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("Login"),
            centerTitle: true,
          ),
          body: const BasicForm(),
        )
    );
  }
}

class BasicForm extends StatefulWidget {
  const BasicForm({Key? key}) : super(key: key);

  @override
  State<BasicForm> createState() => _BasicFormState();
}

class Submission extends StatelessWidget {
  final String username;
  final String password;
  final String welc;
  const Submission({Key? key, this.username="", this.password="",this.welc=""}): super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Login Successful!"),
          centerTitle: true,
        ),
        body: Container(
          child: ListView(
            children: [
              ListTile(
                title: Text('Username'),
                subtitle: Text('$username'),
              ),
              ListTile(
                title: Text('Password'),
                subtitle: Text('$password'),
              ),
              ListTile(
                title: Text('Welcome'),
                subtitle: Text('$welc'),
              ),
            ],
          ),
        ),
        // body: Container(
        //     padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 20),
        //     child: Center(
        //       child: Text(
        //         "Welcome, $username !",
        //         style: const TextStyle(
        //           fontSize: 36.0,
        //         ),
        //       ),
        //     )
        // )
    );
  }
}


class _BasicFormState extends State<BasicForm> {
  final _formKey = GlobalKey<FormState>();
  String username = "";
  String password = "";
  String welc="";
  String selectedV = "Choose";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0,),
      child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              const SizedBox(height: 20,),
              DropdownButtonFormField(
                hint: Text(
                  "Choose value"
                ),
                //value: "Hello",
                items: const [
                    DropdownMenuItem(
                    child: Text('Hello'),
                    value: "Hello",
                  ),
                    DropdownMenuItem(
                      child: Text('Bye'),
                      value: "bye",
                    ),
                ],
                  onChanged: (String? newvalue){
                    setState(() {
                      welc = newvalue!;
                    });
                  },
              ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: "Enter username"
                ),
                onChanged: (value) {
                  setState(() {
                    username = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your username";
                  }
                  return null;
                },
              ),
              const SizedBox( height: 20, ),
              TextFormField(
                decoration: const InputDecoration(
                    labelText: "Enter password"
                ),
                onChanged: (value) {
                  setState(() => password = value);
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your password";
                  }
                  return null;
                },
                obscureText: true,
              ),
              const SizedBox( height: 20, ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Submission(username: username, password: password,welc:welc))
                    );
                  }
                },
                child: const Text("Submit"),
              )
            ],
          )
      ),
    );
  }
}
