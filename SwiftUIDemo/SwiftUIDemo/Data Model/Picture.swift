//
//  Picture.swift
//  SwiftUIDemo
//
//  Created by Daniel No on 11/19/21.
//

import Foundation

public struct Picture : Decodable, Identifiable{
    public let id : String
    let author : String
    let width : Int
    let height : Int
    let url : String
    let download_url : String
    let imageUrl : URL?
    
    enum CodingKeys : String, CodingKey {
        case id
        case author
        case width
        case height
        case url
        case download_url
    }

    
    public init(from decoder: Decoder) throws {
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try values.decode(String.self, forKey: .id)
        author = try values.decode(String.self, forKey: .author)
        //        width = try values.decode(Int.self, forKey: .width)
        //        height = try values.decode(Int.self, forKey: .height)
        width = 320
        height = 250
        url = try values.decode(String.self, forKey: .url)
        download_url = try values.decode(String.self, forKey: .download_url)
        let testURL = URL(string: download_url)?.deletingLastPathComponent().deletingLastPathComponent().absoluteString.appending("\(width)/\(height)")
        
//        imageUrl = URL(string: download_url)
        imageUrl = URL(string: testURL ?? "")

    }
    
    init(_ imageNumber : Int){
        id = "\(imageNumber)"
        author = "Some author"
        width = 320
        height = 250
        url = "https://picsum.photos/id/\(imageNumber)/\(height)/\(width)"
        download_url = "https://picsum.photos/id/\(imageNumber)/\(height)/\(width)"

        imageUrl = URL(string: download_url)

    }

}
