import '../services/db_service.dart';

class UserRepository {
  final DBService dbService;

  UserRepository(this.dbService);

  Future<List<Map<String, dynamic>>> getData() async {
    List<Map<String, dynamic>> data = [];
    try {
      List<List<dynamic>> results = await dbService.connection
          .query('SELECT * FROM public.energy_data LIMIT 1');
      for (var row in results) {
        data.add({
          'year': row[0],
          'month': row[1],
          'total': row[2],
          '南投縣': row[3],
          '台北市': row[4],
          '台南市': row[5],
          '台東縣': row[6],
          '嘉義市': row[7],
          '嘉義縣': row[8],
          '基隆市': row[9],
          '宜蘭縣': row[10],
          '屏東縣': row[11],
          '彰化縣': row[12],
          '新北市': row[13],
          '新竹市': row[14],
          '新竹縣': row[15],
          '桃園市': row[16],
          '澎湖縣': row[17],
          '花蓮縣': row[18],
          '苗栗縣': row[19],
          '連江縣': row[20],
          '金門縣': row[21],
          '雲林縣': row[22],
          '高雄市': row[23],
        });
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      await dbService.connection.close();
    }
    return data;
  }
}
