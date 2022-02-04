import 'dart:convert';

import 'package:atomicassets/src/params.dart';
import 'package:atomicassets/src/response.dart';
import 'package:http/http.dart' as http;
import "package:path/path.dart" as p;

class AtomicAssets {
  String endpoint = "";

  AtomicAssets(String _endpoint) {
    endpoint = p.join(_endpoint, "atomicassets/v1/");
  }

  // Custom get request wrapper handler.
  Future<BaseAPIResponse<T>> _get<T>(String url) async {
    final response = await http.get(Uri.parse(endpoint + url));

    var jsonData = jsonDecode(response.body);
    return BaseAPIResponse.fromJson(jsonData);
  }

  /// Fetch assets.
  ///
  /// Endpoint: `/v1/assets/`
  Future<BaseAPIResponse<List<dynamic>>> getAssets(
      {String? collectionName,
      String? schemaName,
      int? templateId,
      bool? isTransferable,
      bool? isBurnable,
      bool? burned,
      String? owner,
      String? match,
      String? matchImmutableName,
      String? matchMutableName,
      String? collectionBlacklist,
      String? collectionWhitelist,
      bool? onlyDuplicateTemplates,
      bool? hasBackedTokens,
      String? authorizedAccount,
      String? templateWhitelist,
      String? templateBlacklist,
      String? hideTemplatesByAccounts,
      bool? hideOffers,
      String? ids,
      String? lowerBound,
      String? upperBound,
      int? before,
      int? after,
      int? page,
      int? limit,
      String? order,
      String? sort}) async {
    var url = "assets";

    var params = parseParams({
      "collection_name": collectionName,
      "schema_name": schemaName,
      "template_id": templateId,
      "is_transferable": isTransferable,
      "is_burnable": isBurnable,
      "burned": burned,
      "owner": owner,
      "match": match,
      "match_immutable_name": matchImmutableName,
      "match_mutable_name": matchMutableName,
      "collection_blacklist": collectionBlacklist,
      "collection_whitelist": collectionWhitelist,
      "only_duplicate_templates": onlyDuplicateTemplates,
      "has_backed_tokens": hasBackedTokens,
      "authorized_account": authorizedAccount,
      "template_whitelist": templateWhitelist,
      "template_blacklist": templateBlacklist,
      "hide_templates_by_accounts": hideTemplatesByAccounts,
      "hide_offers": hideOffers,
      "ids": ids,
      "lower_bound": lowerBound,
      "upper_bound": upperBound,
      "before": before,
      "after": after,
      "page": page,
      "limit": limit,
      "order": order,
      "sort": sort,
    });

    if (params != "") {
      url += "?$params";
    }

    return await _get<List<dynamic>>(url);
  }
}
