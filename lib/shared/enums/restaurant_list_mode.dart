

enum RestaurantListMode {
    NEAR,
    WANT,
    RECOMMEND,
    DONE
}


extension RestaurantListExtension on RestaurantListMode {
    String get convertedText {
        switch (this) {
            case RestaurantListMode.NEAR:
                return "near";
            case RestaurantListMode.WANT:
                return "want";
            case RestaurantListMode.RECOMMEND:
                return "recommend";
            case RestaurantListMode.DONE:
                return "done";

            default:
                return "near";
        }
    }
}