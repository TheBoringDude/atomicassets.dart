import 'package:atomicassets/atomicassets.dart';

void main() async {
  var aa = AtomicAssets("https://wax.api.atomicassets.io");

  var data = await aa.getTemplateID(
      collectionName: "farmersworld", templateID: 378718);
  print(data.data);
}
