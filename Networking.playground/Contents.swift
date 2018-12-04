import UIKit

/// A sample string
let sample = """
{
	"author": {
		"name": "Marijn Haverbeke",
		"age": 46
	},
	"title": "Eloquent JavaScript, Second Edition",
	"puplishingDate": "2014-12-14"
}
"""

/// Converting the sample string into a json to
let json = sample.data(using: String.Encoding.utf8, allowLossyConversion: false)!

/*
Models
*/
struct Book: Codable {
	let author: Author
	let title: String
	let puplishingDate: String
}

struct Author: Codable {
	let name: String
	let age: Int
}

// decoder
do {
	let decoder = JSONDecoder()
	let data = try decoder.decode(Book.self, from: json)
	print(data)
} catch let error {
	print(error)
}

/* Cases to test:
1- the properties naming matching the json keys
2- the properties naming matching the json keys except for one key (use CodingKeys to map the keys)
3- the properties naming matching the json keys but in different case (puplishingDate property is puplishing_date in json, should use (decoder.keyDecodingStrategy = .convertFromSnakeCase))
4- how to read the decoding errors
*/
