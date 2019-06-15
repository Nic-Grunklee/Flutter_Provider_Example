import 'dart:collection';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:provider_example/models/stories.dart';

enum StoryType {
  TopStories,
  NewStories
}