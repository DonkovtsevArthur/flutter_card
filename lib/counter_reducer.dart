import './actions.dart';

counterReducer(state, action) {
  if (action is AddWriteInfoUser) {
    return action.phone;
  }
  if (action is DeleteInfoUsersPhone) {
    return '';
  }
}
