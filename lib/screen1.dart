import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'counter.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light().copyWith(
        useMaterial3: true, 
      ),
      home: const MyHomePage(title: 'Counter App'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final counter = Provider.of<Counter>(context);
    Color countColor = counter.count == 0
        ? Colors.black
        : (counter.lastAction == 'increment' ? Colors.green : Colors.red);

    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: SizedBox(
                  width: 40,
                  height: 30,
                  child: FloatingActionButton(
                    onPressed: counter.reset,
                    tooltip: 'Reset',
                    backgroundColor: Colors.grey,
                    child: const Icon(
                      Icons.refresh,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
                child: Text(
                  'Counter Value',
                  style: TextStyle(
                    fontSize: 40,
                    fontFamily: 'testy',
                  ),
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(
                    scale: animation,
                    child: FadeTransition(
                      opacity: animation,
                      child: child,
                    ),
                  );
                },
                child: Text(
                  '${counter.count}',
                  key: ValueKey<int>(counter.count),
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        color: countColor,
                        fontSize: 100,
                      ),
                ),
              ),
              const SizedBox(height: 20),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 100),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return ScaleTransition(
                    scale: Tween<double>(begin: 0.1, end: 1).animate(animation),
                    child: child,
                  );
                },
                child: counter.count > 0
                    ? Row(
                        key: const ValueKey(1),
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            onPressed: counter.decrement,
                            tooltip: 'decrement',
                            child: const Icon(Icons.remove),
                          ),
                          const SizedBox(width: 30),
                          FloatingActionButton(
                            onPressed: counter.increment,
                            tooltip: 'increment',
                            child: const Icon(Icons.add),
                          ),
                        ],
                      )
                    : Row(
                        key: const ValueKey(2),
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            onPressed: counter.increment,
                            tooltip: 'increment',
                            child: const Icon(Icons.add),
                          ),
                        ],
                      ),
              )
            ]),
      ),
    );
  }
}
