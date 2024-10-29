import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tracer_alumni_v1/model/mahasiswa.dart';
import 'package:tracer_alumni_v1/service_api.dart';
import 'package:tracer_alumni_v1/view/insert_mhs_dialog.dart';

class MhsView extends StatelessWidget {
  MhsView({super.key});

  final ServiceApi serviceApi = ServiceApi();

  Future<List<Mahasiswa>> fetchMahasiswaList() async {
    await serviceApi.auth();
    final getData = await serviceApi.getMhs();

    // Casting and converting to list of Mahasiswa objects
    final List<dynamic> getDataList = getData as List<dynamic>;
    return getDataList.map((e) => Mahasiswa.fromMap(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mahasiswa'),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => const InsertMhsDialog());
        },
      ),
      body: FutureBuilder<List<Mahasiswa>>(
        future: fetchMahasiswaList(),
        builder:
            (BuildContext context, AsyncSnapshot<List<Mahasiswa>> snapshot) {
          // Handle different states
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator()); // Show loading spinner
          } else if (snapshot.hasError) {
            return Center(
                child:
                    Text('Error: ${snapshot.error}')); // Show error if occurred
          } else if (snapshot.hasData) {
            final List<Mahasiswa>? mahasiswaList = snapshot.data;
            if (mahasiswaList != null && mahasiswaList.isNotEmpty) {
              return ListView.builder(
                itemCount: mahasiswaList.length,
                itemBuilder: (context, index) => Card(
                  clipBehavior: Clip.hardEdge,
                  margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Container(
                    color: index.isOdd ? Colors.red[100] : Colors.blue[100],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('ID'),
                              Text(mahasiswaList[index].id.toString())
                            ],
                          ),
                          const SizedBox(width: 16),
                          const Flexible(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text('Nama'),
                                Text('NIM'),
                                Text('Lulus'),
                                Text('Alamat'),
                                Text('No Hp'),
                                Text('Email'),
                              ],
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(mahasiswaList[index].name),
                                Text(mahasiswaList[index].nim),
                                Text(mahasiswaList[index].tahunLulus),
                                Text(mahasiswaList[index].alamat),
                                Text(mahasiswaList[index].noTelp),
                                Text(mahasiswaList[index].email),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
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
