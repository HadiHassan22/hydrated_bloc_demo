part of 'stop_details_bloc.dart';

@freezed
class StopDetailsState with _$StopDetailsState {
  const factory StopDetailsState.initial() = _Initial;
  const factory StopDetailsState.loadInProgress() = _LoadInProgress;
  const factory StopDetailsState.loadSuccess(Stop stop) = _LoadSuccess;
}
