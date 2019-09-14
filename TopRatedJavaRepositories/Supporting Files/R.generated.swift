//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap(Locale.init) ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)
  
  static func validate() throws {
    try intern.validate()
  }
  
  /// This `R.file` struct is generated, and contains static references to 2 files.
  struct file {
    /// Resource file `pullRequests.json`.
    static let pullRequestsJson = Rswift.FileResource(bundle: R.hostingBundle, name: "pullRequests", pathExtension: "json")
    /// Resource file `topRepositories.json`.
    static let topRepositoriesJson = Rswift.FileResource(bundle: R.hostingBundle, name: "topRepositories", pathExtension: "json")
    
    /// `bundle.url(forResource: "pullRequests", withExtension: "json")`
    static func pullRequestsJson(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.pullRequestsJson
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    /// `bundle.url(forResource: "topRepositories", withExtension: "json")`
    static func topRepositoriesJson(_: Void = ()) -> Foundation.URL? {
      let fileResource = R.file.topRepositoriesJson
      return fileResource.bundle.url(forResource: fileResource)
    }
    
    fileprivate init() {}
  }
  
  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      // There are no resources to validate
    }
    
    fileprivate init() {}
  }
  
  fileprivate class Class {}
  
  fileprivate init() {}
}

struct _R {
  fileprivate init() {}
}
