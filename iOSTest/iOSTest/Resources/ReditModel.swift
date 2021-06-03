// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//

import Foundation

// MARK: - newJSONDecoderRedditModel
struct newJSONDecoderRedditModel: Codable {
    let kind: String
    let data: newJSONDecoderRedditModelData
}

// MARK: - newJSONDecoderRedditModelData
struct newJSONDecoderRedditModelData: Codable {
    let modhash: String
    let dist: Int
    let children: [newJSONDecoderChild]
    let after: String
    let before: JSONNull?
}

// MARK: - newJSONDecoderChild
struct newJSONDecoderChild: Codable {
    let kind: newJSONDecoderKind
    let data: newJSONDecoderChildData
}

// MARK: - newJSONDecoderChildData
struct newJSONDecoderChildData: Codable {
    let approvedAtUTC: JSONNull?
    let subreddit: newJSONDecoderSubreddit
    let selftext, authorFullname: String
    let saved: Bool
    let modReasonTitle: JSONNull?
    let gilded: Int
    let clicked: Bool
    let title: String
    let linkFlairRichtext: [JSONAny]
    let subredditNamePrefixed: newJSONDecoderSubredditNamePrefixed
    let hidden: Bool
    let pwls: Int
    let linkFlairCSSClass: String?
    let downs, thumbnailHeight: Int
    let hideScore: Bool
    let name: String
    let quarantine: Bool
    let linkFlairTextColor: newJSONDecoderFlairTextColor
    let upvoteRatio: Double
    let authorFlairBackgroundColor: String?
    let subredditType: newJSONDecoderSubredditType
    let ups, totalAwardsReceived: Int
    let mediaEmbed: newJSONDecoderMediaEmbed
    let thumbnailWidth: Int
    let authorFlairTemplateID: JSONNull?
    let isOriginalContent: Bool
    let userReports: [JSONAny]
    let secureMedia: newJSONDecoderMedia?
    let isRedditMediaDomain, isMeta: Bool
    let category: JSONNull?
    let secureMediaEmbed: newJSONDecoderMediaEmbed
    let linkFlairText: newJSONDecoderLinkFlairText?
    let canModPost: Bool
    let score: Int
    let approvedBy: JSONNull?
    let isCreatedFromAdsUI, authorPremium: Bool
    let thumbnail: String
    let edited: Bool
    let authorFlairCSSClass: newJSONDecoderAuthorFlairCSSClass?
    let authorFlairRichtext: [JSONAny]
    let gildings: newJSONDecoderGildings
    let postHint: newJSONDecoderPostHint
    let contentCategories: JSONNull?
    let isSelf: Bool
    let modNote: JSONNull?
    let created: Int
    let linkFlairType: newJSONDecoderFlairType
    let wls: Int
    let removedByCategory, bannedBy: JSONNull?
    let authorFlairType: newJSONDecoderFlairType
    let domain: newJSONDecoderDomain
    let allowLiveComments: Bool
    let selftextHTML, likes, suggestedSort, bannedAtUTC: JSONNull?
    let urlOverriddenByDest: String
    let viewCount: JSONNull?
    let archived, noFollow, isCrosspostable, pinned: Bool
    let over18: Bool
    let preview: newJSONDecoderPreview
    let allAwardings: [newJSONDecoderAllAwarding]
    let awarders: [JSONAny]
    let mediaOnly, canGild, spoiler, locked: Bool
    let authorFlairText: String?
    let treatmentTags: [JSONAny]
    let visited: Bool
    let removedBy, numReports, distinguished: JSONNull?
    let subredditID: newJSONDecoderSubredditID
    let modReasonBy, removalReason: JSONNull?
    let linkFlairBackgroundColor, id: String
    let isRobotIndexable: Bool
    let reportReasons: JSONNull?
    let author: String
    let discussionType: JSONNull?
    let numComments: Int
    let sendReplies: Bool
    let whitelistStatus: newJSONDecoderWhitelistStatus
    let contestMode: Bool
    let modReports: [JSONAny]
    let authorPatreonFlair: Bool
    let authorFlairTextColor: newJSONDecoderFlairTextColor?
    let permalink: String
    let parentWhitelistStatus: newJSONDecoderWhitelistStatus
    let stickied: Bool
    let url: String
    let subredditSubscribers, createdUTC, numCrossposts: Int
    let media: newJSONDecoderMedia?
    let isVideo: Bool
    let linkFlairTemplateID: String?

