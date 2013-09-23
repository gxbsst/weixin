#encoding: utf-8
require 'weixin/middleware'
require 'weixin/model'
use Weixin::Middleware, 'sidways_weixin_token', '/wx'

configure do
    set :wx_id, 'sidways'
end

after do
  logger.info "response body: #{response.body.first} "
  logger.info "response header: #{response.header} "
  logger.info "response status: #{response.status} "
end

helpers do
 def create_message(from, to, type, content, flag=0)
    msg = Weixin::TextReplyMessage.new
    # msg = Weixin::MusicReplyMessage.new
    # m = Weixin::Music.new
    # m.Title = 'title'
    # m.Description = 'Description'
    # m.MusicUrl = 'http://www.red.com'
    # m.HQMusicUrl = 'http://www.sidways.com/2.mp3'

    msg.Music = m
    msg.ToUserName = to
    msg.FromUserName = from
    msg.Content = content
    msg.to_xml
 end
end

get '/wx' do
 params[:echostr]
end

post '/wx' do
 content_type :xml, 'charset' => 'utf-8'
 status 200
 message = request.env[Weixin::Middleware::WEIXIN_MSG]
 from = message.FromUserName
 reply_msg_content = "亲，有问题，请联系我们： 上海市徐汇区永嘉路625号101室\n 电话: 021-54365565 \n QQ: 3299211"
# logger.info "message: #{request.env[Weixin::Middleware::WEIXIN_MSG_RAW]}"
# logger.info "from: #{from}\n"
# logger.info "type: #{message.class}"
 logger.info "message: #{message.inspect}"
# logger.info (create_message(settings.wx_id, from, 'text', reply_msg_content))
 #if message.class == Weixin::EventMessage
 #    if message.Event == 'subscribe'
 #        reply_msg_content = "感谢关注！#{reply_msg_content}"
 #    end
 #end
 create_message(settings.wx_id, from, 'music', reply_msg_content)
end


