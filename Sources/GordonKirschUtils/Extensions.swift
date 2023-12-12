//
//  File.swift
//  
//
//  Created by Gordon on 12.12.23.
//

import Foundation
import JWTDecode

extension Date {
    func timestamp() -> Int {
        return Int(self.timeIntervalSince1970)
    }
    
    func toISO8601(withTime: Bool = true) -> String {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale.current
        formatter.timeZone = Locale.current.timeZone
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter.string(from: self)
    }
}

extension HTTPURLResponse {
    func isSuccessful() -> Bool {
        return statusCode >= 200 && statusCode <= 299
    }
}

extension JWT {
    var uuid: UUID {
        return UUID(uuidString: self["uuid"].string!)!
    }
    
    var email: String {
        return self["username"].string!
    }
}

extension URL {
    func extractParams() -> [(name: String, value: String)] {
      let components =
        self.absoluteString
        .split(separator: "&")
        .map { $0.split(separator: "=") }

      return
        components
        .compactMap {
          $0.count == 2
            ? (name: String($0[0]), value: String($0[1]))
            : nil
        }
    }
}
