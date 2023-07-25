import 'package:flutter/material.dart';
import 'user.dart' as myUser; // User sınıfı için alias ekledik
import 'welcome_page.dart' as WelcomePage; // WelcomePage sınıfı için alias ekledik
import 'register_page.dart' as RegisterPage; // RegisterPage sınıfı için alias ekledik

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kullanıcı Girişi'),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 300,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 3,
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ],
          ),
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Hoş Geldiniz!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    labelText: 'Kullanıcı Adı',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Kullanıcı adı boş olamaz';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 12),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Şifre',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Şifre boş olamaz';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Kullanıcı adı ve şifre doğrulandı, hoş geldiniz sayfasına yönlendir
                      String username = _usernameController.text;
                      String password = _passwordController.text;
                      myUser.User user = myUser.User(username: username, password: password);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WelcomePage.WelcomePage(user: user),
                        ),
                      );
                    }
                  },
                  child: Text('Giriş'),
                ),
                SizedBox(height: 12),
                TextButton(
                  onPressed: () {
                    // Kayıt ol sayfasına yönlendir
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => RegisterPage.RegisterPage()),
                    );
                  },
                  child: Text('Kaydol'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
