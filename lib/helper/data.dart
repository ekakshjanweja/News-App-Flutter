import 'package:news_app/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];
  CategoryModel categoryModel;

  categoryModel = CategoryModel(
    categoryName: 'General',
    imageUrl:
        'https://images.unsplash.com/photo-1507925921958-8a62f3d1a50d?ixid=MnwxMjA3fDB8MHxwaG9'
        '0by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80',
  );
  category.add(categoryModel);

  categoryModel = CategoryModel(
    categoryName: 'Business',
    imageUrl:
        'https://images.unsplash.com/photo-1579532537598-459ecdaf39cc?ixid=MnwxMjA3f'
        'DB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1868&q=80',
  );
  category.add(categoryModel);

  categoryModel = CategoryModel(
    categoryName: 'Technology',
    imageUrl:
        'https://images.unsplash.com/photo-1606229365485-93a3b8ee0385?ixid=MnwxMjA3fDB8MHxw'
        'aG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=334&q=80',
  );
  category.add(categoryModel);

  categoryModel = CategoryModel(
      categoryName: 'Entertainment',
      imageUrl:
          'https://images.unsplash.com/photo-1542204165-65bf26472b9b?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHx'
          'waG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=800&q=80');
  category.add(categoryModel);

  categoryModel = CategoryModel(
      categoryName: 'Health',
      imageUrl:
          'https://images.unsplash.com/photo-1505751172876-fa1923c5c528?ixid=MnwxMjA'
          '3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80');
  category.add(categoryModel);

  categoryModel = CategoryModel(
      categoryName: 'Sports',
      imageUrl:
          'https://images.unsplash.com/photo-1531415074968-036ba1b575da?ixid=MnwxMjA'
          '3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=800&q=80');
  category.add(categoryModel);

  return category;
}
