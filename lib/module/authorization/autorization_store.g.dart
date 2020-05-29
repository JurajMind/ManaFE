// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autorization_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthorizationStore on _AuthorizationStore, Store {
  final _$statusAtom = Atom(name: '_AuthorizationStore.status');

  @override
  AuthorizationStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(AuthorizationStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  final _$getStatusAsyncAction = AsyncAction('_AuthorizationStore.getStatus');

  @override
  Future getStatus() {
    return _$getStatusAsyncAction.run(() => super.getStatus());
  }

  @override
  String toString() {
    return '''
status: ${status}
    ''';
  }
}