    enum CodingKeys: String, CodingKey {
        case approvedAtUTC = "approved_at_utc"
        case subreddit, selftext
        case authorFullname = "author_fullname"
        case saved
        case modReasonTitle = "mod_reason_title"
        case gilded, clicked, title
        case linkFlairRichtext = "link_flair_richtext"
        case subredditNamePrefixed = "subreddit_name_prefixed"
        case hidden, pwls
        case linkFlairCSSClass = "link_flair_css_class"
        case downs
        case thumbnailHeight = "thumbnail_height"
        case hideScore = "hide_score"
        case name, quarantine
        case linkFlairTextColor = "link_flair_text_color"
        case upvoteRatio = "upvote_ratio"
        case authorFlairBackgroundColor = "author_flair_background_color"
        case subredditType = "subreddit_type"
        case ups
        case totalAwardsReceived = "total_awards_received"
        case mediaEmbed = "media_embed"
        case thumbnailWidth = "thumbnail_width"
        case authorFlairTemplateID = "author_flair_template_id"
        case isOriginalContent = "is_original_content"
        case userReports = "user_reports"
        case secureMedia = "secure_media"
        case isRedditMediaDomain = "is_reddit_media_domain"
        case isMeta = "is_meta"
        case category
        case secureMediaEmbed = "secure_media_embed"
        case linkFlairText = "link_flair_text"
        case canModPost = "can_mod_post"
        case score
        case approvedBy = "approved_by"
        case isCreatedFromAdsUI = "is_created_from_ads_ui"
        case authorPremium = "author_premium"
        case thumbnail, edited
        case authorFlairCSSClass = "author_flair_css_class"
        case authorFlairRichtext = "author_flair_richtext"
        case gildings
        case postHint = "post_hint"
        case contentCategories = "content_categories"
        case isSelf = "is_self"
        case modNote = "mod_note"
        case created
        case linkFlairType = "link_flair_type"
        case wls
        case removedByCategory = "removed_by_category"
        case bannedBy = "banned_by"
        case authorFlairType = "author_flair_type"
        case domain
        case allowLiveComments = "allow_live_comments"
        case selftextHTML = "selftext_html"
        case likes
        case suggestedSort = "suggested_sort"
        case bannedAtUTC = "banned_at_utc"
        case urlOverriddenByDest = "url_overridden_by_dest"
        case viewCount = "view_count"
        case archived
        case noFollow = "no_follow"
        case isCrosspostable = "is_crosspostable"
        case pinned
        case over18 = "over_18"
        case preview
        case allAwardings = "all_awardings"
        case awarders
        case mediaOnly = "media_only"
        case canGild = "can_gild"
        case spoiler, locked
        case authorFlairText = "author_flair_text"
        case treatmentTags = "treatment_tags"
        case visited
        case removedBy = "removed_by"
        case numReports = "num_reports"
        case distinguished
        case subredditID = "subreddit_id"
        case modReasonBy = "mod_reason_by"
        case removalReason = "removal_reason"
        case linkFlairBackgroundColor = "link_flair_background_color"
        case id
        case isRobotIndexable = "is_robot_indexable"
        case reportReasons = "report_reasons"
        case author
        case discussionType = "discussion_type"
        case numComments = "num_comments"
        case sendReplies = "send_replies"
        case whitelistStatus = "whitelist_status"
        case contestMode = "contest_mode"
        case modReports = "mod_reports"
        case authorPatreonFlair = "author_patreon_flair"
        case authorFlairTextColor = "author_flair_text_color"
        case permalink
        case parentWhitelistStatus = "parent_whitelist_status"
        case stickied, url
        case subredditSubscribers = "subreddit_subscribers"
        case createdUTC = "created_utc"
        case numCrossposts = "num_crossposts"
        case media
        case isVideo = "is_video"
        case linkFlairTemplateID = "link_flair_template_id"
    }
}

