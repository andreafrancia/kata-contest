describe "Example" do
  let(:app) do
    require 'sinatra/base'
    Sinatra::Base.new
  end
  example "mechanize" do
    require 'capybara'
    require 'capybara/mechanize'
    session = Capybara::Session.new(:mechanize, app)
    session.visit "https://github.com/jeroenvandijk/capybara-mechanize"
    expect(session.title).to eq("GitHub - jeroenvandijk/capybara-mechanize: RackTest driver for Capybara with remote request support")
  end
  example 'firefox' do
    require 'capybara'
    require 'webdrivers'
    session = Capybara::Session.new(:selenium_headless)
    session.visit("http://example.com/")
    expect(session.title).to eq('Example Domain')
  end
  example "chrome" do
    require 'capybara'
    require 'webdrivers'
    session = Capybara::Session.new(:selenium_chrome_headless)
    session.visit("http://example.com/")
    expect(session.title).to eq('Example Domain')
  end
end