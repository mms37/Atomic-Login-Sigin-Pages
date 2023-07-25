import 'package:flutter/material.dart';
import 'user.dart' as myUser; // User sınıfı için alias ekledik

class WelcomePage extends StatelessWidget {
  final myUser.User user; // Alias kullanarak User sınıfını çağırıyoruz

  WelcomePage({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hoş Geldiniz')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hoş geldiniz, ${user.username}!'),
            ElevatedButton(
              onPressed: () {
                // Kullanıcı çıkış yaparsa, giriş sayfasına geri dön
                Navigator.pop(context);
              },
              child: Text('Çıkış Yap'),
            ),
          ],
        ),
      ),
    );
  }
}