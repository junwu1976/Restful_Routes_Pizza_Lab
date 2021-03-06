require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )

require_relative('models/pizza_order')
also_reload('./models/*')

#should be the PizzaOrder.all method
get '/pizza-orders' do
  @orders = PizzaOrder.all()
  erb(:index)
end

#show
get '/pizza-orders/new' do
  erb(:new)
end

get '/pizza-orders/:id' do
  @order = PizzaOrder.find(params[:id])
  erb(:show)
end

post '/pizza-orders' do
  @order = PizzaOrder.new(params)
  @order.save()
  erb(:create)
end

post '/pizza-orders/:id/delete' do
  @order = PizzaOrder.find(params[:id])
  PizzaOrder.delete_id(params[:id])
  redirect '/pizza-orders'
  # erb(:destroy)
end

get '/pizza-orders/:id/edit' do
  @order = PizzaOrder.find(params[:id])
  erb(:edit)
end

post '/pizza-orders/:id' do
  @order = PizzaOrder.new(params)
  puts params
  @order.update
  erb(:show)
end
