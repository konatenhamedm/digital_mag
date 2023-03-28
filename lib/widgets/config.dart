class Config{
  static String? api= "https://www.digital-mag.ci";
  static String? apiUrl= "https://www.digital-mag.ci/wp-json/wp/v2/";
  static String? categorieUrl = 'categories';
  static String postUrl = 'latest-posts/?page_size=10&category_id=';
  static String postUrlByCat = 'latest-posts?category_id=';
  static String postUrlCaroussel = 'latest-posts/?page_size=5';
  static String postUrlRecents= 'latest-posts/?page_size=20&category_id=4';
  static String postDetailUrl = 'post-details?id=';
  static String dateFormat = "dd-MM-yyyy";
  static String login = "/wp-json/add/v1/restUserLogins";
  static String inscription = "/wp-json/add/v1/registerr_user";


}