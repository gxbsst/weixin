ENV['RACK_ENV'] = 'test'

require "sinatra"
require_relative "../spec_helper"
# require_relative "../../controllers/posts_controller"
# require_relative "../../models/post"

describe "Post Controllers" do
  let(:post){double(Post)}
   before(:each) do
   # post = stub_model(Post)
   Post.stub(:first).and_return(post)
  end
  it "response 200" do
  	Post.should_receive(:first).and_return(post)
    get '/'
    expect(last_response.status).to eql(200)
  end

  describe "GET show" do
    it "include xxx" do
      get '/post/1'
      expect(last_response.body).to include('xxx')
    end
  end
end