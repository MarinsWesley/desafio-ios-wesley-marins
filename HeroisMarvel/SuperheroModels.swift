import Foundation

// MARK: - Search Response

struct SuperheroSearchResponse: Codable {

    let response: String
    let resultsFor: String?
    let results: [Hero]?

    enum CodingKeys: String, CodingKey {
        case response
        case resultsFor = "results-for"
        case results
    }
}

// MARK: - Hero

struct Hero: Codable {

    let id: String
    let name: String
    let powerstats: PowerStats
    let image: HeroImage
}

// MARK: - Hero Detail

struct HeroDetail: Codable {

    let response: String
    let id: String
    let name: String
    let powerstats: PowerStats
    let biography: Biography
    let appearance: Appearance
    let work: Work
    let connections: Connections
    let image: HeroImage
}

// MARK: - Power Stats

struct PowerStats: Codable {

    let intelligence: String
    let strength: String
    let speed: String
    let durability: String
    let power: String
    let combat: String

    enum CodingKeys: String, CodingKey {
        case intelligence
        case strength
        case speed
        case durability
        case power
        case combat
    }

    init(from decoder: Decoder) throws {

        let container = try decoder.container(keyedBy: CodingKeys.self)

        intelligence = PowerStats.value(
            from: try container.decodeIfPresent(String.self, forKey: .intelligence)
        )

        strength = PowerStats.value(
            from: try container.decodeIfPresent(String.self, forKey: .strength)
        )

        speed = PowerStats.value(
            from: try container.decodeIfPresent(String.self, forKey: .speed)
        )

        durability = PowerStats.value(
            from: try container.decodeIfPresent(String.self, forKey: .durability)
        )

        power = PowerStats.value(
            from: try container.decodeIfPresent(String.self, forKey: .power)
        )

        combat = PowerStats.value(
            from: try container.decodeIfPresent(String.self, forKey: .combat)
        )
    }

    private static func value(from value: String?) -> String {
        guard let value = value,
              !value.isEmpty,
              value.lowercased() != "null" else {
            return "Não informado"
        }

        return value
    }
}

// MARK: - Biography

struct Biography: Codable {

    let fullName: String
    let alterEgos: String
    let aliases: [String]
    let placeOfBirth: String
    let firstAppearance: String
    let publisher: String
    let alignment: String

    enum CodingKeys: String, CodingKey {
        case fullName = "full-name"
        case alterEgos = "alter-egos"
        case aliases
        case placeOfBirth = "place-of-birth"
        case firstAppearance = "first-appearance"
        case publisher
        case alignment
    }
}

// MARK: - Appearance

struct Appearance: Codable {

    let gender: String
    let race: String
    let height: [String]
    let weight: [String]
    let eyeColor: String
    let hairColor: String

    enum CodingKeys: String, CodingKey {
        case gender
        case race
        case height
        case weight
        case eyeColor = "eye-color"
        case hairColor = "hair-color"
    }
}

// MARK: - Work

struct Work: Codable {

    let occupation: String
    let base: String
}

// MARK: - Connections

struct Connections: Codable {

    let groupAffiliation: String
    let relatives: String

    enum CodingKeys: String, CodingKey {
        case groupAffiliation = "group-affiliation"
        case relatives
    }
}

// MARK: - Image

struct HeroImage: Codable {

    let url: String
}
