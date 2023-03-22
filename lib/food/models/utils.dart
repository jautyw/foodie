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

  static List<Item> getMockedAddItems() {
    return [
      Item(
        name: "strawberry",
        image: "strawberry.png",
        expiryDate: "25-01-23",
        daysUntilExpiry: 3,
        maxPrice: 100,
        minPrice: 200,
      ),
      Item(
        name: "courgette",
        image: "courgette.png",
        expiryDate: "24-01-23",
        daysUntilExpiry: 8,
        maxPrice: 100,
        minPrice: 200,
      ),
      Item(
        name: "chilli",
        image: "chilli.png",
        expiryDate: "23-01-23",
        daysUntilExpiry: 14,
        maxPrice: 100,
        minPrice: 200,
      ),
      Item(
        name: "pepper",
        image: "pepper.png",
        expiryDate: "24-01-23",
        daysUntilExpiry: 6,
        maxPrice: 100,
        minPrice: 200,
      ),
      Item(
        name: "banana",
        image: "banana.png",
        expiryDate: "25-01-23",
        daysUntilExpiry: 3,
        maxPrice: 100,
        minPrice: 200,
      ),
      Item(
        name: "carrot",
        image: "carrot.png",
        expiryDate: "25-01-23",
        daysUntilExpiry: 3,
        maxPrice: 100,
        minPrice: 200,
      ),
      Item(
        name: "orange",
        image: "orange.png",
        expiryDate: "25-01-23",
        daysUntilExpiry: 3,
        maxPrice: 100,
        minPrice: 200,
      ),
      Item(
        name: "onion",
        image: "onion.png",
        expiryDate: "25-01-23",
        daysUntilExpiry: 3,
        maxPrice: 100,
        minPrice: 200,
      )
    ];
  }
}
