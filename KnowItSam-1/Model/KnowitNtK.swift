//
//  KnowitNtK.swift
//  KnowItSam-1
//
//  Created by Bruker on 22/02/2022.
//

import SwiftUI

struct Temperature: Codable {
    let alternativtNavn, beskrivelse: String
    let beslektedeTjenester: BeslektedeTjenester
    let beslektedeTjenesterRef: [JSONAny]
    let brosjyrer: String
    let brukOverordnet: Bool
    let datoOppdatert, datoOpprettet: String
    let dokumentRef: [DokumentRef]
    let emneordRefs: [EmneordRef]
    let flette: [String: Int]
    let frittFelt1, frittFelt2, frittFelt3, frittFelt4: String
    let frittFelt5, ingress, internOpplysninger, internSaksgang: String
    let kategori: [JSONAny]
    let kostraID: BeslektedeTjenester
    let kriterier: String
    let ledetekstFrittFelt1: LedetekstFrittFelt1?
    let ledetekstFrittFelt2, ledetekstFrittFelt3, ledetekstFrittFelt4, ledetekstFrittFelt5: String?
    let livsITRefs: [String]
    let lover: String
    let lovpalagtTjeneste: Bool
    let malgruppe, merknaderOSK, navn: String
    let oppgrader: Bool
    let partnere, pris: String
    let revisjon: Int
    let servicekontoretsAnsvar: BeslektedeTjenester
    let servicelofte, servicesanksjon, servicevilkar, soknadBehandling: String
    let soknadBehandlingstid, soknadFrist, soknadKlage, soknadMerknader: String
    let soknadMottaker, soknadSkjema, soknadVedlegg, soknadVeiledning: String
    let statsID: BeslektedeTjenester
    let scalaTjenestebeskrivelseStatus: ScalaTjenestebeskrivelseStatus
    let stikkord, tjenesteEier: String
    let tjenestebeskrivelseID: TjenestebeskrivelseID
    let datoPublisert, gyldigFra, gyldigTil: String?
}

enum BeslektedeTjenester: String, Codable {
    case br = "<br />\u{d}\n"
    case empty = ""
    case pNullP = "<p>\u{d}\n\tnull</p>\u{d}\n"
}

// MARK: - DokumentRef
struct DokumentRef: Codable {
    let beskrivelse: String?
    let datoOppdatert: String
    let dokumentID, dokumenttypeID: Int
    let land: Land
    let lastesNed: Bool
    let sprak: Sprak
    let tittel: String
    let uri: String
    let variant: Variant
}

enum Land: String, Codable {
    case empty = ""
    case no = "NO"
}

enum Sprak: String, Codable {
    case ar = "ar"
    case en = "en"
    case fr = "fr"
    case no = "no"
    case ru = "ru"
    case se = "se"
    case tr = "tr"
}

enum Variant: String, Codable {
    case empty = ""
    case ny = "NY"
}

// MARK: - EmneordRef
struct EmneordRef: Codable {
    let psi: String
    let scalaTjenestebeskrivelseID: TjenestebeskrivelseID
}

// MARK: - TjenestebeskrivelseID
struct TjenestebeskrivelseID: Codable {
    let land: Land
    let sprak: Sprak
    let tjenesteID: Int
    let variant: Variant
    let versjon: Int
}

enum LedetekstFrittFelt1: String, Codable {
    case empty = ""
    case lovpålagt = "Lovpålagt"
}

// MARK: - ScalaTjenestebeskrivelseStatus
struct ScalaTjenestebeskrivelseStatus: Codable {
    let status: Status
    let statusAlternativtNavn, statusBeskrivelse, statusBeslektedeTjenester, statusBrosjyrer: Int
    let statusDatoGodkjent, statusDatoOppdatert, statusDatoOpprettet, statusDatoPublisert: Int
    let statusEmneord, statusFrittFelt1, statusFrittFelt2, statusFrittFelt3: Int
    let statusFrittFelt4, statusFrittFelt5, statusGyldigFra, statusGyldigTil: Int
    let statusIngress, statusInternOpplysninger, statusInternSaksgang, statusKostraID: Int
    let statusKriterier, statusLivsitID, statusLover, statusMalgruppe: Int
    let statusNavn, statusPartnere, statusPris, statusServicekontoretsAnsvar: Int
    let statusServicelofte, statusServicesanksjon, statusServicevilkar, statusSoknadBehandling: Int
    let statusSoknadBehandlingstid, statusSoknadFrist, statusSoknadKlage, statusSoknadMerknader: Int
    let statusSoknadMottaker, statusSoknadSkjema, statusSoknadVedlegg, statusSoknadVeiledning: Int
    let statusStatsID, statusStikkord, statusTjenesteEier, statusTjenesteID: Int
}

enum Status: String, Codable {
    case publisert = "publisert"
}

typealias Temperatures = [Temperature]

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}

