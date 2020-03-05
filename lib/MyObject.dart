class MyObject{
  final int id;
  final String title;
  final String url;


  MyObject({this.id,this.title,this.url});



  factory MyObject.fromJson(Map<String,dynamic> json){
    
    return new MyObject(
      id: int.parse(json['id'].toString()),
      title: json['title'],
      url:json['url']
      
      
    );
    
    
  }



}