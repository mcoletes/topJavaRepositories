//
//  Logger.swift
//  TopJavaRepositories
//
//  Created by Mauro Sasso Coletes on 14/09/19.
//  Copyright © 2019 MSC. All rights reserved.
//

import Foundation

/**
 This extension returns the cURL command for a request.
 */
public extension URLRequest {
    
    // MARK: - Propertiess
    
    /**
     Returns a cURL command for a request.
     
     - Returns: A string object that contains cURL command or "" if an URL is not properly initialized.
     */
    init?(curlString: String) {
        return nil
    }
    
    /**
     Returns a cURL command representation of this URL request.
     */
    public var curlString: String {
        guard let url = url else { return "" }
        var baseCommand = "curl \(url.absoluteString)"
        if httpMethod == "HEAD" {
            baseCommand += " --head"
        }
        var command = [baseCommand]
        if let method = httpMethod, method != "GET" && method != "HEAD" {
            command.append("-X \(method)")
        }
        if let headers = allHTTPHeaderFields {
            for (key, value) in headers where key != "Cookie" {
                command.append("-H '\(key): \(value)'")
            }
        }
        if let data = httpBody, let body = String(data: data, encoding: .utf8) {
            command.append("-d '\(body)'")
        }
        return command.joined(separator: " \n\t").replacingOccurrences(of: "\n", with: "")
    }
    
}


open class Logger {
    
    static let shared = Logger()
    
    public init() {}
    
    
    static func logRequest(request: URLRequest) {
        var requestDebugLog = "==REQUEST===============================================\n"
        requestDebugLog += "🎯🎯🎯 URL: \(request.url?.absoluteString ?? "")\n"
        requestDebugLog += "-----------------------------------------------------------\n"
        requestDebugLog += "⚒⚒⚒ HTTP METHOD: \(request.httpMethod ?? "")\n"
        requestDebugLog += "-----------------------------------------------------------\n"
        requestDebugLog += "📝📝📝 HEADERS: \(request.allHTTPHeaderFields ?? [:])\n"
        requestDebugLog += "-----------------------------------------------------------\n"
        requestDebugLog += "✅✅✅ CURL: \(request.curlString)\n"
        requestDebugLog += "===========================================================\n"
        print(requestDebugLog)
    }
    
    static func logResponse(_ response: URLResponse?,_ data: Data?) {
        var responseDebugLog = "==RESPONSE==============================================\n"
        responseDebugLog += "⚠️⚠️⚠️ STATUS CODE: \((response as? HTTPURLResponse)?.statusCode ?? -1)\n"
        responseDebugLog += "-----------------------------------------------------------\n"
        responseDebugLog += "📒📒📒 HEADERS: \((response as? HTTPURLResponse)?.allHeaderFields as? [String: String] ?? [:])\n"
        responseDebugLog += "-----------------------------------------------------------\n"
        
        if let dataObj = data {
            do {
                let json = try JSONSerialization.jsonObject(with: dataObj, options: .mutableContainers)
                let prettyPrintedData = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
                responseDebugLog += "⬇️⬇️⬇️ RESPONSE DATA: \n\(String(bytes: prettyPrintedData, encoding: .utf8) ?? "")"
            } catch {
                responseDebugLog += "⬇️⬇️⬇️ RESPONSE DATA: \n\(String(data: dataObj, encoding: .utf8) ?? "")"
            }
            responseDebugLog += "\n"
        }
        responseDebugLog += "===========================================================\n"
        
        print(responseDebugLog)
    }
    
    static func parseDict(dict: Dictionary<String, Any>) -> String {
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: dict)
            if let json = String(data: jsonData, encoding: .utf8) {
                return json
            }
        } catch {
            print("something went wrong with parsing json")
        }
        return ""
    }
}

