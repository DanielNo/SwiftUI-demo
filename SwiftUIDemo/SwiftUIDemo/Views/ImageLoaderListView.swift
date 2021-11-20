//
//  ImageLoaderListView.swift
//  SwiftUIDemo
//
//  Created by Daniel No on 11/19/21.
//

import Foundation
import SwiftUI
import Combine
import Shimmer

public struct ImageLoaderListView : View{
    @StateObject var client = PictureClient()
    
    public var body: some View{
        NavigationView {
            
            List {
                ForEach(client.pictures) { picture in
                    if picture.imageUrl != nil{
                        AsyncImage(url: picture.imageUrl) { image in
//                            image.resizable()
                            return image.resizable()
                        } placeholder: {
//                            ProgressView()
                                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse est leo, vehicula eu eleifend non, auctor ut arcu Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse est leo, vehicula eu eleifend non, auctor ut arcu")
                                .lineLimit(nil)
                                .redacted(reason: .placeholder)
                                    .shimmering()
                        }

                    }else{
                        EmptyView()
                    }
                }.frame(width: 320, height: 250, alignment: .center)

            }
            
        }.onAppear {
//            client.getImageList()
            client.getStaticImageList()
//            let pub = client.makeAGenericPublisher()
            
        }
        
        
    }
    
}

public class PictureClient : ObservableObject{
    let session : URLSession
    
    @Published var pictures : [Picture] = []
    @Published var staticImages : [String] = []

    var subscriptions : Set<AnyCancellable> = []

    init(){
        session = URLSession(configuration: .default)
    }
    
    func getStaticImageList(){
        var arr : [Picture] = []
        for i in 1...1000{
            let pic = Picture(i)
            arr.append(pic)
        }
        pictures = arr
    }
    
    func getImageList(_ urlString : String = "https://picsum.photos/v2/list"){
        
        guard let url = URL(string: urlString) else{
            return
        }
        
        let request = URLRequest(url: url)
        let pub = session.dataTaskPublisher(for: request)
            .tryMap { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                    httpResponse.statusCode == 200 else {
                        throw URLError(.badServerResponse)
                    }
                return element.data
            }
            .decode(type: [Picture].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
            .sink { completion in
//                print("completion : \(completion)")
            } receiveValue: { value in
                self.pictures = value

                print(value)
            }.store(in: &subscriptions)
            

    }
    
    enum ApiError : Error{
        case defaultError
    }
    
    func makeAGenericPublisher(_ urlString : String = "https://picsum.photos/v2/list5895") -> AnyPublisher<[Picture],Error>{
        
        guard let url = URL(string: urlString) else{
            return Result.failure(ApiError.defaultError).publisher.eraseToAnyPublisher()
//            throw ApiError.defaultError
//            return Fail(error: ApiError.defaultError).eraseToAnyPublisher()
        }
        
        let request = URLRequest(url: url)
        return session.dataTaskPublisher(for: request)
            .tryMap { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                    httpResponse.statusCode == 200 else {
//                        throw URLError(.badServerResponse)
                        throw ApiError.defaultError
                    }
                return element.data
            }.mapError({ err in
                return ApiError.defaultError
            })
            .decode(type: [Picture].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
//            .sink { completion in
//                print("completion : \(completion)")
//            } receiveValue: { value in
//                print(value)
//                self.pictures = value
//
//            }
//            .store(in: &subscriptions)
            
//        return pub

    }

    
    

}

