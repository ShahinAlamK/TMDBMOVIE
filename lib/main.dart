import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meeco/Backends/apiservice.dart';
import 'package:meeco/Utilitis/Theme.dart';
import 'package:provider/provider.dart';
import 'Pages/homepage.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: bgColor,
    systemNavigationBarIconBrightness: Brightness.light
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>ApiService()),
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.dark,
          theme: CustomTheme.lightTheme(),
          darkTheme: CustomTheme.darkTheme(),
          home: HomePage()
      ),
    );
  }
}

