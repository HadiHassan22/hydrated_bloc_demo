import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:hydrated_bloc_demo/stops/model/stop.dart';

part 'stops_state.dart';
part 'stops_event.dart';
part 'stops_bloc.freezed.dart';

class StopsBloc extends HydratedBloc<StopsEvent, StopsState> {
  StopsBloc() : super(const StopsState.initial()) {
    on<StopsEvent>(_onEvent);
  }

  Future<void> _onEvent(
    StopsEvent event,
    Emitter<StopsState> emit,
  ) async {
    await event.map(
      stopsFetched: (event) async => await _onStopsFetched(event, emit),
    );
    print(state);
  }

  Future<void> _onStopsFetched(
    _StopsFetched event,
    Emitter<StopsState> emit,
  ) async {
    emit(const StopsState.loadInProgress());
    final List<Stop> stops = await getStopsFromBackend();
    return emit(StopsState.loadSuccess(stops));
  }

  Future<List<Stop>> getStopsFromBackend() async => await Future.delayed(
        const Duration(seconds: 2),
        () => [
          const Stop(id: '1'),
          const Stop(id: '2'),
        ],
      );

  @override
  StopsState? fromJson(Map<String, dynamic> json) {}

  @override
  Map<String, dynamic>? toJson(StopsState state) {
    return state.maybeWhen(
      orElse: () => null,
      loadSuccess: (stops) => <String, dynamic>{'stops': jsonEncode(stops)},
    );
  }
}
