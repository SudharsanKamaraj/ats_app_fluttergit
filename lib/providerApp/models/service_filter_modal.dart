class ServiceFilterModal {
  List<ServiceFilter>? serviceFilter;

  ServiceFilterModal({this.serviceFilter});

  ServiceFilterModal.fromJson(Map<String, dynamic> json) {
    if (json['service'] != null) {
      serviceFilter = <ServiceFilter>[];
      json['service'].forEach((v) {
        serviceFilter!.add(new ServiceFilter.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.serviceFilter != null) {
      data['service'] = this.serviceFilter!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ServiceFilter {
  int? id;
  String? serviceCategory;
  String? serviceType;
  String? serviceDuration;
  String? productImage;
  String? serviceFees;
  String? createdBy;
  String? updatedBy;
  String? createdAt;
  String? updatedAt;

  ServiceFilter(
      {this.id,
        this.serviceCategory,
        this.serviceType,
        this.serviceDuration,
        this.productImage,
        this.serviceFees,
        this.createdBy,
        this.updatedBy,
        this.createdAt,
        this.updatedAt});

  ServiceFilter.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    serviceCategory = json['service_category'];
    serviceType = json['service_type'];
    serviceDuration = json['service_duration'];
    productImage = json['product_image'];
    serviceFees = json['service_fees'];
    createdBy = json['created_by'];
    updatedBy = json['updated_by'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['service_category'] = this.serviceCategory;
    data['service_type'] = this.serviceType;
    data['service_duration'] = this.serviceDuration;
    data['product_image'] = this.productImage;
    data['service_fees'] = this.serviceFees;
    data['created_by'] = this.createdBy;
    data['updated_by'] = this.updatedBy;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    return data;
  }
}
