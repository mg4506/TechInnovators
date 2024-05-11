
import UIKit
import Foundation

// Define user structure
struct User {
    var email: String
    var password: String
}
struct newUser{
    var email: String
    var password: String
    var mobileNumber : Int
}

// Define Place structure
struct Place {
    var placeImage: String
    var placeName: String
    var placeAddress: String
    var placeRating: String
}
struct profileSettings{
    var settingOption: String
}
// Define Categories structure
struct Categories {
    var categoriesImage: String
    var categoriesName: String
}

// Define CreatePost structure
struct CreatePost {
    var visitedLocation: String
    var placeName: String
    var duration: Int
    var tripExperience: String
    var tripPhotos: String
}

// Define TripCategories structure
struct TripCategories {
    var categoryName: String
}

// Define CreateTrip structure
struct CreateTrip {
    var destination: String
    var tripStartDate: String
    var tripEndDate: String
    var tripName: String
}

// Define TripItinerary class
class TripItinerary {
    let itineraryImage: String
    let itineraryName: String
    
    init(itineraryImage: String, itineraryName: String) {
        self.itineraryImage = itineraryImage
        self.itineraryName = itineraryName
    }
}

// Define Flight structure
struct Flight {
    let airline: String
    let flightNumber: String
    let departureTime: String
    let arrivalTime: String
    let from: String
    let to: String
}

// Define Cab structure
struct Cab {
    let pickUpLocation: String
       let pickUpDate: String
       let pickUpTime: String
       let dropOffLocation: String
       let dropOffDate: String
       let dropOffTime: String
}
struct Attraction{
    var attractionImage: String
    var attractionName: String
    var Address: String
    var attractionRating: String
}

// Define Hotel structure
struct Hotel {
    let name: String
    let address: String
    let rating: Double
    let checkInDate: String
    let checkOutDate: String
}
struct Meeting {
    var meetingName : String
    var meetingStartDate: String
    var meetingStartTime : String
    var meetingEndTime : String
    
}
struct Restaurant {
    let name: String
    let date: String
    let time: String
    let address: String
    let contactNumber: String
    
}
// Define subclasses of TripItinerary
class FlightItinerary: TripItinerary {
    let flightInfo: Flight
    
    init(flightInfo: Flight) {
        self.flightInfo = flightInfo
        super.init(itineraryImage: "flight_icon", itineraryName: "Flight")
    }
}
class RestaurantItinerary : TripItinerary {
    let restaurantInfo : Restaurant
    init(restaurantInfo: Restaurant) {
        self.restaurantInfo = restaurantInfo
        super.init(itineraryImage: "restaurant_icon", itineraryName: "Restaurant")
    }
}

class CabItinerary: TripItinerary {
    let cabInfo: Cab
    
    init(cabInfo: Cab) {
        self.cabInfo = cabInfo
        super.init(itineraryImage: "cab_icon", itineraryName: "Cab")
    }
}
class AttractionItinerary: TripItinerary {
    let attractionInfo: Attraction
    init(attractionInfo: Attraction) {
        self.attractionInfo = attractionInfo
        super.init(itineraryImage: "attraction_icon", itineraryName: "Attraction")
    }
}
class MeetingItinerary : TripItinerary{
    let meetingInfo : Meeting
    init(meetingInfo: Meeting) {
        self.meetingInfo = meetingInfo
        super.init(itineraryImage: "meeting_icon", itineraryName: "Meeting")
    }
}

class HotelItinerary: TripItinerary {
    let hotelInfo: Hotel
    
    init(hotelInfo: Hotel) {
        self.hotelInfo = hotelInfo
        super.init(itineraryImage: "hotel_icon", itineraryName: "Hotel")
    }
}

// Define TripEaseDataModel class
class TripEaseDataModel {
    private var userName: [User] = [
    User(email: "munish@gmail.com", password: "123@")
    ]
    private var newUserInfo: [newUser] = [
     newUser(email: "farhan@gmail.com", password: "farhan@42444", mobileNumber: 7375775756),
     newUser(email: "utkarsh@gmail.com", password: "utkarsh@", mobileNumber: 9878676775),
     newUser(email: "abhinav@gmail.com", password: "abhinav@123", mobileNumber: 555757555)
    ]
    private var placeList: [Place] = [
        Place(placeImage: "SheshMahal_Image", placeName: "Sheesh Mahal", placeAddress: "Amar Fort, Jaipur", placeRating: "4.8"),
        Place(placeImage: "PhoolMahal_Image", placeName: "Phool Mahal", placeAddress: "Mehrangarh, Jaipur", placeRating: "5"),
        Place(placeImage: "HawaMahal_Image", placeName: "Hawa Mahal", placeAddress: "Jaipur", placeRating: "4.8"),
        Place(placeImage: "NahargarhFort_Image", placeName: "Nahargarh Fort", placeAddress: "Jaipur", placeRating: "4.8"),
        Place(placeImage: "MysuruPalace_Image", placeName: "Mysuru Place", placeAddress: "Mysuru", placeRating: "4.6")
    ]
    