// MARK: - newJSONDecoderAllAwarding
struct newJSONDecoderAllAwarding: Codable {
    let giverCoinReward: Int?
    let subredditID: JSONNull?
    let isNew: Bool
    let daysOfDripExtension, coinPrice: Int
    let id: String
    let pennyDonate: Int?
    let awardSubType: newJSONDecoderAwardSubType
    let coinReward: Int
    let iconURL: String
    let daysOfPremium: Int
    let tiersByRequiredAwardings: [String: newJSONDecoderTiersByRequiredAwarding]?
    let resizedIcons: [newJSONDecoderResizedIcon]
    let iconWidth, staticIconWidth: Int
    let startDate: JSONNull?
    let isEnabled: Bool
    let awardingsRequiredToGrantBenefits: Int?
    let allAwardingDescription: String
    let endDate: JSONNull?
    let subredditCoinReward, count, staticIconHeight: Int
    let name: String
    let resizedStaticIcons: [newJSONDecoderResizedIcon]
    let iconFormat: newJSONDecoderFormat?
    let iconHeight: Int
    let pennyPrice: Int?
    let awardType: newJSONDecoderAwardType
    let staticIconURL: String

    enum CodingKeys: String, CodingKey {
        case giverCoinReward = "giver_coin_reward"
        case subredditID = "subreddit_id"
        case isNew = "is_new"
        case daysOfDripExtension = "days_of_drip_extension"
        case coinPrice = "coin_price"
        case id
        case pennyDonate = "penny_donate"
        case awardSubType = "award_sub_type"
        case coinReward = "coin_reward"
        case iconURL = "icon_url"
        case daysOfPremium = "days_of_premium"
        case tiersByRequiredAwardings = "tiers_by_required_awardings"
        case resizedIcons = "resized_icons"
        case iconWidth = "icon_width"
        case staticIconWidth = "static_icon_width"
        case startDate = "start_date"
        case isEnabled = "is_enabled"
        case awardingsRequiredToGrantBenefits = "awardings_required_to_grant_benefits"
        case allAwardingDescription = "description"
        case endDate = "end_date"
        case subredditCoinReward = "subreddit_coin_reward"
        case count
        case staticIconHeight = "static_icon_height"
        case name
        case resizedStaticIcons = "resized_static_icons"
        case iconFormat = "icon_format"
        case iconHeight = "icon_height"
        case pennyPrice = "penny_price"
        case awardType = "award_type"
        case staticIconURL = "static_icon_url"
    }
}

enum newJSONDecoderAwardSubType: String, Codable {
    case global = "GLOBAL"
    case group = "GROUP"
}

enum newJSONDecoderAwardType: String, Codable {
    case global = "global"
}

enum newJSONDecoderFormat: String, Codable {
    case apng = "APNG"
    case png = "PNG"
}

// MARK: - newJSONDecoderResizedIcon
struct newJSONDecoderResizedIcon: Codable {
    let url: String
    let width, height: Int
    let format: newJSONDecoderFormat?
}

// MARK: - newJSONDecoderTiersByRequiredAwarding
struct newJSONDecoderTiersByRequiredAwarding: Codable {
    let resizedIcons: [newJSONDecoderResizedIcon]
    let awardingsRequired: Int
    let staticIcon: newJSONDecoderResizedIcon
    let resizedStaticIcons: [newJSONDecoderResizedIcon]
    let icon: newJSONDecoderResizedIcon

    enum CodingKeys: String, CodingKey {
        case resizedIcons = "resized_icons"
        case awardingsRequired = "awardings_required"
        case staticIcon = "static_icon"
        case resizedStaticIcons = "resized_static_icons"
        case icon
    }
}

enum newJSONDecoderAuthorFlairCSSClass: String, Codable {
    case comic = "comic"
}

enum newJSONDecoderFlairTextColor: String, Codable {
    case dark = "dark"
}

enum newJSONDecoderFlairType: String, Codable {
    case text = "text"
}

