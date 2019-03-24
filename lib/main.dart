import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import './state.dart';
import './reducers.dart';
// import './middleware.dart';
import './actions.dart';
import 'App.dart';

import './screens/cards/body/getLocal/main.dart';
import './theme.dart';

void main() => runApp(Main());

class Main extends StatelessWidget {
  final Store<AppState> store = Store<AppState>(
    appReducer,
    initialState: AppState(),
    middleware: [],
  );

  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      store: this.store,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: getTheme(),
        home: FutureBuilder(
          future: getLocal(AppState().phone),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                print('еще раз ');
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Center(child: CircularProgressIndicator()),
                );
                break;
              case ConnectionState.done:
                if (snapshot.data != null) {
                  final String phone = snapshot.data['phone'];
                  store.dispatch(AddWriteInfoUser(phone));
                } else {
                  print('НЕ авторизован');
                }
                break;
              case ConnectionState.active:
              case ConnectionState.waiting:
                Container(
                  decoration: BoxDecoration(color: Colors.white),
                  child: Center(child: CircularProgressIndicator()),
                );
                break;
              default:
                break;
            }
            return App();
          },
        ),
      ),
    );
  }
}
