import Foundation

enum FavouriteError: String, Error {
    case unableToFavourite = "There is an error favouriting this coffee. Please try again later."
    case alreadyInFavourites = "You've already favourited this coffee."
}
