import 'package:atomicassets/atomicassets.dart';

void main() async {
  var aa = AtomicAssets("https://wax.api.atomicassets.io");

  var data = await aa.getSchemaName(
      collectionName: "farmersworld", schemaName: "tickets");
  print(data.data);
}
