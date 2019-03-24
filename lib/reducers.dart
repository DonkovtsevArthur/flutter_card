// import 'package:redux/redux.dart';
import './state.dart';
// import './actions.dart';
import './counter_reducer.dart';

AppState appReducer(AppState state, action) {
  return AppState(phone: counterReducer(state, action));
}
