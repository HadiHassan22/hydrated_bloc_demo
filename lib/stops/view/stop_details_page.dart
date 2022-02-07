import 'package:flutter/material.dart';
import 'package:hydrated_bloc_demo/stops/bloc/stop_details_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class StopDetailsPage extends StatelessWidget {
  const StopDetailsPage({required this.stopId, Key? key}) : super(key: key);

  final String stopId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StopDetailsBloc(stopId: stopId),
      child: const StopDetailsView(),
    );
  }
}

class StopDetailsView extends StatefulWidget {
  const StopDetailsView({Key? key}) : super(key: key);

  @override
  _StopDetailsViewState createState() => _StopDetailsViewState();
}

class _StopDetailsViewState extends State<StopDetailsView> {
  @override
  void initState() {
    super.initState();
    context
        .read<StopDetailsBloc>()
        .add(const StopDetailsEvent.stopDetailsFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stop Details'),
      ),
      body: BlocBuilder<StopDetailsBloc, StopDetailsState>(
        builder: (context, state) => state.when(
          initial: () => Container(),
          loadInProgress: () =>
              const Center(child: CircularProgressIndicator()),
          loadSuccess: (stop) => ListView.builder(
            itemCount: stop.packages.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(stop.packages[index].id),
            ),
          ),
        ),
      ),
    );
  }
}
