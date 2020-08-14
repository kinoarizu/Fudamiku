import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fudamiku/bloc/bloc.dart';
import 'package:fudamiku/shared/shared.dart';
import 'package:fudamiku/ui/pages/pages.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  OneSignal.shared.init(oneSignalAppID, iOSSettings: null);
  OneSignal.shared.setInFocusDisplayType(OSNotificationDisplayType.notification);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PageBloc()),
        BlocProvider(create: (_) => UserBloc()),
        BlocProvider(create: (_) => OrderBloc()),
        BlocProvider(create: (_) => CounterCubit()),
        BlocProvider(create: (_) => NotificationCubit()),
        BlocProvider(create: (_) => FoodBloc()..add(FetchFoods())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Wrapper(),
      ),
    );
  }
}