import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class ThemePage extends ConsumerStatefulWidget {
  const ThemePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ThemePageState();
}

class _ThemePageState extends ConsumerState<ThemePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text('Hello'),
              ),
            ),
            Row(
              children: [
                const Chip(label: Text('Chip')),
                Chip(
                  label: const Text('Image'),
                  onDeleted: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
