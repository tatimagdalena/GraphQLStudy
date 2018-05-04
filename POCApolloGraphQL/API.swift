//  This file was automatically generated and should not be edited.

import Apollo

public final class LocationQueryQuery: GraphQLQuery {
  public static let operationString =
    "query LocationQuery($ip: String!) {\n  getLocation(ip: $ip) {\n    __typename\n    location {\n      __typename\n      latitude\n      longitude\n    }\n  }\n}"

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
        GraphQLField("location", type: .object(Location.selections)),
      ]

      public var snapshot: Snapshot

      public init(snapshot: Snapshot) {
        self.snapshot = snapshot
      }

      public init(location: Location? = nil) {
        self.init(snapshot: ["__typename": "locdata", "location": location.flatMap { (value: Location) -> Snapshot in value.snapshot }])
      }

      public var __typename: String {
        get {
          return snapshot["__typename"]! as! String
        }
        set {
          snapshot.updateValue(newValue, forKey: "__typename")
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