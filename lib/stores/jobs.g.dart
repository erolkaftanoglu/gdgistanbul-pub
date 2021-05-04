// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jobs.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Jobs on _Jobs, Store {
  final _$listJobsFutureAtom = Atom(name: '_Jobs.listJobsFuture');

  @override
  ObservableFuture<JobListResponse>? get listJobsFuture {
    _$listJobsFutureAtom.reportRead();
    return super.listJobsFuture;
  }

  @override
  set listJobsFuture(ObservableFuture<JobListResponse>? value) {
    _$listJobsFutureAtom.reportWrite(value, super.listJobsFuture, () {
      super.listJobsFuture = value;
    });
  }

  final _$_JobsActionController = ActionController(name: '_Jobs');

  @override
  Future<dynamic> fetchLatest() {
    final _$actionInfo =
        _$_JobsActionController.startAction(name: '_Jobs.fetchLatest');
    try {
      return super.fetchLatest();
    } finally {
      _$_JobsActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listJobsFuture: ${listJobsFuture}
    ''';
  }
}
