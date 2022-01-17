import 'package:flutter/material.dart';

class CurrentPageStore extends ValueNotifier<int> {
  CurrentPageStore() : super(0);

  void setPage(int i) => value = i;
}
