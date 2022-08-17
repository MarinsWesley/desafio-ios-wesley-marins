//
//  MarvelClasses.swift
//  HeroisMarvel
//  HeroisMarvel
//
//  Created by MacbookAirWesley on 01/08/22.
//  Copyright © 2022 Eric Brito. All rights reserved.
//

import Foundation


struct MarvelInfo : Decodable {
	let code: Int
	let status: String
	let data: MarvelData
}

struct MarvelData : Codable{
	let offset: Int
	let limit: Int
	let total: Int
	let count: Int
	let results: [Hero]
}

struct Hero: Codable {
	let id: Int
	let name: String
	let description: String
	let thumbnail: Thumbnail
	let urls: [HeroURL]
}

struct Thumbnail: Codable {
	let path: String
	let ext: String
	
	var url: String {
		return path + "." + ext
	}
	
	enum CodingKeys: String, CodingKey {
		case path
		case ext = "extension"
	}
}

struct HeroURL : Codable {
	let type: String
	let url: String
}

struct ComicData: Decodable {
	let data: Datas
}

struct Datas: Codable {
	let limit: Int
	let total: Int
	let results: [Comics]
}

struct Comics: Codable {
	let title: String
	let thumbnail: ComicsImage
	let description: String?
	let prices: [Price]
}

struct Price: Codable {
	let price: Float
}

struct ComicsImage: Codable {
	let path: String
	let ext: String
	var url: String {
		return path + "." + ext
	}
	
	enum CodingKeys : String, CodingKey {
		case path
		case ext = "extension"
	}
}


