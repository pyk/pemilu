# Pemilu
A beautiful Ruby interface of Pemilu API

## Installation
TODO: write installation instruction

## Usage

### Configure
Configure your API key first.

    pemilu = Pemilu::API.new(key: "YOUR API KEY")

### List of APIs
TODO: add link to API
1. Get all candidates
2. Get specific candidate
3.

### Get all candidates
Return an array of `Pemilu::Candidate` object that specific by declared option.

    pemilu.candidates # => [...]
    pemilu.candidates(options = {})

Available options:
TODO: make table from this data below

Option      : `name`
Value       : String
Description : String full or partial name of the candidate
Return      : Only all candidates that matching with `name`
Usage       : `pemilu.candidates(name: "bayu aldi yansyah")`

Option      : `party`
Value       : String
Description : Name of the available party
Return      : Only all candidates on the `party`
Usage       : `pemilu.candidates(party: "Partai Asolole jos!")`

Option      : `election_district`
Value       : String
Description : ID of election district (daerah pilihan)
Return      : Only all candidates that running on election district
Usage       : `pemilu.candidates(election_district: "1101-00-0000")`

Option      : `election_year`
Value       : Integer
Description : Election year (tahun pemilihan)of candidate
Return      : Only all candidates that running on election year
Usage       : `pemilu.candidates(election_year: 2014)`

Option      : `province`
Value       : String
Description : ID of the Province
Return      : Only all candidates that running on `province`
Usage       : `pemilu.candidates(province: "01")`

Option      : `gender`
Value       : String
Description : `"L"` for man and `"W"` for woman
Return      : Only all candidates has `gender`
Usage       : `pemilu.candidates(gender: "L")`

Option      : `religion`
Value       : String
Description : Religion of the candidate
Return      : Only all candidates that have religion specified
Usage       : `pemilu.candidates(religion: "islam")`

Option      : `legislative_body`
Value       : String
Description : Legislative body that the candidate is running for
Return      : Only all candidates that running on that legislative body
Usage       : `pemilu.candidates(legislative_body: "DPD")

Option      : `limit`
Value       : Integer
Description : Number of records to return
Return      : All candidates on specific limit number
Usage       : `pemilu.candidates(limit: 20)`

Option      : `offset`
Value       : Integer
Description : Number the offset
Return      : All candidates from beginning of the offset number
Usage       : `pemilu.candidates(offset: 100)`

### this gem is still on active development
