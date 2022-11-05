class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  # add routes
  get '/bakeries' do
    bakery=Bakery.all
    bakery.to_json
  end

  get '/bakeries/:id' do
    bakeries=Bakery.find(params[:id])
    bakeries.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do 
    price=BakedGood.all.order(price: :desc)
    price.to_json
  end


  get '/baked_goods/most_expensive' do
    exp=BakedGood.all.order(price: :desc).first
    exp.to_json
  end

end
