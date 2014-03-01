# pemilu
A beautiful Ruby interface of [Pemilu APIs](http://pemiluapi.org)

## Contents
- [Installation][in]
- [How to use pemilu gem][ht]
  - [Configure API key][c]
  - [APIs][a]
    - [List of Candidate attributes][ca]
    - [Get list of all Candidates (`#candidates`)][g]
    - [`#candidates` usage example][cux]
    - [Get details of Candidate (`#candidate`)][gdoc]
    - [`#candidate` usage example][cue]
    - Get list of all Parties [**wait for the next release**][si]
    - Get details of Party [**wait for the next release**][si]
    - Get list of all Provinces [**wait for the next release**][si]
    - Get details of Province [**wait for the next release**][si]
    - Get list of all Electoral Districts [**wait for the next release**][si]
    - Get details of Electoral District [**wait for the next release**][si]

[in]: https://github.com/pyk/pemilu#installation
[ht]: https://github.com/pyk/pemilu#how-to-use-pemilu-gem
[c]: https://github.com/pyk/pemilu#configure-api-key
[a]: https://github.com/pyk/pemilu#apis
[ca]: https://github.com/pyk/pemilu#list-of-candidate-attributes
[g]: https://github.com/pyk/pemilu#get-list-of-all-candidates
[cux]: https://github.com/pyk/pemilu#candidate-usage-example
[gdoc]: https://github.com/pyk/pemilu#get-details-of-candidate
[cue]: https://github.com/pyk/pemilu#candidate-usage-example
[si]: https://github.com/pyk/pemilu#still-in-active-development

## Installation
Add this line to your application's Gemfile:

```ruby
    gem 'test'
```

And then execute:

```shell
    $ bundle
```

Or install it yourself as:

```shell
    $ gem install test
```

## How to use pemilu gem

### Configure
Before accessing all available [APIs](a) make sure Configure your API key first.

``` ruby
    require "pemilu"

    pemilu = Pemilu::API.new(key: "YOUR API KEY")
```

### APIs

#### List of Candidate attributes object
List of available attribute to each candidate that you can get some information
about candidate itself. For example `candidate.id` will display id of candidate.

| Attribute | Return | Description | `#candidates` | `#candidate` |
| --------- | ------ | ----------- | ------------- | ------------ |
| `id` | String | ID of Candidate | x | x |
| `name` | String | Name of Candidate | x | x |
| `gender` | String | Gender of Candidate | x | x |
| `religion`| String | Religion of Candidate | x | x |
| `birthplace` | String | Birthplace of Candidate | x | x |
| `date_of_birth` | String | Date of Candidate birth | x | x |
| `marital_status`| String | Marital status of Candidate | x | x |
| `name_of_couples`| String | Name of Candidate couples | x | x |
| `number_of_children` | Integer | Number of Candidate children | x | x |
| `village` | String | Village where Candidate live | x | x |
| `sub_district` | String | Sub district where Candidate live | x | x |
| `district`| String | District where Candidate live | x | x |
| `province`| Hash | Province where Candidate live | x | x |
| `electoral_district` | Hash | Electoral district where Candidate running on | x | x |
| `election_year`| Integer | Election year where Candidate running on | x | x |
| `legislative_body` | String | Legislative body where Candidate running on (ex. DPR) | x | x |
| `party` | String | Party of Candidate | x | - |
| `party` | Hash | Party of Candidate | - | x |
| `ordinal` | Integer | Ordinal of Candidate | x | x |
| `picture` | String | URL of Candidate picture | x | x |
| `educations` | Array | List of Candidate education history | - | x |
| `jobs` | Array | List of Candidate job history | - | x |
| `organizations` | Array | List of Candidate organization history | - | x |

description:
- `x` mark is sign this attribute available when return from `#candidates` or `#candidates`
- `-` mark is sign this attribute `nil` when return from `#candidates` or `#candidates`
 
#### Get list of all candidates
Return an array of `Pemilu::Candidate` object that filtered by declared option.

```ruby
    pemilu.candidates(options = {})
```
##### Available options

| Option | Value | Default | Description | Return |
| ------ | ----- | ------- | ----------- | ------ |
| `name` | String | `nil`| String full or partial name of the candidate | Only all candidates that matching with `name` |
| `party` | String | `nil` | Name of the available party | Only all candidates on the `party` |
| `electoral_district` | String | `nil`| ID of electoral district (daerah pilihan) | Only all candidates that running on electoral district |
| `election_year` | Integer | `nil` | Election year (tahun pemilihan)of candidate | Only all candidates that running on election year|
| `province` | String | `nil` | ID of the Province | Only all candidates that running on `province` |
| `gender` | String | `nil` | `"L"` for man and `"W"` for woman|Only all candidates has `gender` specified |
| `religion` | String | `nil` | Religion of the candidate | Only all candidates that have religion specified |
| `legislative_body` | String | `nil` | Legislative body that the candidate is running for | Only all candidates that running on that legislative body |
| `limit` | Integer | `100` | Number of records to return | All candidates on specific limit number |
| `offset` | Integer | `nil` | Number the offset | All candidates from beginning of the offset number |

#### `#candidates` usage example

```ruby
    # get 10 man candidates
    pemilu.candidates(limit: 10, gender: "L")

    # print some information about 2 candidates with Islam religion
    candidates = pemilu.candidates(limit:2, religion: "ISLAM")
    candidates.each do |candidate|
      puts "Name: #{candidate.name}"
      puts "Regligion: #{candidate.religion}"
    end
```

#### Get details of Candidate
Return an object of `Pemilu::Candidate` with an `id` specified.

```ruby
    pemilu.candidate("ID CANDIDATE")
```

#### `#candidate` usage example

```ruby
    # print some information about Candidate with id=1101-00-0000-0102
    candidate = pemilu.candidate("1101-00-0000-0102")
    puts "Name: #{candidate.name}"
```

## Still in active development
23:32 Saturday, 1 March 2014.
Sorry this gem is still under development. Actually you can use it on production
because this gem is [well tested][wt]. But, you don't get full feature yet.
Please wait for the next release. You can give me a shot at [@peeyek][pyk] on twitter.

[wt]: https://github.com/pyk/pemilu/tree/master/spec
[pyk]: https://twitter.com/peeyek/
