import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class InsertMhsDialog extends StatelessWidget {
  const InsertMhsDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Form(
          child: ListView(
        padding: const EdgeInsets.all(12),
        children: [
          Align(
              alignment: Alignment.center,
              child: Text(
                'Input Data Alumni',
                style: Theme.of(context).textTheme.headlineMedium,
              )),
          const Gap(24),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Nama',
              border: OutlineInputBorder(),
            ),
          ),
          const Gap(12),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Nim',
              border: OutlineInputBorder(),
            ),
          ),
          const Gap(12),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Tahun Lulus',
              border: OutlineInputBorder(),
            ),
          ),
          const Gap(12),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Alamat',
              border: OutlineInputBorder(),
            ),
          ),
          const Gap(12),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'No HP',
              border: OutlineInputBorder(),
            ),
          ),
          const Gap(12),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Alamat',
              border: OutlineInputBorder(),
            ),
          ),
          const Gap(12),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(foregroundColor: Colors.white
              ,backgroundColor: Colors.lightGreen),
              child: Text('Save'),
            ),
          )
        ],
      )),
    );
  }
}
