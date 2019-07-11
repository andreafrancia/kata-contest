def registrati(session, username)
  session.visit "http://www.ciediweb.it/automation_contest/index.php/component/users/?view=registration&Itemid=101"
  session.fill_in 'jform[name]', with: username
  session.fill_in 'jform[username]', with: username
  session.fill_in 'jform[password1]', with: username
  session.fill_in 'jform[password2]', with: username
  session.fill_in 'jform[email1]', with: username
  session.fill_in 'jform[email2]', with: username
  session.find_all(".btn-primary").first.click
end

def fai_login(session, username)
  session.visit "http://www.ciediweb.it/automation_contest/index.php"
  session.fill_in "modlgn-username", with: username
  session.fill_in "modlgn-passwd", with: username
  session.click_on "Accedi"
end


def sottoponi_un_articolo(session, titolo, contenuto)
  Capybara.ignore_hidden_elements = false
  session.visit "http://www.ciediweb.it/automation_contest/index.php/submit-an-article"
  session.fill_in "jform[title]", with: titolo

  session.click_on "Editor sì/no"
  session.fill_in "jform[articletext]", with:contenuto
  session.click_on "Pubblicazione"

  session.find("#jform_catid_chzn").click
  session.find("#jform_catid_chzn input").set "blog\n"
  session.find_all(".btn-primary").first.click
end


def mechanize_session
  require 'capybara/mechanize'
  require 'sinatra/base'
  app = Sinatra::Base.new
  Capybara::Session.new(:mechanize, app)
end

def chrome_session
  require 'capybara'
  Capybara::Session.new(:selenium_chrome)
end

