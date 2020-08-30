import 'package:flutter_bloc/flutter_bloc.dart';

class MyBlocObserver extends BlocObserver{
@override
void onError(Cubit cubit , Object error, StackTrace stackTrace){
  print(error);
  super.onError(cubit, error, stackTrace);
  
}

@override 
void onEvent(Cubit cubit, Object event){
  print(event);
  super.onEvent(cubit, event);
}

@override 
void onTransition(Cubit cubit, Transition transition){
  print(transition);
  super.onTransition(cubit, transition);
}
}