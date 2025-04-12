//
//  ContentProvider.swift
//  StoryScroller
//
//  Created by Paul Ehrhardt on 12/4/25.
//

import Foundation


// MARK: - ContentProvider -

actor ContentProvider {
    
    
    // MARK: - Properties
    
    private var pages: [Page] = []
    private var currentPage: Int = 0
    
    private var maxPages: Int {
        pages.count
    }
    
    
    // MARK: - API
    
    func fetchNextPage() -> Page? {
        if currentPage >= maxPages {
            currentPage = 0
        }
        defer {
            currentPage += 1
        }
        print("Current page: \(currentPage)")
        return pages[currentPage]
    }

    func loadStoryFeed() throws {
        let storyFeed = try loadLocalContent(named: "story-feed", from: Bundle.main, of: StoryFeed.self)
        pages = storyFeed.pages
        currentPage = 0
        print("Story feed successfully loaded!")
    }
    
    
    // MARK: - Internal
    
    private func loadLocalContent<T: Codable>(named fileName: String, from bundle: Bundle, of type: T.Type) throws -> T {
        guard let data = loadFile(named: fileName, bundle: bundle) else { throw NotFoundError() }
        do {
            let content = try JSONDecoder().decode(T.self, from: data)
            return content
        } catch {
            print(String(describing: error))
            throw error
        }
    }
    
    private func loadFile(named fileName: String, fileExtension: String? = "json", directory: String? = nil, bundle: Bundle) -> Data? {
        var fileData: Data?
        if let filePath = bundle.path(forResource: fileName, ofType: fileExtension, inDirectory: directory) {
            if let data = try? Data(contentsOf: URL(fileURLWithPath: filePath)) {
                fileData = data
            }
        }

        return fileData
    }
}
