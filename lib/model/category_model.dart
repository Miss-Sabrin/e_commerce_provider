class CategoryModel{
  final String  title;
  final String image;
  

  CategoryModel({required this.image,required this.title});
}

final List <CategoryModel>categories=[
  CategoryModel( title: "All", image: "images/all.png",),
 CategoryModel(image: 'images/shoes.png', title: 'shoes'),
   CategoryModel( title: "Beauty",image: "images/beauty.png",),
  CategoryModel( title: "Women's\nFashion",image: "images/image1.png",),
   CategoryModel( title: "Jewelry", image: "images/jewelry.png",),
   CategoryModel(  title: "Men's\nFashion",image: "images/men.png",),



];