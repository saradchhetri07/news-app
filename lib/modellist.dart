import 'package:news_app/model/categorymodel.dart';

List<Categorymodel> getcategories() {
  List<Categorymodel> categories = new List<Categorymodel>();
  Categorymodel categorymodel = new Categorymodel();

  categorymodel.imageurl =
      "https://images.unsplash.com/photo-1542744173-8e7e53415bb0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80";
  categorymodel.categoryname = "Business";
  categories.add(categorymodel);
  categorymodel = new Categorymodel();

  categorymodel.imageurl =
      "https://images.unsplash.com/photo-1514525253161-7a46d19cd819?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1567&q=80";

  categorymodel.categoryname = "Entertainment";
  categories.add(categorymodel);
  categorymodel = new Categorymodel();

  categorymodel.imageurl =
      "https://images.unsplash.com/photo-1532938911079-1b06ac7ceec7?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=2089&q=80";
  categorymodel.categoryname = "Health";
  categories.add(categorymodel);
  categorymodel = new Categorymodel();

  categorymodel.imageurl = "https://images.unsplash.com/photo-1432821596592-e2c18b78144f?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1950&q=80";
  categorymodel.categoryname = "General";
  categories.add(categorymodel);
  categorymodel = new Categorymodel();

  return categories;
}
