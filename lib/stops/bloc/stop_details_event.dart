part of 'stop_details_bloc.dart';

@freezed
class StopDetailsEvent with _$StopDetailsEvent {
  const factory StopDetailsEvent.stopDetailsFetched() = _StopDetailsFetched;
}
