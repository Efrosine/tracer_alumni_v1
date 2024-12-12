import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tracer_alumni_v1/model/prodi.dart';
import 'package:tracer_alumni_v1/service_api.dart';

class InsertProdisDialog extends StatefulWidget {
  final Prodi? prodi;

  InsertProdisDialog({
    super.key,
    this.prodi,
  });

  @override
  State<InsertProdisDialog> createState() => _InsertProdisDialogState();
}

class _InsertProdisDialogState extends State<InsertProdisDialog> {
  final TextEditingController idControl = TextEditingController();

  final TextEditingController name = TextEditingController();

  final ServiceApi serviceApi = ServiceApi();

  Future<dynamic> postProdi(Prodi prodi) async {
    final postData = await serviceApi.postProdi(prodi.toMap());

    return postData;
  }

  Future<dynamic> updateProdi(Prodi prodi) async {
    final postData = await serviceApi.updateProdi(prodi.id, prodi.toMap());

    return postData;
  }

  @override
  void initState() {
    if (widget.prodi != null) {
      idControl.text = widget.prodi!.id.toString();
      name.text = widget.prodi!.name;
    }
    super.initState();
  }

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
                'Input Data Prodi',
                style: Theme.of(context).textTheme.headlineMedium,
              )),
          const Gap(24),
          TextFormField(
            controller: name,
            decoration: const InputDecoration(
              labelText: 'Nama',
              border: OutlineInputBorder(),
            ),
          ),
          Gap(12),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () async {
                Prodi prodi = Prodi(
                  id: int.parse(idControl.text),
                  name: name.text,
                );
                var temp = widget.prodi != null
                    ? await updateProdi(prodi)
                    : await postProdi(prodi);
                print(temp);
                Navigator.pop(context, prodi);
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.lightGreen),
              child: Text('Save'),
            ),
          )
        ],
      )),
    );
  }
}
