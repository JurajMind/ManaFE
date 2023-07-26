import 'package:rxdart/rxdart.dart';

class AppBloc {
  static final AppBloc _instance = new AppBloc._();

  factory AppBloc() => AppBloc._instance;

  AppBloc._();

  BehaviorSubject<int> activeTab = new BehaviorSubject<int>.seeded(1);

  changeActiveTab(int index) {
    this.activeTab.add(index);
  }
}
