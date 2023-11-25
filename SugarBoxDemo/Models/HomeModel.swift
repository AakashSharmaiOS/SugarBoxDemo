import Foundation

struct HomeModel : Codable {
	var data : [HomeModelData]?
	var pagination : Pagination?

	enum CodingKeys: String, CodingKey {

		case data = "data"
		case pagination = "pagination"
	}
}

struct HomeModelData : Codable {
    var _id : String?
    var contentId : String?
    var createdAt : String?
    var description : String?
    var title : String?
    var updatedAt : String?
    var contents : [Contents]?
    var id : String?
    var addedOn : String?
    var designId : DesignId?
    var designMeta : DesignMeta?
    var designSlug : String?
    var widgetType : String?

    enum CodingKeys: String, CodingKey {

        case _id = "_id"
        case contentId = "contentId"
        case createdAt = "createdAt"
        case description = "description"
        case title = "title"
        case updatedAt = "updatedAt"
        case contents = "contents"
        case id = "id"
        case addedOn = "addedOn"
        case designId = "designId"
        case designMeta = "designMeta"
        case designSlug = "designSlug"
        case widgetType = "widgetType"
    }
}

struct Pagination : Codable {
    var totalPages : Int?
    var currentPage : Int?
    var perPage : Int?
    var totalCount : Int?

    enum CodingKeys: String, CodingKey {

        case totalPages = "totalPages"
        case currentPage = "currentPage"
        case perPage = "perPage"
        case totalCount = "totalCount"
    }

}

struct Contents : Codable {
    var _id : String?
    var contentId : String?
    var assets : [Assets]?
    var contentType : String?
    var description : String?
    var isLicensed : Bool?
    var metaData : MetaData?
    var partnerContentId : String?
    var partnerId : Int?
    var releaseDate : String?
    var title : String?
    var partnerDetails : PartnerDetails?
    var partnerName : String?
    var addedOn : String?

    enum CodingKeys: String, CodingKey {

        case _id = "_id"
        case contentId = "contentId"
        case assets = "assets"
        case contentType = "contentType"
        case description = "description"
        case isLicensed = "isLicensed"
        case metaData = "metaData"
        case partnerContentId = "partnerContentId"
        case partnerId = "partnerId"
        case releaseDate = "releaseDate"
        case title = "title"
        case partnerDetails = "partnerDetails"
        case partnerName = "partnerName"
        case addedOn = "addedOn"
    }

}

struct DesignId : Codable {
    var _id : String?
    var designSlug : String?

    enum CodingKeys: String, CodingKey {

        case _id = "_id"
        case designSlug = "designSlug"
    }

}

struct DesignMeta : Codable {
    var title : String?

    enum CodingKeys: String, CodingKey {

        case title = "title"
    }
}

struct MetaData : Codable {
    var duration : Int?
    var isNonCompressed : Bool?
    var episode_number : Int?
    var enableDownloadOnDongle : Bool?
    var hasAssets : Bool?
    var shouldHaveChildren : Bool?
    var ageRating : String?

    enum CodingKeys: String, CodingKey {

        case duration = "duration"
        case isNonCompressed = "isNonCompressed"
        case episode_number = "episode_number"
        case enableDownloadOnDongle = "enableDownloadOnDongle"
        case hasAssets = "hasAssets"
        case shouldHaveChildren = "shouldHaveChildren"
        case ageRating = "ageRating"
    }
}

struct PartnerDetails : Codable {
    var partnerId : Int?
    var partnerName : String?
    var partnerShortName : String?

    enum CodingKeys: String, CodingKey {

        case partnerId = "partnerId"
        case partnerName = "partnerName"
        case partnerShortName = "partnerShortName"
    }
}

struct Assets : Codable {
    var assetType : String?
    var sourceUrl : String?
    var type : String?
    var sourcePath : String?

    enum CodingKeys: String, CodingKey {

        case assetType = "assetType"
        case sourceUrl = "sourceUrl"
        case type = "type"
        case sourcePath = "sourcePath"
    }

}
