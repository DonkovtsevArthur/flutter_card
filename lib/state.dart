class AppState {
  final String phone;
  AppState({this.phone = ''});

  AppState copyWith({String phone}) {
    return new AppState(
      phone: phone ?? this.phone,
    );
  }

  @override
  String toString() {
    return 'AppState{phone: $phone}';
  }
}
