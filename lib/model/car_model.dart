class Car {
  final int carId;
  final String rcNumber;
  final int capacity;
  final String model;
  final String remark;
  final int isActive;
  final int createdBy;
  final List<Attachment> attachments;

  Car({
    required this.carId,
    required this.rcNumber,
    required this.capacity,
    required this.model,
    required this.remark,
    required this.isActive,
    required this.createdBy,
    required this.attachments,
  });

  factory Car.fromJson(Map<String, dynamic> json) {
    return Car(
      carId: json['car_id'],
      rcNumber: json['rc_number'],
      capacity: json['capacity'],
      model: json['model'],
      remark: json['remark'],
      isActive: json['is_active'],
      createdBy: json['created_by'],
      attachments: (json['attachments'] as List<dynamic>)
          .map((attachment) => Attachment.fromJson(attachment))
          .toList(),
    );
  }
}

class Attachment {
  final String attachmentType;
  final String attachmentUrl;

  Attachment({
    required this.attachmentType,
    required this.attachmentUrl,
  });

  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      attachmentType: json['attachment_type'],
      attachmentUrl: (json['attachment_url'] as List<dynamic>)[0]['url'],
    );
  }
}
