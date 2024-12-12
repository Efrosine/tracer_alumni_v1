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
          DropdownButtonFormField<String>(
            items:
                ['Bekerja', 'Wiraswasta', 'Melanjutkan Studi', 'Tidak Bekerja']
                    .map(
                      (e) => DropdownMenuItem(child: Text(e), value: e),
                    )
                    .toList(),
            decoration: InputDecoration(
              labelText: 'Status Saat Ini',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {},
          ),
          const Gap(12),
          Align(
            alignment: Alignment.bottomRight,
            child: ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => NextMhsPageDialog(),
                );
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.lightGreen),
              child: Text('Next'),
            ),
          )
        ],
      )),
    );
  }
}

class NextMhsPageDialog extends StatelessWidget {
  const NextMhsPageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog.fullscreen(
      child: Form(
        child: ListView(
          padding: const EdgeInsets.all(12),
          children: [
            DropdownButtonFormField<String>(
              items: [
                'Lembaga Pemerintah',
                'Perusahaan Nasional/BUMN/BUMD',
                'Perusahaan Internasional',
                'Lembaga Swasta',
                'Lembaga Sosial/Organisasi non-profit'
              ]
                  .map(
                    (e) => DropdownMenuItem(child: Text(e), value: e),
                  )
                  .toList(),
              decoration: InputDecoration(
                labelText: 'Kategori Instansi',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {},
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nama Instansi/Perusahaan',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Nama Atasan',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Email Atasan',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'No Telepon Instansi',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Alamat Instansi',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              items: [
                '3 bulan setelah lulus',
                '3-6 bulan setelah lulus',
                'lebih dari 6 s.d 12 bulan setelah lulus',
                'lebih dari 12 bulan setelah lulus'
              ]
                  .map(
                    (e) => DropdownMenuItem(
                        child: Text(
                          e,
                          overflow: TextOverflow.fade,
                        ),
                        value: e),
                  )
                  .toList(),
              decoration: InputDecoration(
                labelText: 'Waktu Untuk Pekerjaan Pertama',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {},
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              items: [
                'Rp. 0 - 2.150.000,00',
                'Rp. 2.150.001 - 3.450.000,00',
                'Rp. 3.450.001 - 9.999.999,00',
                '>Rp. 10.000.000,00'
              ]
                  .map(
                    (e) => DropdownMenuItem(child: Text(e), value: e),
                  )
                  .toList(),
              decoration: InputDecoration(
                labelText: 'Rata-rata Pendapatan per Bulan',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {},
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              items: [
                'Setingkat Lebih Tinggi',
                'Tidak Sama Sekali',
                'Kurang Erat',
                'Cukup Erat',
                'Erat'
              ]
                  .map(
                    (e) => DropdownMenuItem(child: Text(e), value: e),
                  )
                  .toList(),
              decoration: InputDecoration(
                labelText: 'Hubungan Bidang Studi dengan Pekerjaan',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {},
            ),
          ],
        ),
      ),
    );
  }
}
