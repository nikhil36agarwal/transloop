import 'package:flutter/cupertino.dart';

Size globalKeys(context) {
  var mediaQuerry = MediaQuery.of(context);
  return mediaQuerry.size;
}
