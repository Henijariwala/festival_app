import 'package:festival_flutter/screen/create/create_screen.dart';
import 'package:festival_flutter/screen/edit/edit_screen.dart';
import 'package:festival_flutter/screen/home/home_screen.dart';
import 'package:flutter/material.dart';

Map<String,WidgetBuilder>app_routes=
{
     '/': (context) => const HomeScreen(),
     'create': (context) => const CreateScreen(),
     'edit': (context) => const EditScreen()
};