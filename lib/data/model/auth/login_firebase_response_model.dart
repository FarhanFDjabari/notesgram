class LoginFirebaseResponseModel {
  final List<Results>? results;
  final int? canonicalRegistrationTokenCount;
  final int? failureCount;
  final int? successCount;
  final int? multicastId;

  LoginFirebaseResponseModel({
    this.results,
    this.canonicalRegistrationTokenCount,
    this.failureCount,
    this.successCount,
    this.multicastId,
  });

  LoginFirebaseResponseModel.fromJson(Map<String, dynamic> json)
      : results = (json['results'] as List?)
            ?.map((dynamic e) => Results.fromJson(e as Map<String, dynamic>))
            .toList(),
        canonicalRegistrationTokenCount =
            json['canonicalRegistrationTokenCount'] as int?,
        failureCount = json['failureCount'] as int?,
        successCount = json['successCount'] as int?,
        multicastId = json['multicastId'] as int?;

  Map<String, dynamic> toJson() => {
        'results': results?.map((e) => e.toJson()).toList(),
        'canonicalRegistrationTokenCount': canonicalRegistrationTokenCount,
        'failureCount': failureCount,
        'successCount': successCount,
        'multicastId': multicastId
      };
}

class Results {
  final String? messageId;

  Results({
    this.messageId,
  });

  Results.fromJson(Map<String, dynamic> json)
      : messageId = json['messageId'] as String?;

  Map<String, dynamic> toJson() => {'messageId': messageId};
}
