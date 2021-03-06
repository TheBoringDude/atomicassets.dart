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

  /// Fetch asset by id.
  ///
  /// Endpoint: `/v1/assets/{asset_id}`
  Future<BaseAPIResponse<Map<String, dynamic>>> getAssetID(String id) async {
    if (id == "") {
      throw Exception("Required params: [id]");
    }

    var url = "assets/$id";

    return await _get<Map<String, dynamic>>(url);
  }

  /// Fetch collections.
  ///
  /// Endpoint: `/v1/collections`
  Future<BaseAPIResponse<List<dynamic>>> getCollections(
      {String? author,
      String? match,
      String? authorizedAccount,
      String? notifyAccount,
      String? collectionBlacklist,
      String? collectionWhitelist,
      String? ids,
      String? lowerBound,
      String? upperBound,
      int? before,
      int? after,
      int? page,
      int? limit,
      String? order,
      String? sort}) async {
    var url = "collections";

    var params = parseParams({
      "author": author,
      "match": match,
      "authorized_account": authorizedAccount,
      "notify_account": notifyAccount,
      "collection_blacklist": collectionBlacklist,
      "collection_whitelist": collectionWhitelist,
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

  /// Fetch collection by its name.
  ///
  /// Endpoint: `/v1/collections/{collection_name}`
  Future<BaseAPIResponse<Map<String, dynamic>>> getCollectionName(
      String collectionName) async {
    if (collectionName == "") {
      throw Exception("Required params: [collectionName]");
    }

    var url = "collections/$collectionName";

    return await _get<Map<String, dynamic>>(url);
  }

  /// Fetch schemas.
  ///
  /// Endpoint: `/v1/schemas`
  Future<BaseAPIResponse<List<dynamic>>> getSchemas(
      {String? collectionName,
      String? authorizedAccount,
      String? schemaName,
      String? match,
      String? collectionBlacklist,
      String? collectionWhitelist,
      String? ids,
      String? lowerBound,
      String? upperBound,
      int? before,
      int? after,
      int? page,
      int? limit,
      String? order,
      String? sort}) async {
    var url = "schemas";

    var params = parseParams({
      "collection_name": collectionName,
      "schema_name": schemaName,
      "match": match,
      "authorized_account": authorizedAccount,
      "collection_blacklist": collectionBlacklist,
      "collection_whitelist": collectionWhitelist,
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

  /// Fetch collection by schema_name.
  ///
  /// Endpoint: `/v1/schemas/{collection_name}/{schema_name}`
  Future<BaseAPIResponse<Map<String, dynamic>>> getSchemaName(
      {required String collectionName, required String schemaName}) async {
    if (collectionName == "" || schemaName == "") {
      throw Exception("Required params: [collectionName] and [schemaNAme]");
    }

    var url = "schemas/$collectionName/$schemaName";

    return await _get<Map<String, dynamic>>(url);
  }

  /// Fetch templates.
  ///
  /// Endpoint: `/v1/templates`
  Future<BaseAPIResponse<List<dynamic>>> getTemplates(
      {String? collectionName,
      String? schemaName,
      int? issuedSuply,
      int? minIssuedSupply,
      int? maxIssuedSupply,
      bool? hasAssets,
      int? maxSupply,
      bool? isBurnable,
      bool? isTransferable,
      String? authorizedAccount,
      String? match,
      String? collectionBlacklist,
      String? collectionWhitelist,
      String? ids,
      String? lowerBound,
      String? upperBound,
      int? before,
      int? after,
      int? page,
      int? limit,
      String? order,
      String? sort}) async {
    var url = "schemas";

    var params = parseParams({
      "collection_name": collectionName,
      "schema_name": schemaName,
      "issued_supply": issuedSuply,
      "min_issued_supply": minIssuedSupply,
      "max_issued_supply": maxIssuedSupply,
      "has_assets": hasAssets,
      "max_supply": maxSupply,
      "is_burnable": isBurnable,
      "is_transferable": isTransferable,
      "match": match,
      "authorized_account": authorizedAccount,
      "collection_blacklist": collectionBlacklist,
      "collection_whitelist": collectionWhitelist,
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

  /// Find template by id.
  ///
  /// Endpoint: `/v1/templates/{collection_name}/{template_id}`
  Future<BaseAPIResponse<Map<String, dynamic>>> getTemplateID(
      {required String collectionName, required int templateID}) async {
    if (collectionName == "" || templateID == 0) {
      throw Exception("Required params: [collectionName] and [templateID]");
    }

    var url = "templates/$collectionName/$templateID";

    return await _get<Map<String, dynamic>>(url);
  }
}
