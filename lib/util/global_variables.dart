import 'package:flutter/material.dart';

///Created mock [isLoggedIn] variable to design conditional UI, Defined in [global_variables.dart], replace this with real user
bool isLoggedIn = false;

///Createded [ValueNotifier] variable [byCitiesSearchStackIndex] in [ByCitiesTab] to show result widget based on [IndexedStack] index
ValueNotifier<int> byCitiesSearchStackIndex = ValueNotifier(0);
