// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum AppLocalization {
  /// Friday
  public static let friday = AppLocalization.tr("Localizable", "FRIDAY", fallback: "Friday")
  /// Monday
  public static let monday = AppLocalization.tr("Localizable", "MONDAY", fallback: "Monday")
  /// Saturday
  public static let saturday = AppLocalization.tr("Localizable", "SATURDAY", fallback: "Saturday")
  /// Sunday
  public static let sunday = AppLocalization.tr("Localizable", "SUNDAY", fallback: "Sunday")
  /// Thursday
  public static let thursday = AppLocalization.tr("Localizable", "THURSDAY", fallback: "Thursday")
  /// Tuesday
  public static let tuesday = AppLocalization.tr("Localizable", "TUESDAY", fallback: "Tuesday")
  /// Wednesday
  public static let wednesday = AppLocalization.tr("Localizable", "WEDNESDAY", fallback: "Wednesday")
  public enum Details {
    /// AQ
    public static let aq = AppLocalization.tr("Localizable", "DETAILS.AQ", fallback: "AQ")
    /// RAIN
    public static let rain = AppLocalization.tr("Localizable", "DETAILS.RAIN", fallback: "RAIN")
    /// Localizable.strings
    ///   WeatherApp
    /// 
    ///   Created by Le Chris on 21.03.2023.
    public static let time = AppLocalization.tr("Localizable", "DETAILS.TIME", fallback: "TIME")
    /// UV
    public static let uv = AppLocalization.tr("Localizable", "DETAILS.UV", fallback: "UV")
  }
  public enum Search {
    /// Search Location
    public static let searchlocation = AppLocalization.tr("Localizable", "SEARCH.SEARCHLOCATION", fallback: "Search Location")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension AppLocalization {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
