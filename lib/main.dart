import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spiritometer/RouteGenerator.dart';
import 'package:provider/provider.dart';
import 'package:spiritometer/Services/auth.dart';
import 'package:spiritometer/bloc_observer.dart';
import 'package:spiritometer/models/user.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
    runApp(MyApp());
  }
  
  

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      //stream to listen for  expctd data
      value: AuthService().user,
      //pass on stream to all children widget

      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Color(0xFF8f94fb),
        ),
        child: MaterialApp(
            theme: ThemeData(
              scaffoldBackgroundColor: Colors.grey[50],
              //Color(0xffF5F5F5)
            ),
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            onGenerateRoute: RouteGenerator.generateRoute
            //home: LoginScreen(),
            ),
      ),
    );
  }
}
