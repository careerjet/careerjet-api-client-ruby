# Careerjet API Client Ruby

It's ruby wrapper for [Careerjet](http://www.careerjet.com)'s API.

## Installation

Add this line to your application's Gemfile:

    gem 'careerjet-api-client', :require => "careerjet/api_client"

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install careerjet-api-client
    
## Usage

```ruby
> cj_api_client = Careerjet::APIClient.new(:locale=> :es_ES) 
> cj_api_client.search(:affid=>'213e213hd12344552',:user_ip=>'192.168.0.40',:user_agent=>'Mozilla/5.0 (X11; Linux x86_64; rv:31.0) Gecko/20100101 Firefox/31.0');
=> #<Careerjet::Mash hits=5704 jobs=[<..>] pages=286 response_time=0.0434670448303223 type="JOBS"> 
```

You will get [Hashie::Mash](https://github.com/intridea/hashie#mash) as a response,
so you can get all data via convenient methods:

```ruby
> cj_api_client.search(:affid=>'213e213hd12344552',:user_ip=>'192.168.0.40',:user_agent=>'Mozilla/5.0 (X11; Linux x86_64; rv:31.0) Gecko/20100101 Firefox/31.0').jobs.first
#<Careerjet::Mash company="Company Name" date="Wed, 17 Apr 2013 00:00:00 GMT" description=" <..>" url="http://..."> 
```


### Mandatory Search Params

* `affid`      : Affiliate ID provided by Careerjet. Requires to open a Careerjet partner account (http://www.careerjet.com/partners/).
* `user_ip`    : IP address of the end-user to whom the search results will be displayed.  
* `user_agent` : User agent of the end-user's browser.

### Optional Search Params 

* `keywords`: Keywords to search in job offers.

* `location`: Location to search job offers in.

* `sort`: Type of sort. Can be: `relevance` (default) — most relevant first, `date` — freshest offer first and `salary` — biggest salary first.

* `start_num`: Number of first offer returned in entire result space. Should be >= 1 and <= Number of hits.

* `pagesize`: Number of offers returned in one call.

* `page`: Number of the asked page. Should be >=1. If this value is set, the eventually given `start_num` is overrided.

* `contracttype`: Character code for contract type.`p` — permanent job, `c` — contract, `t` — temporary, `i` — training, `v` — voluntary, none — all contract types.

* `contractperiod`: Character code for contract work period. `f` — full time, `p` — part time, none — all work period.

* `locale`: Locale of search, if locale not specified — using `:en_US`
  supported locale
```
    :cs_CZ  => 'http://www.careerjet.cz'                  ,
    :da_DK  => 'http://www.careerjet.dk'                  ,
    :de_AT  => 'http://www.careerjet.at'                  ,
    :de_CH  => 'http://www.careerjet.ch'                  ,
    :de_DE  => 'http://www.careerjet.de'                  ,
    :en_AE  => 'http://www.careerjet.ae'                  ,
    :en_AU  => 'http://www.careerjet.com.au'              ,
    :en_BD  => 'http://www.careerjet.com.bd'              ,
    :en_CA  => 'http://www.careerjet.ca'                  ,
    :en_CN  => 'http://en.careerjet.cn'                   ,
    :en_HK  => 'http://www.careerjet.hk'                  ,
    :en_IE  => 'http://www.careerjet.ie'                  ,
    :en_IN  => 'http://www.careerjet.co.in'               ,
    :en_KW  => 'http://www.careerjet.com.kw'              ,
    :en_MY  => 'http://www.careerjet.com.my'              ,
    :en_NZ  => 'http://www.careerjet.co.nz'               ,
    :en_OM  => 'http://www.careerjet.com.om'              ,
    :en_PH  => 'http://www.careerjet.ph'                  ,
    :en_PK  => 'http://www.careerjet.com.pk'              ,
    :en_QA  => 'http://www.careerjet.com.qa'              ,
    :en_SG  => 'http://www.careerjet.sg'                  ,
    :en_GB  => 'http://www.careerjet.co.uk'               ,
    :en_US  => 'http://www.careerjet.com'                 ,
    :en_ZA  => 'http://www.careerjet.co.za'               ,
    :en_SA  => 'http://www.careerjet-saudi-arabia.com'    ,
    :en_TW  => 'http://www.careerjet.com.tw'              ,
    :en_VN  => 'http://www.careerjet.vn'                  ,
    :es_AR  => 'http://www.opcionempleo.com.ar'           ,
    :es_BO  => 'http://www.opcionempleo.com.bo'           ,
    :es_CL  => 'http://www.opcionempleo.cl'               ,
    :es_CO  => 'http://www.opcionempleo.com.co'           ,
    :es_CR  => 'http://www.opcionempleo.co.cr'            ,
    :es_DO  => 'http://www.opcionempleo.com.do'           ,
    :es_EC  => 'http://www.opcionempleo.ec'               ,
    :es_ES  => 'http://www.opcionempleo.com'              ,
    :es_GT  => 'http://www.opcionempleo.com.gt'           ,
    :es_MX  => 'http://www.opcionempleo.com.mx'           ,
    :es_PA  => 'http://www.opcionempleo.com.pa'           ,
    :es_PE  => 'http://www.opcionempleo.com.pe'           ,
    :es_PR  => 'http://www.opcionempleo.com.pr'           ,
    :es_PY  => 'http://www.opcionempleo.com.py'           ,
    :es_UY  => 'http://www.opcionempleo.com.uy'           ,
    :es_VE  => 'http://www.opcionempleo.com.ve'           ,
    :fi_FI  => 'http://www.careerjet.fi'                  ,
    :fr_CA  => 'http://fr.careerjet.ca'                   ,
    :fr_BE  => 'http://www.optioncarriere.be'             ,
    :fr_CH  => 'http://www.optioncarriere.ch'             ,
    :fr_FR  => 'http://www.optioncarriere.com'            ,
    :fr_LU  => 'http://www.optioncarriere.lu'             ,
    :fr_MA  => 'http://www.optioncarriere.ma'             ,
    :hu_HU  => 'http://www.careerjet.hu'                  ,
    :it_IT  => 'http://www.careerjet.it'                  ,
    :ja_JP  => 'http://www.careerjet.jp'                  ,
    :ko_KR  => 'http://www.careerjet.co.kr'               ,
    :nl_BE  => 'http://www.careerjet.be'                  ,
    :nl_NL  => 'http://www.careerjet.nl'                  ,
    :no_NO  => 'http://www.careerjet.no'                  ,
    :pl_PL  => 'http://www.careerjet.pl'                  ,
    :pt_PT  => 'http://www.careerjet.pt'                  ,
    :pt_BR  => 'http://www.careerjet.com.br'              ,
    :ru_RU  => 'http://www.careerjet.ru'                  ,
    :ru_UA  => 'http://www.careerjet.com.ua'              ,
    :sv_SE  => 'http://www.careerjet.se'                  ,
    :sk_SK  => 'http://www.careerjet.sk'                  ,
    :tr_TR  => 'http://www.careerjet.com.tr'              ,
    :uk_UA  => 'http://www.careerjet.ua'                  ,
    :vi_VN  => 'http://www.careerjet.com.vn'              ,
    :zh_CN  => 'http://www.careerjet.cn'                  ,

```


## Thanks

This gem was inspired by [careerjet](https://github.com/kostia/careerjet) gem from [kostia](https://github.com/kostia).

## License

Copyright (c) 2012-2013 Sergey Efremov, Kostiantyn Kahanskyi, Careerjet Ltd

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

