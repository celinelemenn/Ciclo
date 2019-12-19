class TestMailer < ActionMailer::Base
  def hello
    mail(
      :subject => 'Hello from Postmark',
      :to  => 'admin@ciclooapp.com',
      :from => 'admin@ciclooapp.com',
      :html_body => '<strong>Hello</strong> dear Postmark user.',
      :track_opens => 'true')
  end
end
