import 'package:flutter/material.dart';

///Created mock [isLoggedIn] variable to design conditional UI, Defined in [global_variables.dart], replace this with real user
bool isLoggedIn = false;

///Createded [ValueNotifier] variable [byCitiesViewStackIndex] in [ByCitiesTab] to show result widget based on [IndexedStack] index
ValueNotifier<int> byCitiesViewStackIndex = ValueNotifier(0);

///Createded [ValueNotifier] variable [byNumberViewStackIndex] in [ByNumberTab] to show result widget based on [IndexedStack] index
ValueNotifier<int> byNumberViewStackIndex = ValueNotifier(0);

///Created [ValueNotifier] variable [myTripsViewStackIndex] in [myTripsTab] to show result widget based on [IndexedStack] index
ValueNotifier<int> myTripsViewStackIndex = ValueNotifier(0);

///Created [ValueNotifier] variable [recentsViewStackIndex] in [RecentTab] to show result widget based on [IndexedStack] index
ValueNotifier<int> recentsViewStackIndex = ValueNotifier(0);
