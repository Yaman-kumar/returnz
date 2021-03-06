///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class SomeRootEntityDataNativeBalance {
/*
{
  "amount": "0.00",
  "currency": "INR"
}
*/

  String? amount;
  String? currency;

  SomeRootEntityDataNativeBalance({
    this.amount,
    this.currency,
  });
  SomeRootEntityDataNativeBalance.fromJson(Map<String, dynamic> json) {
    amount = json['amount']?.toString();
    currency = json['currency']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['amount'] = amount;
    data['currency'] = currency;
    return data;
  }
}

class SomeRootEntityDataBalance {
/*
{
  "amount": "0.00000000",
  "currency": "LQTY"
}
*/

  String? amount;
  String? currency;

  SomeRootEntityDataBalance({
    this.amount,
    this.currency,
  });
  SomeRootEntityDataBalance.fromJson(Map<String, dynamic> json) {
    amount = json['amount']?.toString();
    currency = json['currency']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['amount'] = amount;
    data['currency'] = currency;
    return data;
  }
}

class SomeRootEntityData {
/*
{
  "id": "7f568fac-467e-5b84-8951-cd2ae5e9d5e6",
  "name": "LQTY Wallet",
  "primary": false,
  "type": "wallet",
  "currency": "LQTY",
  "balance": {
    "amount": "0.00000000",
    "currency": "LQTY"
  },
  "created_at": "2022-02-02T05:57:11Z",
  "updated_at": "2022-02-02T05:57:11Z",
  "resource": "account",
  "resource_path": "/v2/accounts/7f568fac-467e-5b84-8951-cd2ae5e9d5e6",
  "allow_deposits": true,
  "allow_withdrawals": true,
  "native_balance": {
    "amount": "0.00",
    "currency": "INR"
  }
}
*/

  String? id;
  String? name;
  bool? primary;
  String? type;
  String? currency;
  SomeRootEntityDataBalance? balance;
  String? createdAt;
  String? updatedAt;
  String? resource;
  String? resourcePath;
  bool? allowDeposits;
  bool? allowWithdrawals;
  SomeRootEntityDataNativeBalance? nativeBalance;

  SomeRootEntityData({
    this.id,
    this.name,
    this.primary,
    this.type,
    this.currency,
    this.balance,
    this.createdAt,
    this.updatedAt,
    this.resource,
    this.resourcePath,
    this.allowDeposits,
    this.allowWithdrawals,
    this.nativeBalance,
  });
  SomeRootEntityData.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toString();
    name = json['name']?.toString();
    primary = json['primary'];
    type = json['type']?.toString();
    currency = json['currency']?.toString();
    balance = (json['balance'] != null) ? SomeRootEntityDataBalance.fromJson(json['balance']) : null;
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    resource = json['resource']?.toString();
    resourcePath = json['resource_path']?.toString();
    allowDeposits = json['allow_deposits'];
    allowWithdrawals = json['allow_withdrawals'];
    nativeBalance = (json['native_balance'] != null) ? SomeRootEntityDataNativeBalance.fromJson(json['native_balance']) : null;
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['primary'] = primary;
    data['type'] = type;
    data['currency'] = currency;
    if (balance != null) {
      data['balance'] = balance!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['resource'] = resource;
    data['resource_path'] = resourcePath;
    data['allow_deposits'] = allowDeposits;
    data['allow_withdrawals'] = allowWithdrawals;
    if (nativeBalance != null) {
      data['native_balance'] = nativeBalance!.toJson();
    }
    return data;
  }
}

class SomeRootEntityPagination {
/*
{
  "ending_before": null,
  "starting_after": null,
  "previous_ending_before": null,
  "next_starting_after": "eab2f2a3-c863-56db-9035-164a4e6a3c32",
  "limit": 25,
  "order": "desc",
  "previous_uri": null,
  "next_uri": "/v2/accounts?starting_after=eab2f2a3-c863-56db-9035-164a4e6a3c32"
}
*/

  String? endingBefore;
  String? startingAfter;
  String? previousEndingBefore;
  String? nextStartingAfter;
  int? limit;
  String? order;
  String? previousUri;
  String? nextUri;

  SomeRootEntityPagination({
    this.endingBefore,
    this.startingAfter,
    this.previousEndingBefore,
    this.nextStartingAfter,
    this.limit,
    this.order,
    this.previousUri,
    this.nextUri,
  });
  SomeRootEntityPagination.fromJson(Map<String, dynamic> json) {
    endingBefore = json['ending_before']?.toString();
    startingAfter = json['starting_after']?.toString();
    previousEndingBefore = json['previous_ending_before']?.toString();
    nextStartingAfter = json['next_starting_after']?.toString();
    limit = json['limit']?.toInt();
    order = json['order']?.toString();
    previousUri = json['previous_uri']?.toString();
    nextUri = json['next_uri']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['ending_before'] = endingBefore;
    data['starting_after'] = startingAfter;
    data['previous_ending_before'] = previousEndingBefore;
    data['next_starting_after'] = nextStartingAfter;
    data['limit'] = limit;
    data['order'] = order;
    data['previous_uri'] = previousUri;
    data['next_uri'] = nextUri;
    return data;
  }
}

class SomeRootEntity {
/*
{
  "pagination": {
    "ending_before": null,
    "starting_after": null,
    "previous_ending_before": null,
    "next_starting_after": "eab2f2a3-c863-56db-9035-164a4e6a3c32",
    "limit": 25,
    "order": "desc",
    "previous_uri": null,
    "next_uri": "/v2/accounts?starting_after=eab2f2a3-c863-56db-9035-164a4e6a3c32"
  },
  "data": [
    {
      "id": "7f568fac-467e-5b84-8951-cd2ae5e9d5e6",
      "name": "LQTY Wallet",
      "primary": false,
      "type": "wallet",
      "currency": "LQTY",
      "balance": {
        "amount": "0.00000000",
        "currency": "LQTY"
      },
      "created_at": "2022-02-02T05:57:11Z",
      "updated_at": "2022-02-02T05:57:11Z",
      "resource": "account",
      "resource_path": "/v2/accounts/7f568fac-467e-5b84-8951-cd2ae5e9d5e6",
      "allow_deposits": true,
      "allow_withdrawals": true,
      "native_balance": {
        "amount": "0.00",
        "currency": "INR"
      }
    }
  ]
}
*/

  SomeRootEntityPagination? pagination;
  List<SomeRootEntityData?>? data;

  SomeRootEntity({
    this.pagination,
    this.data,
  });
  SomeRootEntity.fromJson(Map<String, dynamic> json) {
    pagination = (json['pagination'] != null) ? SomeRootEntityPagination.fromJson(json['pagination']) : null;
    if (json['data'] != null) {
      final v = json['data'];
      final arr0 = <SomeRootEntityData>[];
      v.forEach((v) {
        arr0.add(SomeRootEntityData.fromJson(v));
      });
      this.data = arr0;
    }
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (pagination != null) {
      data['pagination'] = pagination!.toJson();
    }
    if (this.data != null) {
      final v = this.data;
      final arr0 = [];
      v!.forEach((v) {
        arr0.add(v!.toJson());
      });
      data['data'] = arr0;
    }
    return data;
  }
}
