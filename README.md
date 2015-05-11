# Careerjet API Client Ruby

It's ruby wrapper for [Careerjet](http://www.careerjet.com)'s API.

## Installation

Add this line to your application's Gemfile:

    gem 'careerjet-api-client-ruby', :require => "careerjet"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install careerjet-api-client-ruby
    
## Usage

```ruby
> Careerjet.search :locale => :en_US, :keywords => 'ruby', :page => 1
=> #<Careerjet::Mash hits=5704 jobs=[<..>] pages=286 response_time=0.0434670448303223 type="JOBS"> 
```

You will get [Hashie::Mash](https://github.com/intridea/hashie#mash) as a response,
so you can get all data via convenient methods:

```ruby
> Careerjet.search(:locale => :en_US, :keywords => 'ruby', :page => 1).jobs.first
#<Careerjet::Mash company="Company Name" date="Wed, 17 Apr 2013 00:00:00 GMT" description=" <..>" url="http://..."> 
```


### Search Params

* `locale`: Locale of search, if locale not specified — using `:en_US`

* `keywords`: Keywords to search in job offers.

* `location`: Location to search job offers in.

* `sort`: Type of sort. Can be: `relevance` (default) — most relevant first, `date` — freshest offer first and `salary` — biggest salary first.

* `start_num`: Number of first offer returned in entire result space. Should be >= 1 and <= Number of hits.

* `pagesize`: Number of offers returned in one call.

* `page`: Number of the asked page. Should be >=1. If this value is set, the eventually given `start_num` is overrided.

* `contracttype`: Character code for contract type.`p` — permanent job, `c` — contract, `t` — temporary, `i` — training, `v` — voluntary, none — all contract types.

* `contractperiod`: Character code for contract work period. `f` — full time, `p` — part time, none — all work period.

## Thanks

This gem was inspired by [careerjet](https://github.com/kostia/careerjet) gem from [kostia](https://github.com/kostia).

## License

Copyright (c) 2012-2013 Sergey Efremov, Kostiantyn Kahanskyi

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

