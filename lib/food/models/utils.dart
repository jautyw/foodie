import 'item_model.dart';

class Utils {
  static List<Item> getMockedItems() {
    return [
      Item(
        name: "apple",
        image: "apple.png",
        expiryDate: "25-01-23",
        daysUntilExpiry: 3,
        maxPrice: 100,
        minPrice: 200,
      ),
      Item(
        name: "aubergine",
        image: "aubergine.png",
        expiryDate: "24-01-23",
        daysUntilExpiry: 2,
        maxPrice: 100,
        minPrice: 200,
      ),
      Item(
        name: "avocado",
        image: "avocado.png",
        expiryDate: "23-01-23",
        daysUntilExpiry: 1,
        maxPrice: 100,
        minPrice: 200,
      ),
      Item(
        name: "brocolli",
        image: "brocolli.png",
        expiryDate: "24-01-23",
        daysUntilExpiry: 2,
        maxPrice: 100,
        minPrice: 200,
      ),
      Item(
        name: "pineapple",
        image: "pineapple.png",
        expiryDate: "25-01-23",
        daysUntilExpiry: 3,
        maxPrice: 100,
        minPrice: 200,
      )
    ];
  }
}
