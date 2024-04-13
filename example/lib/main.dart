import 'package:flutter/material.dart';
import 'dart:async';
import 'package:trans_intl/trans_intl.dart';

void main() {
  I18nManager.init(trans: TranslationsService(), current: LangType.CN);
  runApp(const MyApp());
}

class Trans {
  static const String hello = 'Hello World';
}

class Ids {
  static const String hello = "hello";
}

TranslationMap trans = {
  Ids.hello: {
    LangType.EN: "Hello",
    LangType.CN: "你好",
    LangType.ES: "Hola",
    LangType.FR: "Bonjour",
    LangType.DE: "Hallo"
  },
};

class TranslationsService extends Translations {
  @override
  TranslationMap get keys => trans;
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> _changeLan(LangType type) async {
    await I18nManager.changeLanguage(type);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(Trans.hello.intl),
        ),
        body: Center(
          child: Column(
            children: [
              Text(Trans.hello.intl),
              RawMaterialButton(
                onPressed: () => _changeLan(LangType.EN),
                child: Text('EN'),
                fillColor: Colors.blue,
              ),
              RawMaterialButton(
                onPressed: () => _changeLan(LangType.CN),
                child: Text('CN'),
                fillColor: Colors.blue,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
