import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(MaterialApp.router(
    routerConfig: _router,
  ));
}

// 入れ子構造に修正
final _router = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) => const FirstScreen(),
        routes: [
          GoRoute(
              path: 'second',
              builder: (context, state) => const SecondScreen(),
              routes: [
                GoRoute(
                  path: 'third',
                  builder: (context, state) => const ThirdScreen(),
                )
              ])
        ]),
  ],
);

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FirstScreen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                child: const Text('FirstからFirstへ'),
                onPressed: () {
                  GoRouter.of(context).push('/');
                }),
            ElevatedButton(
              child: const Text('FirstからSecondへ'),
              onPressed: () {
                // GoRouter.of(context).go('/second');
                GoRouter.of(context).push('/second');
              },
            ),
            ElevatedButton(
              child: const Text('FirstからThirdへ'),
              onPressed: () {
                GoRouter.of(context).go('/second/third');
                // GoRouter.of(context).push('/second/third');
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('SecondScreen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('SecondからSecondへ'),
                onPressed: () {
                  GoRouter.of(context).push('/second');
                },
              ),
              ElevatedButton(
                child: const Text('SecondからThirdへ'),
                onPressed: () {
                  // GoRouter.of(context).go('/second/third');
                  GoRouter.of(context).push('/second/third');
                },
              ),
              ElevatedButton(
                child: const Text('戻る'),
                onPressed: () {
                  GoRouter.of(context).pop();
                },
              ),
            ],
          ),
        ));
  }
}

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('ThirdScreen'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: const Text('戻る'),
                onPressed: () {
                  GoRouter.of(context).pop();
                },
              ),
            ],
          ),
        ));
  }
}