    private var wishlist: [Place] = [
    
        Place(placeImage: "NahargarhFort_Image", placeName: "Nahargarh Fort", placeAddress: "Jaipur", placeRating: "4.8"),
        Place(placeImage: "MysuruPalace_Image", placeName: "Mysuru Place", placeAddress: "Mysuru", placeRating: "4.6")
    
    ]
    
    private var categoryList: [Categories] = [
        Categories(categoriesImage: "Mountain_image", categoriesName: "Mountain"),
        Categories(categoriesImage: "Beach_image", categoriesName: "Beach"),
        Categories(categoriesImage: "Waterfall_image", categoriesName: "Waterfall"),
        Categories(categoriesImage: "Historical-image", categoriesName: "Historical")
    ]
    
    private var addTrip: [CreateTrip] = [
        CreateTrip(destination: "Mysuru, Karnataka", tripStartDate: "25 Apr 2024", tripEndDate: "27 Apr 2024", tripName: "Weekend Plan"),
        CreateTrip(destination: "Jaipur, Rajasthan", tripStartDate: "23 May 2024", tripEndDate: "25 Apr 2024", tripName: "Summer Vacation")
    ]
    
    private var pastTrip: [CreateTrip] = [
        CreateTrip(destination: "Jodhpur, Rajasthan", tripStartDate: "13 Mar 2024", tripEndDate: "16 Mar 2024", tripName: "Business Trip")
    ]
    
    private var tripItineraries: [TripItinerary] = [
        FlightItinerary(flightInfo: Flight(airline: "Delta", flightNumber: "DL123", departureTime: "08:00 PM", arrivalTime: "11:00 PM", from: "Chandigarh ", to: "Jaipur")),
        CabItinerary(cabInfo: Cab(pickUpLocation: "Sec 22 C Chandigarh", pickUpDate: "26 Apr 2024", pickUpTime: "06:00 pm", dropOffLocation: "Chd Airport", dropOffDate: "26 Apr 204", dropOffTime: "07:00pm")),
        HotelItinerary(hotelInfo: Hotel(name: "Marriott", address: "123 Main St, Anytown", rating: 4.5, checkInDate: "27 Apr 2024", checkOutDate: "28 Apr 2024")),
        AttractionItinerary(attractionInfo: Attraction(attractionImage: "NahargarhFort_image", attractionName: "NahargarhFort", Address: "jaipur", attractionRating: "5")),
        RestaurantItinerary(restaurantInfo: Restaurant(name: "Pal Restaurant", date: "27 Apr 2024", time: "12:00 pm", address: "Sco 123 near NahargarhFort", contactNumber: "9977975678"))
        
    ]
    
    private var settingsList: [profileSettings] = [
        profileSettings(settingOption: "Notification"), profileSettings(settingOption: "Edit profile"),
        profileSettings(settingOption: "change language"),
        profileSettings(settingOption: "saved trips"),
        profileSettings(settingOption: "share feedback"),
         profileSettings(settingOption: "Signout")
    ]
    func getSettings()-> [profileSettings]{
        return settingsList
    }
    func getPlace() -> [Place] {
        return placeList
    }
    
    func addToWishList(newPlace: Place) {
        wishlist.append(newPlace)
    }
    
    func getWishlist() -> [Place] {
        return wishlist
    }
    
    func getCategories() -> [Categories] {
        return categoryList
    }
    
    func getUpcomingTrips() -> [CreateTrip] {
        return addTrip
    }
    
    func getPastTrips() -> [CreateTrip] {
        return pastTrip
    }
    
    // show trips
    func getTripItineraries() -> [TripItinerary] {
        return tripItineraries
    }
    
    func getCommunityPosts() -> [CreatePost] {
        let communityPost: [CreatePost] = [
            CreatePost(visitedLocation: "Mysuru", placeName: "Mysuru Palace", duration: 2, tripExperience: "The palace is really nice.", tripPhotos: "place_Image")
        ]
        return communityPost
    }
}

// Sample usage of TripEaseDataModel
let tripEaseDataModel = TripEaseDataModel()

