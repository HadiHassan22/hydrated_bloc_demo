import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc_demo/stops/stops.dart';

class StopsPage extends StatelessWidget {
  const StopsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StopsBloc(),
      child: const StopsView(),
    );
  }
}

class StopsView extends StatefulWidget {
  const StopsView({Key? key}) : super(key: key);

  @override
  _StopsViewState createState() => _StopsViewState();
}

class _StopsViewState extends State<StopsView> {
  @override
  void initState() {
    super.initState();
    context.read<StopsBloc>().add(const StopsEvent.stopsFetched());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Stops'),
      ),
      body: BlocBuilder<StopsBloc, StopsState>(
        builder: (context, state) => state.when(
          initial: () => Container(),
          loadInProgress: () =>
              const Center(child: CircularProgressIndicator()),
          loadSuccess: (stops) => ListView.builder(
            itemCount: stops.length,
            itemBuilder: (context, index) => ListTile(
              title: Text('Stop ${stops[index].id}'),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute<StopDetailsPage>(
                  builder: (context) => StopDetailsPage(
                    stopId: stops[index].id,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
