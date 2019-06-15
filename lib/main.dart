import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider_example/state/theme_state.dart';
import 'package:provider_example/state/app_state.dart';

void main() => runApp(Root());

class Root extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ThemeState>.value(
          notifier: ThemeState(),
        ),
        ChangeNotifierProvider<AppState>.value(
          notifier: AppState(),
        ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeState>(context);
    return MaterialApp(
      title: 'Flutter Demo',
      theme: themeData.getTheme(),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<ThemeState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Hacker News App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.color_lens),
            onPressed: () {
              themeData.setTheme();
            },
          ),
        ],
      ),
      body: Container(),
      bottomNavigationBar: BottomAppBar(),
    );
  }
}
