class CategoryModel{
  final String  title;
  final String image;

  CategoryModel({required this.image,required this.title});
}

final List <CategoryModel>categories=[
  CategoryModel(image: 'images/shoes.png', title: 'shoes'),
 CategoryModel(image: 'images/beauty.png', title: 'Beauty'),
   CategoryModel(image: 'images/image1.png', title: "women's\nFashion"),
  CategoryModel(image: 'images/shoes.png', title: 'shoes'),
   CategoryModel(image: 'images/beauty.png', title: 'Beauty'),
   CategoryModel(image: 'images/image1.png', title: "women's\nFashion"),
  CategoryModel(image: 'images/shoes.png', title: 'shoes')



];