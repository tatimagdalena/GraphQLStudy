//  This file was automatically generated and should not be edited.

import Apollo

public final class LocationQueryQuery: GraphQLQuery {
  public static let operationString =
    "query LocationQuery($ip: String!) {\n  getLocation(ip: $ip) {\n    __typename\n    country {\n      __typename\n      names {\n        __typename\n        en\n      }\n      geoname_id\n      iso_code\n    }\n    location {\n      __typename\n      latitude\n      longitude\n    }\n  }\n}"

  public var ip: String

  public init(ip: String) {
    self.ip = ip
  }

  public var variables: GraphQLMap? {
    return ["ip": ip]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("getLocation", arguments: ["ip": GraphQLVariable("ip")], type: .object(GetLocation.selections)),
    ]

    public var snapshot: Snapshot

    public init(snapshot: Snapshot) {
      self.snapshot = snapshot
    }

    public init(getLocation: GetLocation? = nil) {
      self.init(snapshot: ["__typename": "Query", "getLocation": getLocation.flatMap { (value: GetLocation) -> Snapshot in value.snapshot }])
    }

    /// Receives an 'ip' as argument and returns an object with location data
    public var getLocation: GetLocation? {
      get {
        return (snapshot["getLocation"] as? Snapshot).flatMap { GetLocation(snapshot: $0) }
      }
      set {
        snapshot.updateValue(newValue?.snapshot, forKey: "getLocation")
      }
    }

    public struct GetLocation: GraphQLSelectionSet {
      public static let possibleTypes = ["locdata"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("country", type: .object(Country.selections)),
        GraphQLField("location", type: .object(Location.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(country: Country? = nil, location: Location? = nil) {
        self.init(snapshot: ["__typename": "locdata", "country": country.flatMap { (value: Country) -> Snapshot in value.snapshot }, "location": location.flatMap { (value: Location) -> Snapshot in value.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
        }
      }

      public var country: Country? {
        get {
          return (snapshot["country"] as? Snapshot).flatMap { Country(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "country")
        }
      }

      public var location: Location? {
        get {
          return (snapshot["location"] as? Snapshot).flatMap { Location(snapshot: $0) }
        }
        set {
          snapshot.updateValue(newValue?.snapshot, forKey: "location")
        }
      }

      public struct Country: GraphQLSelectionSet {
        public static let possibleTypes = ["country"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("names", type: .object(Name.selections)),
          GraphQLField("geoname_id", type: .scalar(String.self)),
          GraphQLField("iso_code", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(names: Name? = nil, geonameId: String? = nil, isoCode: String? = nil) {
          self.init(snapshot: ["__typename": "country", "names": names.flatMap { (value: Name) -> Snapshot in value.snapshot }, "geoname_id": geonameId, "iso_code": isoCode])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var names: Name? {
          get {
            return (snapshot["names"] as? Snapshot).flatMap { Name(snapshot: $0) }
          }
          set {
            snapshot.updateValue(newValue?.snapshot, forKey: "names")
          }
        }

        public var geonameId: String? {
          get {
            return snapshot["geoname_id"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "geoname_id")
          }
        }

        public var isoCode: String? {
          get {
            return snapshot["iso_code"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "iso_code")
          }
        }

        public struct Name: GraphQLSelectionSet {
          public static let possibleTypes = ["countryNames"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("en", type: .scalar(String.self)),
          ]

          public var snapshot: Snapshot

          public init(snapshot: Snapshot) {
            self.snapshot = snapshot
          }

          public init(en: String? = nil) {
            self.init(snapshot: ["__typename": "countryNames", "en": en])
          }

          public var __typename: String {
            get {
              return snapshot["__typename"]! as! String
            }
            set {
              snapshot.updateValue(newValue, forKey: "__typename")
            }
          }

          public var en: String? {
            get {
              return snapshot["en"] as? String
            }
            set {
              snapshot.updateValue(newValue, forKey: "en")
            }
          }
        }
      }

      public struct Location: GraphQLSelectionSet {
        public static let possibleTypes = ["location"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("latitude", type: .scalar(String.self)),
          GraphQLField("longitude", type: .scalar(String.self)),
        ]

        public var snapshot: Snapshot

        public init(snapshot: Snapshot) {
          self.snapshot = snapshot
        }

        public init(latitude: String? = nil, longitude: String? = nil) {
          self.init(snapshot: ["__typename": "location", "latitude": latitude, "longitude": longitude])
        }

        public var __typename: String {
          get {
            return snapshot["__typename"]! as! String
          }
          set {
            snapshot.updateValue(newValue, forKey: "__typename")
          }
        }

        public var latitude: String? {
          get {
            return snapshot["latitude"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "latitude")
          }
        }

        public var longitude: String? {
          get {
            return snapshot["longitude"] as? String
          }
          set {
            snapshot.updateValue(newValue, forKey: "longitude")
          }
        }
      }
    }
  }
}