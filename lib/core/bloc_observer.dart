import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('🔵🔵🔵onChange(${bloc.runtimeType}, $change)');
    log('change $change');
    log('state :::::::${change.nextState}');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('🔴🔴🔴onError(${bloc.runtimeType}, $error)');
    super.onError(bloc, error, stackTrace);
  }
}
