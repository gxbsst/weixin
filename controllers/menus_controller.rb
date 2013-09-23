# encoding: utf-8
require  File.expand_path('../../lib/regex_router_filter', __FILE__) 

before_with_regexp(/^\/menu/) do 
		WXAPPID =  APP_CONFIG['wx_app_id']
		WXAPPSECRET =  APP_CONFIG['wx_app_secret']

	  FHTTP = Faraday.new(:url => 'https://api.weixin.qq.com') do |faraday|
	   faraday.request  :url_encoded             # form-encode POST params
	   faraday.response :logger                  # log requests to STDOUT
	   faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
	  end

	  result = FHTTP.get("cgi-bin/token?grant_type=client_credential&appid=#{WXAPPID}&secret=#{WXAPPSECRET}")
	  @access_token = JSON.parse(result.body)["access_token"]
end

get '/menu' do

	result = FHTTP.post do |req|
		req.url "cgi-bin/menu/create?access_token=#{@access_token}"
		req.body = '
			{
			     "button":[
			     {	
			          "type":"view",
			          "name":"关于我们",
			          "url":"http://www.sidways.com/aboutus.html"
			      },
			      {
			           "type":"view",
			           "name":"联系我们",
			           "url":"http://www.sidways.com/contactus.html"
			      },
			      {
			           "name":"服务",
			           "sub_button":[
			            {
			               "type":"view",
			               "name":"客户列表",
			               "url":"http://www.sidways.com/service.html"
			            },
			            {
			               "type":"view",
			               "name":"客户内容",
			               "url":"http://www.sidways.com/service.html"
			            },
			            {
			               "type":"click",
			               "name":"咨询",
			               "key":"V1001_GOOD"
			            }]
			       }]
			 }
		'
	end

	result.body

end

get '/menu/show' do 
	result = FHTTP.get("cgi-bin/menu/get?access_token=#{@access_token}")
	result.body
end

get '/menu/delete' do 
	result = FHTTP.get("cgi-bin/menu/delete?access_token=#{@access_token}")
	result.body
end

