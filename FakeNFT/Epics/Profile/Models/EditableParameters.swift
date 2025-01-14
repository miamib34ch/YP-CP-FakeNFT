import Foundation

/// Параметр, указывающий, какое свойство профиля изменяется.
///
/// - `name`: Имя пользователя.
/// - `description`: Описание пользователя.
/// - `site`: Веб-сайт пользователя.
/// - `imageUrl`: URL изображения пользователя.
enum EditableParameter {
    /// Имя пользователя.
    case name
    /// Описание пользователя.
    case description
    /// Веб-сайт пользователя.
    case site
    /// URL изображения пользователя.
    case imageUrl
}
