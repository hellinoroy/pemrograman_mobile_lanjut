class Comment {
  final int id;
  final int userId;
  final int productId;
  final String userName;
  final String comment;
  final double rating;
  

  final DateTime createdAt;
  final DateTime? editedAt;

  Comment({
    required this.id,
    required this.userId,
    required this.productId,
    required this.userName,
    required this.comment,
    required this.rating,
    required this.createdAt,
    required this.editedAt,
  });

  factory Comment.fromJson(
    Map<String, dynamic> json,
  ) {
    return Comment(
      id: json['id'],

      userId:
          json['user_id'],

      productId:
          json['product_id'],

      userName: 
          json['user_name'],

      comment:
          json['comment'],

      rating:
          json['rating']
              .toDouble(),

      createdAt:
          DateTime.parse(
        json[
            'created_at'],
      ),

      editedAt:
          json['edited_at'] != null
          ? DateTime.parse(
            json['edited_at'],
          )
        : null,

    );
  }

  Map<String, dynamic>
      toJson() {
    return {
      'id': id,

      'user_id':
          userId,

      'product_id':
          productId,

      'comment':
          comment,

      'rating':
          rating,
    };
  }
}