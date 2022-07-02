import 'package:mobx/mobx.dart';

import 'store.state.enum.dart';

StoreState fromFuture(FutureStatus? status) {
  switch (status) {
    case FutureStatus.pending:
      return StoreState.loading;

    case FutureStatus.rejected:
      return StoreState.error;

    case FutureStatus.fulfilled:
      return StoreState.success;

    default:
      return StoreState.initial;
  }
}
