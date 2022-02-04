import 'package:atomicassets/atomicassets.dart';

void main() async {
  var aa = AtomicAssets("https://wax.api.atomicassets.io");

  var data = await aa.getAssets();
  print(data.data?[0]);

  var nft = await aa.getAssetID("1099596594113");
  print(nft.data);
}
