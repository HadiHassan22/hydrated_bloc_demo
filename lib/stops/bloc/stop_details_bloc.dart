import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:hydrated_bloc_demo/stops/model/stop.dart';

part 'stop_details_state.dart';
part 'stop_details_event.dart';
part 'stop_details_bloc.freezed.dart';

class StopDetailsBloc extends HydratedBloc<StopDetailsEvent, StopDetailsState> {
  StopDetailsBloc({required this.stopId})
      : super(const StopDetailsState.initial()) {
    on<StopDetailsEvent>(_onEvent);
  }

  final String stopId;

  @override
  String get id => stopId;

  Future<void> _onEvent(
    StopDetailsEvent event,
    Emitter<StopDetailsState> emit,
  ) async {
    await event.map(
      stopDetailsFetched: (event) async => _onFetched(event, emit),
    );
    print(state);
  }

  Future<void> _onFetched(
    _StopDetailsFetched event,
    Emitter<StopDetailsState> emit,
  ) async {
    if (state is _LoadSuccess) {
      emit(const StopDetailsState.loadInProgress());
    }
    final stop = await getStopDetailsFromBackend();
    return emit(StopDetailsState.loadSuccess(stop));
  }

  @override
  StopDetailsState? fromJson(Map<String, dynamic> json) {
    return StopDetailsState.loadSuccess(
      Stop.fromJson(json['stop'] as Map<String, dynamic>),
    );
  }

  @override
  Map<String, dynamic>? toJson(StopDetailsState state) {
    return state.maybeWhen(
      orElse: () => null,
      loadSuccess: (stop) => <String, dynamic>{'stop': stop.toJson()},
    );
  }

  Future<Stop> getStopDetailsFromBackend() async => Future.delayed(
        const Duration(seconds: 2),
        () => Stop(
          id: stopId,
          packages: [
            const Package(id: '1'),
            const Package(id: '2'),
            const Package(id: '3'),
          ],
        ),
      );
}
