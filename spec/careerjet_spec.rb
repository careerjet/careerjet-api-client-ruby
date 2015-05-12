require 'webmock/rspec'
require 'careerjet/api_client'

describe Careerjet::APIClient do
  it "should request Careejet's search API with correct domain and given params" do
    resp = {'hits' => 1, 'response_time' =>  0.001, 'type' => 'JOBS', 'pages' => 1}
    stub_request(:get, "http://public.api.careerjet.net/search?affid=test_affid&keywords=rails&locale_code=en_US&page=1&user_agent=Mozilla/5.0%20(X11%3B%20Linux%20x86_64%3B%20rv:31.0)%20Gecko/20100101%20Firefox/31.0&user_ip=192.168.0.40").to_return(
        :body => MultiJson.encode(resp))
    careerjet_api_client = Careerjet::APIClient.new(:locale => :en_US);

    results = careerjet_api_client.search(:affid=>'test_affid',:user_ip=>'192.168.0.40',:user_agent=>'Mozilla/5.0 (X11; Linux x86_64; rv:31.0) Gecko/20100101 Firefox/31.0',:locale => :en_US, :keywords => 'rails', :page => 1)

    expect(results.hits).to eq 1
    expect(results.response_time).to eq 0.001
  end

  it 'should raise appropriate error on unknown locale' do
    lambda do
      careerjet_api_client = Careerjet::APIClient.new(:locale => :foo_BAR);
    end.should raise_error(Careerjet::UnknownLocale)
  end

  it 'should validate given params' do
    lambda do
      careerjet_api_client = Careerjet::APIClient.new(:locale => :en_GB);
      careerjet_api_client.search(:locale => :en_US, :keywords => 'rails', :foo => 'bar')
    end.should raise_error(Careerjet::InvalidParam)
  end
end
