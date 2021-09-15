import 'dart:convert';
import 'package:crypto/crypto.dart';

const String env = 'd';

const String baseUrl = 'https://gateway.marvel.com:443/v1/public/';

late String timestamp = DateTime.now().toIso8601String();

const String publicKey = '43a9f59bcc99d157be8cc636c74d8504';

const String privateKey = '36ffbfb121899029263f9bdcde687880322b9e3c';

late String hash = generateMd5(timestamp + privateKey + publicKey);

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}

late String queryAuth = '?ts=$timestamp&apikey=$publicKey&hash=$hash';
