def primo_articolo_di_yahoo(session)
  session.visit "https://it.yahoo.com/"
  begin
    session.click_on "OK"
  rescue Capybara::ElementNotFound
  end
  sleep(1)
  titolo = session.find("#applet_p_50000173 h2").text
  session.find("#applet_p_50000173").click_on("Leggi l'articolo")
  sleep(1)
  contenuto = session.find_all(".body-wrapper").first.text
  {titolo:titolo,
   contenuto:contenuto}
end

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

