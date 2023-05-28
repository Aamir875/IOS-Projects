//
//  DataClassForCellOne.swift
//  AppStoreClone
//
//  Created by Aamir khan on 28/04/23.
//

import Foundation

class DataClassForCellOne{
    static var instance = DataClassForCellOne()
    var header = ""
    
    var items = [ModelOfCellOne(headerName: "", labelOne: "EDITORS' CHOICE", labelTwo: "Share the Moment on Snapchat", labelThree: "Express yourself with lenses", labelFour: "SnapChat", labelFive: "Share the moment", largeImage: "LargeImageOne", iconImage: "snapchatLogo"),
                 ModelOfCellOne(headerName: "", labelOne: "NOW AVAILABLE", labelTwo: "Amazon Music's Featured Artist", labelThree: "Listen to the jonas Brothers", labelFour: "Amazon Music : Songs...", labelFive: "100 Million Songs, Add-free", largeImage: "largeImageTwo", iconImage: "amazonMusicLogo"),
                 ModelOfCellOne(headerName: "", labelOne: "OUR FAVORITES", labelTwo: "Get More Matches on Bumble", labelThree: "Date, network, and find friends", labelFour: "Bumble:Dating & Friends", labelFive: "Match, Date & Meet New People", largeImage: "imageThree", iconImage:"bumbleDatingLogo" )]
    
    func getItems()->[ModelOfCellOne]{
        return DataClassForCellOne.instance.items
    }
    
    func addItem(item:ModelOfCellOne){
        items.append(item)
    }
}

class DataClassForCellTwo{
    
    static var instance = DataClassForCellTwo()
    var header = "Must-Have Apps"
    
    var items = [ModelOfCellTwo(labelOne: "TikTok - See videos and shorts", labeTwo: "Videos, Music & Live Streams", lableThree: "Tinder - Dating New People", lableFour: "Chat, Date & Meet Friends", lableFive: "Youtube: Watch, Listen, Stream", lableSix: "Videos, Music and Live Stream", iconImageOne: "tikTokLogo", iconImageTwo: "tinderLogo", iconImageThree: "youtubeLogo"),
                 ModelOfCellTwo(labelOne: "Bumble: Dating & Friends APP", labeTwo: "Match, Date & Meet New People", lableThree: "Impulse - Brain Training", lableFour: "Mental health games", lableFive: "HBO MAX: Stream TV & Movies", lableSix: "Watch films & shows you love", iconImageOne: "bumbleDatingLogo", iconImageTwo: "impulseLogo", iconImageThree: "HBOLogo"),
                 ModelOfCellTwo(labelOne: "Hinge Dating APP: Meet Poople", labeTwo: "Match & date", lableThree: "Disney+Hotstar - see matches and movies", lableFour: "Unlimited entertainment", lableFive: "Hulu: Watch TV shows & movies", lableSix: "Stream films & download", iconImageOne: "hingeLogo", iconImageTwo: "DisneyLogo", iconImageThree: "huluLogo")]
    
    func getItems()->[ModelOfCellTwo]{
        return items
    }
    
    func addItem(item:ModelOfCellTwo){
        items.append(item)
    }
}

class DataClassForCellThree{
    
    static var instance = DataClassForCellThree()
    var header = "Events You Might Like"
    
    var items = [ModelOfCellThree(labelOne: "SPECIAL EVENT", labelTwo: "#METGALA 2023 ON TikTok", labelThree: "All the hot takes from fashion's biggest night", labelFour: "TikTok", labelFive: "Videos Music and live Stream", largeImage: "imageOneCellThree", imageIcon: "tikTokLogo"),
                 ModelOfCellThree(labelOne: "MAJOR UPDATE", labelTwo: "protect Unlimited Devices", labelThree: "Get More VPN Protection at no extra cost.", labelFour: "VPN by private internet", labelFive: "Hide the IP address and location", largeImage: "imageTwoCellThree", imageIcon: "VPNLogo"),
                 ModelOfCellThree(labelOne: "MAJOR UPDATE", labelTwo: "Try Incognito", labelThree: "Be seen on Tinder only by people you like", labelFour: "Tinder - Dating new person", labelFive: "Chat, Date and meet Friends", largeImage: "imageThreeCellThree", imageIcon: "tinderLogo")]
    
    func getItems()->[ModelOfCellThree]{
        return items
    }
    
    func addItem(item:ModelOfCellThree){
        items.append(item)
    }
}

class DataClassForCellFour{
    
    static var instance = DataClassForCellFour()
    var items = [ModelOfCellFour(labelOne: "FEATURED", labelTwo: "Best New Apps & Updates", labelThree: "View Collection", image: "imageForCellFour")]
    
    func getItems()->[ModelOfCellFour]{
        return items
    }
    
    func addItem(item:ModelOfCellFour){
        items.append(item)
    }
    
}

class DataClassForCellFive{
    
    static var instance = DataClassForCellFive()
    var items = [ModelOfCellFive(labelOne: "Noggin Preschool Learning", labelTwo: "Kids learning games & videos", labelThree: "Disney Coloring World", labelFour: "Draw, Paint, color & sketch", imageOne: "nogginImage", imageTwo: "disneyImage"),
    ModelOfCellFive(labelOne: "Hopscotch-Programming", labelTwo: "A bie-sized intro to conding", labelThree: "Hungry Caterpillar Play School", labelFour: "Preschool kids + toddler games", imageOne: "hopscotchImage", imageTwo: "hungryImage"),
    ModelOfCellFive(labelOne: "Crayola Create and Play", labelTwo: "Kids Games, Fun Drawing & Art", labelThree: "Hot wheels Unlimited", labelFour: "Car Racing & Trucks Kids Game", imageOne: "crayolaImage", imageTwo: "hotwheelsImage")]
    
    func getItems()->[ModelOfCellFive]{
        return items
    }
    
    func addItem(item:ModelOfCellFive){
        items.append(item)
    }
    
}
