// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:signinpages2/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:signinpages2/main.dart'; // Uygulamanızın ana dosyasının yolunu düzeltin

void main() {
  testWidgets('Kullanıcı giriş sayfası testi', (WidgetTester tester) async {
    // Uygulamayı başlatın
    await tester.pumpWidget(MyApp());

    // Giriş sayfasını bulun
    expect(find.text('Kullanıcı Girişi'), findsOneWidget);

    // Kullanıcı adı ve şifre alanlarını bulun
    expect(find.byType(TextFormField), findsNWidgets(2));

    // Giriş butonunu bulun
    expect(find.text('Giriş'), findsOneWidget);

    // Kaydol butonunu bulun
    expect(find.text('Kaydol'), findsOneWidget);
  });

  testWidgets('Hoş Geldiniz sayfası testi', (WidgetTester tester) async {
    // Uygulamayı başlatın
    await tester.pumpWidget(MyApp());

    // Kullanıcı adı ve şifre girin
    await tester.enterText(find.byType(TextFormField).at(0), 'test_user');
    await tester.enterText(find.byType(TextFormField).at(1), 'test_password');

    // Giriş butonuna basın
    await tester.tap(find.text('Giriş'));
    await tester.pumpAndSettle();

    // Hoş Geldiniz sayfasını bulun ve kullanıcı adını doğrulayın
    expect(find.text('Hoş geldiniz, test_user!'), findsOneWidget);

    // Çıkış Yap butonunu bulun
    expect(find.text('Çıkış Yap'), findsOneWidget);
  });

  testWidgets('Kayıt sayfası testi', (WidgetTester tester) async {
    // Uygulamayı başlatın
    await tester.pumpWidget(MyApp());

    // Kaydol butonuna basın
    await tester.tap(find.text('Kaydol'));
    await tester.pumpAndSettle();

    // Kayıt sayfasını bulun
    expect(find.text('Kayıt Ol'), findsOneWidget);

    // Ad, Soyad, Kullanıcı Adı ve Şifre alanlarını bulun
    expect(find.byType(TextFormField), findsNWidgets(4));

    // Kayıt Ol butonunu bulun
    expect(find.text('Kaydol'), findsOneWidget);
  });
}