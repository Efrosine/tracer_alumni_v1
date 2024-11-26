import 'package:flutter/material.dart';
import 'package:tracer_alumni_v1/model/prodi.dart';
import 'package:tracer_alumni_v1/service_api.dart';
import 'package:tracer_alumni_v1/view/insert_prodi_dialog.dart';
import 'package:tracer_alumni_v1/view/signin_page.dart';

class ProdiView extends StatefulWidget {
  ProdiView({super.key});

  @override
  State<ProdiView> createState() => _ProdiViewState();
}

class _ProdiViewState extends State<ProdiView> {
  final ServiceApi serviceApi = ServiceApi();

  Future<List<Prodi>> fetchProdiList() async {
    await serviceApi.auth('admin@gmail.com', 'admin123');
    final getData = await serviceApi.getProdi();

    // Casting and converting to list of Prodi objects
    final List<dynamic> getDataList = getData as List<dynamic>;
    return getDataList.map((e) => Prodi.fromMap(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prodi'),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginPage(),
                    ));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      floatingActionButton: isLogin
          ? FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => InsertProdisDialog()).then(
                  (value) => setState(() {}),
                );
              },
            )
          : null,
      body: FutureBuilder<List<Prodi>>(
        future: fetchProdiList(),
        builder: (BuildContext context, AsyncSnapshot<List<Prodi>> snapshot) {
          // Handle different states
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
                child: CircularProgressIndicator()); // Show loading spinner
          } else if (snapshot.hasError) {
            return Center(
                child:
                    Text('Error: ${snapshot.error}')); // Show error if occurred
          } else if (snapshot.hasData) {
            final List<Prodi>? prodiList = snapshot.data;
            if (prodiList != null && prodiList.isNotEmpty) {
              // ListView.builder for dynamic item count
              return ListView.builder(
                itemCount: prodiList.length,
                itemBuilder: (BuildContext context, int index) {
                  final prodi = prodiList[index];
                  return ListTile(
                    title: Text(prodi.name),
                    leading: Text(
                      'ID: ${prodi.id}',
                    ),
                    trailing: isLogin
                        ? Wrap(
                            children: [
                              IconButton(
                                onPressed: () {
                                  showDialog(
                                      context: context,
                                      builder: (context) => InsertProdisDialog(
                                            prodi: prodi,
                                          )).then((value) => setState(() {}));
                                },
                                icon: const Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () async {
                                  await serviceApi.delProdi(prodi.id);
                                  setState(() {});
                                },
                                icon: const Icon(Icons.delete),
                              ),
                            ],
                          )
                        : null,
                    // Optional: Display ID as subtitle
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
