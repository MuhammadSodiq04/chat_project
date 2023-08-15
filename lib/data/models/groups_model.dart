class GroupsModel {
  String groupId;
  String groupName;
  String description;
  String imageUrl;
  String createdAt;

  GroupsModel({
    required this.groupId,
    required this.groupName,
    required this.description,
    required this.imageUrl,
    required this.createdAt,
  });

  GroupsModel copyWith({
    String? groupId,
    String? groupName,
    String? description,
    String? imageUrl,
    String? createdAt,
  }) {
    return GroupsModel(
      groupId: groupId ?? this.groupId,
      groupName: groupName ?? this.groupName,
      description: description ?? this.description,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  factory GroupsModel.fromJson(Map<String, dynamic> jsonData) {
    return GroupsModel(
      groupId: jsonData['groupId'] as String? ?? "",
      groupName: jsonData['groupName'] as String? ?? '',
      description: jsonData['description'] as String? ?? '',
      imageUrl: jsonData['imageUrl'] as String? ?? '',
      createdAt: jsonData['createdAt'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'userId': groupId,
      'userName': groupName,
      'email': description,
      'imageUrl': imageUrl,
      'createdAt': createdAt,
    };
  }

  @override
  String toString() {
    return ''''
       groupId : $groupId,
       groupName : $groupName,
       description : $description,
       imageUrl : $imageUrl,
       createdAt : $createdAt, 
      ''';
  }
}