enum newJSONDecoderDomain: String, Codable {
    case iImgurCOM = "i.imgur.com"
    case iReddIt = "i.redd.it"
    case imgurCOM = "imgur.com"
    case vReddIt = "v.redd.it"
}

// MARK: - newJSONDecoderGildings
struct newJSONDecoderGildings: Codable {
    let gid1, gid2: Int?

    enum CodingKeys: String, CodingKey {
        case gid1 = "gid_1"
        case gid2 = "gid_2"
    }
}

enum newJSONDecoderLinkFlairText: String, Codable {
    case verified = "Verified"
}

// MARK: - newJSONDecoderMedia
struct newJSONDecoderMedia: Codable {
    let redditVideo: newJSONDecoderRedditVideo?
    let type: newJSONDecoderDomain?
    let oembed: newJSONDecoderOembed?

    enum CodingKeys: String, CodingKey {
        case redditVideo = "reddit_video"
        case type, oembed
    }
}

// MARK: - newJSONDecoderOembed
struct newJSONDecoderOembed: Codable {
    let providerURL: String
    let version: String
    let url: String
    let height, width: Int
    let html, providerName, type: String

    enum CodingKeys: String, CodingKey {
        case providerURL = "provider_url"
        case version, url, height, width, html
        case providerName = "provider_name"
        case type
    }
}

// MARK: - newJSONDecoderRedditVideo
struct newJSONDecoderRedditVideo: Codable {
    let bitrateKbps: Int
    let fallbackURL: String
    let height, width: Int
    let scrubberMediaURL: String
    let dashURL: String
    let duration: Int
    let hlsURL: String
    let isGIF: Bool
    let transcodingStatus: newJSONDecoderTranscodingStatus

    enum CodingKeys: String, CodingKey {
        case bitrateKbps = "bitrate_kbps"
        case fallbackURL = "fallback_url"
        case height, width
        case scrubberMediaURL = "scrubber_media_url"
        case dashURL = "dash_url"
        case duration
        case hlsURL = "hls_url"
        case isGIF = "is_gif"
        case transcodingStatus = "transcoding_status"
    }
}

enum newJSONDecoderTranscodingStatus: String, Codable {
    case completed = "completed"
}

// MARK: - newJSONDecoderMediaEmbed
struct newJSONDecoderMediaEmbed: Codable {
    let content: String?
    let width: Int?
    let scrolling: Bool?
    let height: Int?
    let mediaDomainURL: String?

    enum CodingKeys: String, CodingKey {
        case content, width, scrolling, height
        case mediaDomainURL = "media_domain_url"
    }
}

enum newJSONDecoderWhitelistStatus: String, Codable {
    case allAds = "all_ads"
    case promoAdultNsfw = "promo_adult_nsfw"
}

enum newJSONDecoderPostHint: String, Codable {
    case hostedVideo = "hosted:video"
    case image = "image"
    case link = "link"
}

// MARK: - newJSONDecoderPreview
struct newJSONDecoderPreview: Codable {
    let images: [newJSONDecoderImage]
    let enabled: Bool
}

// MARK: - newJSONDecoderImage
struct newJSONDecoderImage: Codable {
    let source: newJSONDecoderResizedIcon
    let resolutions: [newJSONDecoderResizedIcon]
    let variants: newJSONDecoderVariants
    let id: String
}

// MARK: - newJSONDecoderVariants
struct newJSONDecoderVariants: Codable {
    let obfuscated, nsfw: newJSONDecoderNsfw?
}

// MARK: - newJSONDecoderNsfw
struct newJSONDecoderNsfw: Codable {
    let source: newJSONDecoderResizedIcon
    let resolutions: [newJSONDecoderResizedIcon]
}

enum newJSONDecoderSubreddit: String, Codable {
    case funny = "funny"
}

enum newJSONDecoderSubredditID: String, Codable {
    case t52Qh33 = "t5_2qh33"
}

enum newJSONDecoderSubredditNamePrefixed: String, Codable {
    case rFunny = "r/funny"
}

enum newJSONDecoderSubredditType: String, Codable {
    case subredditTypePublic = "public"
}

enum newJSONDecoderKind: String, Codable {
    case t3 = "t3"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}
