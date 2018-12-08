import Foundation


let sample = """
{
	"author": {
		"name": "Marijn Haverbeke",
		"age": 46
	},
	"title": "Eloquent JavaScript, Second Edition",
	"date": "2014-12-14"
}
"""

/// Converting the sample string into a json data
let jsonData = sample.data(using: String.Encoding.utf8, allowLossyConversion: false)!

/*
Models
*/
struct Book: Codable {
	let author: Author
	let title: String
	let publishingDate: String

    enum CodingKeys: String, CodingKey {
        case author
        case title
        case publishingDate = "date"
    }
}

struct Author: Codable {
	let name: String
	let age: Int
}

// decoder
do {
	let decoder = JSONDecoder()
    decoder.keyDecodingStrategy = .convertFromSnakeCase
	let book = try decoder.decode(Book.self, from: jsonData)
    print(book)
} catch let error {
	print(error)
}

