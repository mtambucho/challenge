import 'package:challenge/constants/strings.dart';
import 'package:challenge/features/preferences/application/preferences_provider.dart';
import 'package:challenge/features/settings/widgets/datetime_picker.dart';
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
          AppStrings.firstDay,
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
