import 'package:odoo_rpc/odoo_rpc.dart';

bool isLogin = false;

class ServiceApi {
  final orpc = OdooClient('http://odoo.efrosine.my.id');

  Future<void> auth(String email, String pw) async {
    try {
      await orpc.authenticate('pajardb', email, pw);
      final res = await orpc.callRPC('/web/session/modules', 'call', {});
      print('orpc ${orpc.toString()}');
      print('Instaled modules : ${res.toString()}');
    } on OdooException catch (e) {
      print(e);
      orpc.close();
    }
  }

  Future<dynamic> validate() {
    return orpc.checkSession();
  }

  Future<dynamic> getProdi() async {
    return orpc.callKw({
      'model': 'tracer.prodi',
      'method': 'search_read',
      'args': [],
      'kwargs': {
        'context': {'bin_size': true},
        'domain': [],
        'fields': ['id', 'name'],
        'limit': 80,
      },
    });
  }

  Future<dynamic> postProdi(Map<String, dynamic> data) async {
    return orpc.callKw({
      'model': 'tracer.prodi',
      'method': 'create',
      'args': [data],
      'kwargs': {},
    });
  }

  Future<dynamic> delProdi(int id) async {
    return orpc.callKw({
      'model': 'tracer.prodi',
      'method': 'unlink',
      'args': [id],
      'kwargs': {},
    });
  }

  Future<dynamic> updateProdi(int id, Map<String, dynamic> data) async {
    return orpc.callKw({
      'model': 'tracer.prodi',
      'method': 'write',
      'args': [id, data],
      'kwargs': {},
    });
  }

  Future<dynamic> getFakultas() async {
    return orpc.callKw({
      'model': 'tracer.fakultas',
      'method': 'search_read',
      'args': [],
      'kwargs': {
        'context': {'bin_size': true},
        'domain': [],
        'fields': ['id', 'name'],
        'limit': 80,
      },
    });
  }

  Future<dynamic> postFakultas(Map<String, dynamic> data) async {
    return orpc.callKw({
      'model': 'tracer.fakultas',
      'method': 'create',
      'args': data,
      'kwargs': {},
    });
  }

  Future<dynamic> delFakultas(int id) async {
    return orpc.callKw({
      'model': 'tracer.fakultas',
      'method': 'unlink',
      'args': [id],
      'kwargs': {},
    });
  }

  Future<dynamic> updateFakultas(int id, Map<String, dynamic> data) async {
    return orpc.callKw({
      'model': 'tracer.fakultas',
      'method': 'write',
      'args': [id, data],
      'kwargs': {},
    });
  }

  Future<dynamic> getMhs() async {
    return orpc.callKw({
      'model': 'tracer.identity',
      'method': 'search_read',
      'args': [],
      'kwargs': {
        'context': {'bin_size': true},
        'domain': [],
        'fields': [
          // 'id',
          // 'name',
          // 'nim',
          // 'tahunlulus',
          // 'nomor_telepon',
          // 'email',
          // 'alamat_rumah'
          // 'status_saat_ini'
        ],
        // 'limit': 80,
      },
    });
  }

  Future<dynamic> postMhs(Map<String, dynamic> data) async {
    return orpc.callKw({
      'model': 'tracer.identity',
      'method': 'create',
      'args': data,
      'kwargs': {},
    });
  }

  Future<dynamic> delMhs(int id) async {
    return orpc.callKw({
      'model': 'tracer.identity',
      'method': 'unlink',
      'args': [id],
      'kwargs': {},
    });
  }

  Future<dynamic> updateMhs(int id, Map<String, dynamic> data) async {
    return orpc.callKw({
      'model': 'tracer.identity',
      'method': 'write',
      'args': [id, data],
      'kwargs': {},
    });
  }
}
