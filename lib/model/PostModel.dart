 

class ListPostModels {
  List<PostModel> items; 
  ListPostModels({this.items}); 
  ListPostModels.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = new List<PostModel>();
      json['items'].forEach((v) {
        items.add(new PostModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
 




class PostModel {
  String id;
  String title;
  String description;
  String image; 

  PostModel({this.id, this.title, this.description, this.image});

  PostModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    image = json['image']; 
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    data['image'] = this.image; 
    return data;
  }
}
