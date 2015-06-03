json.session do
  json.(@user, :id, :name, :email, :admin)
  json.token @user.authentication_token
end
