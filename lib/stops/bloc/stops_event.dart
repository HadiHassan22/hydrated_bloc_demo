part of 'stops_bloc.dart';

@freezed
class StopsEvent with _$StopsEvent {
  const factory StopsEvent.stopsFetched() = _StopsFetched;
}
