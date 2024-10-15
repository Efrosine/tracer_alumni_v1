import 'package:odoo_rpc/odoo_rpc.dart';

class ServiceApi {
    final orpc = OdooClient('http://192.168.99.254:10017');

  Future<void> auth() async{
    try{
      await orpc.authenticate('pajardb', 'admin@gmail.com', 'admin123');
      final res = await orpc.callRPC('/web/session/modules', 'call', {});
      print('Instaled modules : ${res.toString()}');
     
    }on OdooException catch (e){
      print(e);
      orpc.close();
      
    }
  }

  Future<dynamic> getProdi()async{
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
  Future<dynamic> getFakultas()async{
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
  Future<dynamic> getMhs()async{
    return orpc.callKw({
      'model': 'tracer.identity',
      'method': 'search_read',
      'args': [],
      'kwargs': {
        'context': {'bin_size': true},
        'domain': [],
        'fields': ['id', 'name','nim','tahunlulus','nomor_telepon','email','alamat_rumah'],
        'limit': 80,
      },
    });
  }
}