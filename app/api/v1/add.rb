module V1
  class Add < Grape::API
  	format :json
  	
    resource :user_data do
		desc "List all Users"
		get do
			::UserData.all
		end

		desc "create a new user"
		params do
			requires :name, type: String
			requires :address, type: String
			requires :age, type: Integer
		end

		post do 
			UserData.create!({
				name:params[:name],
				address:params[:address],
				age:params[:age]
				})
		end

		desc "delete an user"
		params do
			requires :id, type: String
		end
		delete ':id' do
			UserData.find(params[:id].destroy!)
		end

		desc "update an user address"
		params do
			requires :id, type: String
			requires :address, type: String
		end
		put ':id' do
			UserData.find(params[:id]).update({
				address:params[:address]
			})
		end
	end
  end    	
end