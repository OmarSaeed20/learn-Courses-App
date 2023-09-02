import '/index.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Flutter Demo Home Page'),
      ),
      body: _body(),
      floatingActionButton: _floatingActionButton(context),
    );
  }

  Center _body() => Center(
        child: BlocBuilder<LearnBloc, LearnState>(
          builder: (context, state) {
            LearnBloc bloc = sl<LearnBloc>();
            // LearnBloc bloc = BlocProvider.of<LearnBloc>(context);
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('You have pushed the button this many times:'),
                Text(
                  // '${state.count}',
                  '${bloc.state.count}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 10),
              ],
            );
          },
        ),
      );

  Row _floatingActionButton(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            heroTag: "heroTag <1>",
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            onPressed: () =>
                sl<LearnBloc>().add(Increment()),
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            heroTag: "heroTag <2>",
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
            onPressed: () => sl<LearnBloc>().add(Decrement()),
            tooltip: 'Decrement',
            child: const Icon(Icons.remove),
          ),
        ],
      );
}
