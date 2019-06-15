import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:provider_example/state/theme_state.dart';
import 'package:provider_example/state/app_state.dart';
import 'package:url_launcher/url_launcher.dart';

import 'models/stories.dart';

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

//https://hn.algolia.com/assets/logo-hn-search.png

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
        leading: Provider.of<AppState>(context).isLoading
            ? Container(
                padding: EdgeInsets.all(10),
                child: CircularProgressIndicator(
                  backgroundColor: themeData.getTheme().canvasColor,
                ),
              )
            : Container(
                padding: EdgeInsets.all(10),
                child: Image.network(
                    'https://hn.algolia.com/assets/logo-hn-search.png'),
              ),
        title: Text('Hacker News App'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: StorySearch(),
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.color_lens),
            onPressed: () {
              themeData.setTheme();
            },
          ),
        ],
      ),
      body: Consumer<AppState>(
        builder: (context, state, _) => ListView(
              children:
                  state.stories.map((story) => _buildTile(story)).toList(),
            ),
      ),
      bottomNavigationBar: BottomAppBar(),
    );
  }

  Widget _buildTile(Stories story) {
    return Container(
      padding: EdgeInsets.all(10),
      child: ExpansionTile(
        title: Text('${story.title}'),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('${story.descendants ?? 0} comments'),
              IconButton(
                icon: Icon(Icons.launch),
                onPressed: () async {
                  if (await canLaunch(story.url)) {
                    launch(story.url);
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}

class StorySearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    // TODO: implement buildActions
    return null;
  }

  @override
  Widget buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return null;
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return null;
  }
}
