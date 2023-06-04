import Foundation
import OSLog

final public class OSLogReportCreator {
    
    public enum OSLogReportCreatorError: Error {
        case noEntries
        case unableToFindCachesDirectory
        case unknownError(error: Error)
    }
    
    public init() {
        
    }
    
    public func generateLogFile(oldestEntry: TimeInterval = 86400) async throws -> URL {
        let store = try OSLogStore(scope: .currentProcessIdentifier)
        let position = store.position(timeIntervalSinceEnd: -oldestEntry)
        let entries = try store.getEntries(with: [], at: position, matching: nil)
        var logString = String()
        for e in entries {
            logString.append(contentsOf: e.date.ISO8601Format())
            logString.append(contentsOf: ": ")
            if let subsystem = e.value(forKey: "_subsystem") as? String {
                logString.append(contentsOf: "[\(subsystem)] ")
            }
            logString.append(contentsOf: e.composedMessage)
            logString.append(contentsOf: "\n")
        }
        
        guard logString.isEmpty == false else {
            throw OSLogReportCreatorError.noEntries
        }
        
        guard let path = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first else {
            throw OSLogReportCreatorError.unableToFindCachesDirectory
        }
        
        let filename = path.appendingPathComponent("\(Date().ISO8601Format()).log")
        
        try logString.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
        
        return filename
    }
    
}
