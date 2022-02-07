part of 'stops_bloc.dart';

@freezed
class StopsState with _$StopsState {
  const factory StopsState.initial() = _Initial;
  const factory StopsState.loadInProgress() = _LoadInProgress;
  const factory StopsState.loadSuccess(List<Stop> stops) = _LoadSuccess;
}
