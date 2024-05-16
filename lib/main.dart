import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:homework12/Screen/splash_screen/splash_screen.dart';
import 'package:homework12/utils/color/color.dart';
import 'bloc/auth/auth_bloc.dart';
import 'data/auth_repository.dart';
import 'data/local/storage_repository.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await StorageRepository.init();
  runApp(MultiRepositoryProvider(providers:[
    RepositoryProvider(create: (_) => AuthRepository()),
  ], child:MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) =>
        AuthBloc(authRepository: context.read<AuthRepository>())
          ..add(
            CheckAuthenticationEvent(),
          ),
      ),
    ],
    child: const MyApp(),
  )));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390,844),
      builder: (context,child){
        return MaterialApp(
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              systemOverlayStyle:SystemUiOverlayStyle(
                statusBarColor:AppColors.c_273032
              ),
              backgroundColor:AppColors.c_273032,
                elevation:0
            ),
            scaffoldBackgroundColor: AppColors.c_273032
          ),
          home: child,
          debugShowCheckedModeBanner: false,
        );
      },
      child: const SplashScreen(),
    );
  }
}
