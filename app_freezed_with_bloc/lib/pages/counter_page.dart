import 'package:app_freezed_with_bloc/bloc/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  final String title;
  const CounterPage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: const Center(child: _CounterText()),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => (context)
                .read<CounterBloc>()
                .add(const CounterEvent.increment()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () =>
                (context).read<CounterBloc>().add(const CounterEvent.restart()),
            tooltip: 'Reset',
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}

class _CounterText extends StatelessWidget {
  const _CounterText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = context.watch<CounterBloc>().state;
    return state.when(
      initial: () => const FlutterLogo(size: 120),
      loading: () => const CircularProgressIndicator(),
      loaded: (counter) => Text(
        '$counter',
        style: Theme.of(context).textTheme.headline2,
      ),
    );

    //   if (state is CounterInitialState) {
    //     return const FlutterLogo(size: 120);
    //   } else if (state is CounterLoadingState) {
    //     return const CircularProgressIndicator();
    //   } else if (state is CounterLoadedState) {
    //     return Text(
    //       '${state.counter}',
    //       style: Theme.of(context).textTheme.headline2,
    //     );
    //   }
    //   return const SizedBox.shrink();
  }
}
