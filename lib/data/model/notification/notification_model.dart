class NotificationModel {
  final int? id;
  final String? title;
  final String? body;
  final int? userId;
  final String? category;
  final String? createdAt;
  final bool? isRead;

  NotificationModel({
    this.id,
    this.title,
    this.body,
    this.userId,
    this.category,
    this.createdAt,
    this.isRead,
  });

  NotificationModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as int?,
        title = json['title'] as String?,
        body = json['body'] as String?,
        userId = json['userId'] as int?,
        category = json['category'] as String?,
        createdAt = json['createdAt'] as String?,
        isRead = json['is_read'] as bool?;

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'body': body,
        'userId': userId,
        'category': category,
        'createdAt': createdAt,
        'is_read': isRead
      };
}
