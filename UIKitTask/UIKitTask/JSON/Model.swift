import Foundation

// MARK: - Welcome
struct QuizFormModel: Codable {
    let elements: [Element]
}

// MARK: - Element
struct Element: Codable {
    let type: String
    let id, position: Int
    let attributes: Attributes
    let isHidden: IsHidden?

    enum CodingKeys: String, CodingKey {
        case type, id, position, attributes
        case isHidden = "is_hidden"
    }
}

// MARK: - Attributes
struct Attributes: Codable {
    let text: String
    let titleRange, textFieldRange: Int?
    let keyboardType: String?
    let multiplyChoiseAllowed: Bool?
    let buttons: [Button]?

    enum CodingKeys: String, CodingKey {
        case text
        case titleRange = "title_range"
        case textFieldRange = "text_field_range"
        case keyboardType = "keyboard_type"
        case multiplyChoiseAllowed = "multiply_choise_allowed"
        case buttons
    }
}

// MARK: - Button
struct Button: Codable {
    let id: Int
    let title: String
}

// MARK: - IsHidden
struct IsHidden: Codable {
    let condition: String
    let idElement: Int

    enum CodingKeys: String, CodingKey {
        case condition
        case idElement = "id_element"
    }
}
