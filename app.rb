require 'sinatra'
require 'slim'
require 'rack-flash'
require 'pony'

Pony.options = {
  via: :smtp,
  via_options: {
    address:   'smtp.sendgrid.net',
    port:      '587',
    domain:    'heroku.com',
    user_name: ENV['SENDGRID_USERNAME'],
    password:  ENV['SENDGRID_PASSWORD'],
    authentication:       :plain,
    enable_starttls_auto: true
  }
}

enable :sessions
use Rack::Flash

CONTACT_EMAIL = 'benjamin@rubyist.fr'

get '/' do
  slim :home
end

post '/contact' do
  if params[:email].empty? || params[:message].empty?
    flash[:error] = 'Merci de bien vouloir renseigner tous les champs du formulaire'
  else
    Pony.mail to:      CONTACT_EMAIL,
              from:    params[:email],
              subject: 'Nouvelle demande de contact',
              body:    slim(:email)
    flash[:notice] = 'Nous avons bien pris votre demande en compte'
  end

  redirect '/'
end

get '/*' do
  redirect '/'
end
