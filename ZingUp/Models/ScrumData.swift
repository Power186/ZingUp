//
//  ScrumData.swift
//  ZingUp
//
//  Created by Scott on 12/18/20.
//

import Foundation

class ScrumData: ObservableObject {
    
    // MARK: - Properties
    
    private static var documentsFolder: URL {
        do {
            return try FileManager.default.url(for: .documentDirectory,
                                               in: .userDomainMask,
                                               appropriateFor: nil,
                                               create: false)
        } catch {
            fatalError("Can't find documents directory.")
        }
    }
    
    private static var fileURL: URL {
        return documentsFolder.appendingPathComponent("scrums.data")
    }
    
    @Published var scrums: [DailyStandUp] = []
    
    // MARK: - Methods
    
    func load() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let data = try? Data(contentsOf: Self.fileURL) else {
                #if DEBUG
                DispatchQueue.main.async {
                    self?.scrums = DailyStandUp.data
                }
                #endif
                return
            }
            guard let dailyScrums = try? JSONDecoder().decode([DailyStandUp].self, from: data) else {
                fatalError("Can't decode saved scrum data.")
            }
            DispatchQueue.main.async {
                self?.scrums = dailyScrums
            }
        }
    }
    
    func save() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let scrums = self?.scrums else { fatalError("Self out of scope") }
            guard let data = try? JSONEncoder().encode(scrums) else { fatalError("Error encoding data") }
            
            do {
                let outfile = Self.fileURL
                try data.write(to: outfile)
            } catch {
                fatalError("Can't write to file")
            }
            
        }
    }
    
}
