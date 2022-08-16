import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Model extends ChangeNotifier {
  var one = 0;
  var two = 0;

  void inc1(cb) {
    one += 1;
    notifyListeners();
  }

  void inc2() {
    two += 1;
    notifyListeners();
  }
}

// class ModelProvider extends InheritedNotifier {
//   final Model model;
//   const ModelProvider({
//     Key? key,
//     required this.model,
//     required Widget child,
//   }) : super(
//           key: key,
//           child: child,
//           notifier: model,
//         );

//   static ModelProvider? watch(BuildContext context) {
//     return context.dependOnInheritedWidgetOfExactType<ModelProvider>();
//   }

//   static ModelProvider? read(BuildContext context) {
//     final widget = context
//         .getElementForInheritedWidgetOfExactType<ModelProvider>()
//         ?.widget;
//     return widget is ModelProvider ? widget : null;
//   }
// }

class ExampleWidget extends StatefulWidget {
  const ExampleWidget({Key? key}) : super(key: key);

  @override
  _ExampleWidgetState createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
        create: (context) => Model(),
        child: _View(),
      );
}

class _View extends StatelessWidget {
  const _View({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final model = ModelProvider.read(context)!.model;
    final model = context.read<Model>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Example'),
      ),
      body: SafeArea(
          child: Column(
        children: [
          ElevatedButton(
            onPressed: model.inc1,
            child: Text('one'),
          ),
          ElevatedButton(
            onPressed: model.inc2,
            child: Text('two'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text('complex'),
          ),
          _OneWidget(),
          _TwoWidget(),
          _ThreeWidget(),
          _FourWidget(),
        ],
      )),
    );
  }
}

class _OneWidget extends StatelessWidget {
  const _OneWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = context.watch<Model>().one;
    // final value = ModelProvider.watch(context)!.model.one;
    return Text('$value');
  }
}

class _TwoWidget extends StatelessWidget {
  const _TwoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = context.watch<Model>().two;
    // final value = ModelProvider.watch(context)!.model.two;
    return Text('$value');
  }
}

class _ThreeWidget extends StatelessWidget {
  const _ThreeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = 0;
    return Text('$value');
  }
}

class _FourWidget extends StatelessWidget {
  const _FourWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final value = 0;
    return Text('$value');
  }
}
