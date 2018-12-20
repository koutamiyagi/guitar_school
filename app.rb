require 'sinatra'
require 'sinatra/reloader'
require 'json'
require 'mysql2'
require 'mysql2-cs-bind'
require 'pry'

set :public_folder, 'public'
enable :sessions

# Mysqlドライバの設定
client = Mysql2::Client.new(
    host: 'localhost',
    port: 3306,
    username: 'root',
    password: '',
    database: 'guitar_school',
    reconnect: true,
)

get '/' do
  @res = client.query("SELECT * FROM news order by id desc LIMIT 3;")
  @res.each do |row|

  end

  @resPicture = client.query("SELECT * FROM picture order by id desc;")
  @resPicture.each do |row|
  end

  erb :index

end

get '/hello' do
  'aiueo'
end

get '/time' do
  'time'
end

get '/hello/:name' do
  # "GET /hello/foo" と "GET /hello/bar" にマッチ
  # params['name'] は 'foo' か 'bar'
  #{}"Hello #{params['name']}!"
  @name = params[:name]
  erb :hello
end

get '/p' do
  params.to_s
  response = []

  if params[:name]
    response << "こんちは、 #{params[:name]}"
  end

  if params[:age]
    response << "#{params[:age]}歳ですか"
  end

  response.join('<br>')
end

# get '/form' do
#   erb :form
# end
#
# post '/form' do
#   #params.to_s
#   @name = params[:name]
#   @email = params[:email]
#   @content = params[:content]
#   erb :form_post
#
# end
# 　　　　　　　　　　　　　　↓自分自身 Tutorialのパスが入る
json_path = File.dirname(__FILE__) + '/data/data.json'

get '/form' do
  @data = open(json_path) do |io|
    @data = JSON.load(io)
  end

  erb :form
end

post '/form' do
  @filename = params[:file][:filename]
  file = params[:file][:tempfile]

  File.open("./public/image/#{@filename}", 'wb') do |f|
    f.write(file.read)
  end

  datum = {
    "name" => params[:name],
    "email" => params[:email],
    "content" => params[:content],
    "image" => params[:file][:filename],
  }

  data = []
  open(json_path) do |io|
    data = JSON.load(io)
  end

  data << datum

  open(json_path, 'w') do |io|
    JSON.dump(data, io)
  end

  redirect '/form'
end

get '/session' do
  @name = session[:name]
  erb :session_form
end

post '/session' do
session[:name] = params[:name]

  redirect '/session'
end

get '/login' do
  @name = session[:login]
  @message = session[:message]
  session[:message] = nil
  erb :login_form
end

post '/login' do
res = client.xquery("SELECT * FROM users where name = ? and password = ?;", params[:name], params[:password]).first

  if res
    session[:name] = res['name']
    redirect '/admin'
  else
    redirect '/login'
  end
end


get '/logout' do
  session[:name] = nil
  redirect '/'
end


get '/hello/konkon' do
  'こんちは'
end

get "/image" do
  erb :image_form
end

post '/image' do

  @filename = params[:file][:filename]
  file = params[:file][:tempfile]

  File.open("./public/image/#{@filename}", 'wb') do |f|
    f.write(file.read)
  end

  erb :image_show
end

# 新規作成(GET)
get '/create' do
  erb :create
end

post '/create' do
  # 投稿を新規作成（プレースホルダー使わない版）
  query = "INSERT INTO articles (title, description, created_at, updated_at) VALUES ('#{params[:title]}', '#{params[:description]}', CURRENT_TIMESTAMP(), CURRENT_TIMESTAMP())"

  # クエリ実行
  client.query(query)

  # トップページにリダイレクト
  redirect to('/')
end

get '/admin' do
  if session[:name].nil?
    redirect '/'
  end
  erb :admin
end

get '/news_form' do
  if session[:name].nil?
    redirect '/'
  end
  erb :news_form
end

post '/news_save' do

  if params[:upimg]
    up_img_name = params[:upimg][:filename]
    file = params[:upimg][:tempfile]
    File.open("./public/assets/img/" + up_img_name, 'wb') do |f|
      f.write(file.read)
    end
  else
    up_img_name = nil
  end

  client.xquery("INSERT INTO news VALUES (NULL, ?, ?, ?, NULL, NULL);", params[:title], params[:content], DateTime.now)

   redirect '/news_form'
end

get '/news_show' do
  @showAll = '<a href=/news_show_all>すべて表示</a>'
  @res = client.query("SELECT * FROM news order by id desc LIMIT 5;")
  @res.each do |row|

  end

  erb :news_show
end

get '/news_show_all' do
  @showTop = '<a href=/news_show>最新５件表示</a>'
  @res = client.query("SELECT * FROM news order by id desc;")
  @res.each do |row|

  end

  erb :news_show
end

get '/news_edit' do
  if session[:name].nil?
    redirect '/'
  end

  @res = client.query("SELECT * FROM news order by id desc;")
  @res.each do |row|

  end

  erb :news_edit
end

delete '/news_delete' do
  # ファイル削除
  client.xquery("DELETE FROM news WHERE id = ?;", params[:news_id])

  redirect '/news_edit'
end

post '/news_update' do

  client.xquery("update news set title = ?,content = ? where id = ?;", params[:news_title], params[:news_content],params[:news_id])

   redirect '/news_edit'

end

get '/news_update_form' do
  if session[:name].nil?
    redirect '/'
  end
  erb :news_update_form
end


get '/picture_form' do
  if session[:name].nil?
    redirect '/'
  end
  erb :picture_form
end

post '/picture_save' do

    params[:upimg]
    up_img_name = params[:upimg][:filename]
    file = params[:upimg][:tempfile]
    File.open("./public/assets/img/" + up_img_name, 'wb') do |f|
    f.write(file.read)
  end
  client.xquery("INSERT INTO picture VALUES (NULL, ?, ?, NULL);", up_img_name, DateTime.now)

   redirect '/picture_form'
end

get '/picture_edit' do
  if session[:name].nil?
    redirect '/'
  end
  @resPicture = client.query("SELECT * FROM picture order by id desc;")
  @resPicture.each do |row|

  end

  erb :picture_edit
end

delete '/picture_delete' do
  # ファイル削除
  client.xquery("DELETE FROM picture WHERE id = ?;", params[:picture_id])

  redirect '/picture_edit'
end
