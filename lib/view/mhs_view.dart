import 'package:flutter/material.dart';
import 'package:tracer_alumni_v1/model/mahasiswa.dart';
import 'package:tracer_alumni_v1/service_api.dart';

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
      appBar: AppBar(title: Text('Mahasiswa'),),
      body: FutureBuilder<List<Mahasiswa>>(
        future: fetchMahasiswaList(),
        builder: (BuildContext context, AsyncSnapshot<List<Mahasiswa>> snapshot) {
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
                        // Create DataTable to display Mahasiswa data
              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('ID')),
                    DataColumn(label: Text('Name')),
                    DataColumn(label: Text('NIM')),
                    DataColumn(label: Text('Tahun Lulus')),
                    DataColumn(label: Text('No Telp')),
                    DataColumn(label: Text('Email')),
                    DataColumn(label: Text('Alamat')),
                  ],
                  rows: mahasiswaList
                      .map(
                        (mahasiswa) => DataRow(cells: [
                          DataCell(Text(mahasiswa.id.toString())),
                          DataCell(Text(mahasiswa.name)),
                          DataCell(Text(mahasiswa.nim)),
                          DataCell(Text(mahasiswa.tahunLulus)),
                          DataCell(Text(mahasiswa.noTelp)),
                          DataCell(Text(mahasiswa.email)),
                          DataCell(Text(mahasiswa.alamat)),
                        ]),
                      )
                      .toList(),
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
