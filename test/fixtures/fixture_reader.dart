import 'dart:io';
// ファイル名を指定してファイルの内容をStringとして読み取る
String fixture(String name) => File('test/fixtures/$name').readAsStringSync();