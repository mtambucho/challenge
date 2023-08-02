import 'package:challenge/preferences/application/preferences_provider.dart';
import 'package:challenge/settings/widgets/datetime_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FirstDaySettings extends StatelessWidget {
  const FirstDaySettings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'First day of the challenge',
          style: TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 8),
        Center(
          child: Consumer(builder: (context, ref, child) {
            final firstDay = ref.watch(preferencesProvider).startingDate;
            return DateTimePicker(
              dateTime: firstDay,
              onChanged: (value) => ref
                  .read(preferencesProvider.notifier)
                  .saveStartingDate(value),
            );
          }),
        ),
      ],
    );
  }
}
