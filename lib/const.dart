import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'quicky.dart';

final List<String> categories = ['Quicky', 'AUH', 'YISH', 'OKI'];

final fontSize = 22.0;

final String tableName = "quicky";
final String Column_id = "id";
final String Column_name = "content";

final TodoHelper todoHelper = TodoHelper();

List<quicky> ques = [];
quicky currentQ;

LineSplitter ls = new LineSplitter();