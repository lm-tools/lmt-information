before do
  content_type :json
  headers 'Access-Control-Allow-Origin' => '*',
          'Access-Control-Allow-Methods' => ['POST']
end

set :protection, false
set :public_dir, Proc.new { File.join(root, "_site") }

post '/send_email' do
  res = Pony.mail(
    :from => params[:name] + "<" + params[:email] + ">",
    :to => ENV['FEEDBACK_EMAIL'],
    :subject => "[FEEDBACK] " + params[:subject],
    :body => params[:message],
    :via => :smtp,
    :via_options => {
      :address              => 'smtp.sendgrid.net',
      :port                 => '587',
      :enable_starttls_auto => true,
      :user_name            => ENV['SENDGRID_USERNAME'],
      :password             => ENV['SENDGRID_PASSWORD'],
      :authentication       => :plain,
      :domain               => 'heroku.com'
    })
  if res
    redirect '/index.html'
  else
    redirect '/error.html'
  end
end

set :public_folder, '_site'

get "/*" do
  redirect '/index.html'
end
