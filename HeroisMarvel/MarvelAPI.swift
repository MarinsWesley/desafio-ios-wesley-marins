//
//  MarvelAPIComics.swift
//  HeroisMarvel
//
//  Created by MacbookAirWesley on 08/08/22.
//  Copyright © 2022 Eric Brito. All rights reserved.
//

import Foundation
import SwiftHash
import Alamofire



class MarvelAPI {


	static private let basePath = "https://gateway.marvel.com/v1/public/characters?"
	static private let privateKey = "183a1103b82163da3c689ad1dff92990e2861035"
	static private let publicKey = "e0a13c9c27faf58d21563bb591f9633d"
	static private let limit = 50
	
	class func loadHeroes(name: String?, page: Int = 0, onComplete: @escaping (MarvelInfo?)-> Void) {
		let offset = page * limit
		let nameStartsWith: String
		if let name = name, !name.isEmpty{
			nameStartsWith = "nameStartsWith=\(name.replacingOccurrences(of: " ", with: ""))&"
		}else{
			nameStartsWith = ""
		}
		let url = basePath + "offset=\(offset)&limit=\(limit)&" + nameStartsWith + getCredentials()
		print(url)
		AF.request(url).responseJSON { (response) in
			guard let data = response.data else {
				onComplete(nil)
				return
			}
			do{
				let marvelInfo = try JSONDecoder().decode(MarvelInfo.self, from: data)
					   onComplete(marvelInfo)
			}catch{
				print(error.localizedDescription)
				onComplete(nil)
			}
		}
		
	}
	
	private class func getCredentials()-> String{
		let ts = String(Date().timeIntervalSince1970)
		let hash = MD5(ts+privateKey+publicKey).lowercased()
		return "ts=\(ts)&apikey=\(publicKey)&hash=\(hash)"
	}
	
}
