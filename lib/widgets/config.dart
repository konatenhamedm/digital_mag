class Config{
  static String? apiUrl= "https://digital-mag.ci/demo2023/wp-json/wp/v2/";
  static String? categorieUrl = 'categories';
  static String postUrl = 'latest-posts/?page_size=10&category_id=';
  static String postUrlByCat = 'latest-posts?category_id=';
  static String postUrlCaroussel = 'latest-posts/?page_size=5&category_id=4';
  static String postUrlRecents= 'latest-posts/?page_size=20&category_id=4';
  static String postDetailUrl = 'post-details?id=';
  static String dateFormat = "dd-MM-yyyy";


}