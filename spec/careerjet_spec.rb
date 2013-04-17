require 'webmock/rspec'
require 'careerjet'

describe Careerjet do
  it "should request Careejet's search API with correct domain and given params" do
    resp = {'hits' => 1, 'response_time' =>  0.001, 'type' => 'JOBS', 'pages' => 1}
    stub_http_request(:get, 'http://public.api.careerjet.net/search?keywords=rails&locale_code=en_US&page=1').to_return(
        :body => MultiJson.encode(resp))

    results = Careerjet.search(:locale => :en_US, :keywords => 'rails', :page => 1)

    results.hits.should eql 1
    results.response_time.should eql 0.001
  end

  it 'should raise appropriate error on unknown locale' do
    lambda do
      Careerjet.search :locale => :foo_Bar
    end.should raise_error(Careerjet::UnknownLocale)
  end

  it 'should validate given params' do
    lambda do
      Careerjet.search :locale => :en_US, :keywords => 'rails', :foo => 'bar'
    end.should raise_error(Careerjet::InvalidParam)
  end
end
