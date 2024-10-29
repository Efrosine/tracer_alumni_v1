import 'package:flutter/material.dart';
import 'package:tracer_alumni_v1/model/fakultas.dart';
import 'package:tracer_alumni_v1/service_api.dart';
import 'package:tracer_alumni_v1/view/insert_fakultas_dialog.dart';

class FakultasView extends StatelessWidget {
  FakultasView({super.key});

  final ServiceApi serviceApi = ServiceApi();

  Future<List<Fakultas>> fetchFakultasList() async {
    await serviceApi.auth();
    final getData = await serviceApi.getFakultas();

    // Casting and converting to list of fakultas objects
    final List<dynamic> getDataList = getData as List<dynamic>;
    return getDataList.map((e) => Fakultas.fromMap(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Fakultas'),),
       floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => const InsertFakultasDialog());
        },
      ),
      body: FutureBuilder<List<Fakultas>>(
        future: fetchFakultasList(),
        builder: (BuildContext context, AsyncSnapshot<List<Fakultas>> snapshot) {
          // Handle different states
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator()); // Show loading spinner
          } else if (snapshot.hasError) {
            return Center(
                child:
                    Text('Error: ${snapshot.error}')); // Show error if occurred
          } else if (snapshot.hasData) {
            final List<Fakultas>? fakultasList = snapshot.data;
            if (fakultasList != null && fakultasList.isNotEmpty) {
              // ListView.builder for dynamic item count
              return ListView.builder(
                itemCount: fakultasList.length,
                itemBuilder: (BuildContext context, int index) {
                  final fakultas = fakultasList[index];
                  return ListTile(
                    title: Text(fakultas.name),
                    leading: Text(
                        'ID: ${fakultas.id}'), // Optional: Display ID as subtitle
                  );
                },
              );
            } else {
              return const Center(child: Text('No data found'));
            }
          } else {
            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
