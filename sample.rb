#!env ruby
#encoding: utf-8

require 'oauth'
require_relative 'xauther'

begin
    print 'Consumer Key: '
    consumerkey = gets.chomp
    print 'Consumer Secret: '
    consumersecret = gets.chomp
    print 'Your Twitter ID: '
    id = gets.chomp
    system "stty -echo"
    print 'Your Password: '
    pw = gets.chomp
    system "stty echo"
end

consumer = OAuth::Consumer.new(consumerkey, consumersecret, site: "https://oauth.twitter.com")
access_token = consumer.get_request_token.xauth(id,pw)

puts access_token.token, access_token.secret
