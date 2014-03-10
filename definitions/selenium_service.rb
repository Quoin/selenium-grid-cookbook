
define :selenium_service, :role => nil do
  params[:role] ||= params[:name]

  template "/etc/init.d/selenium-#{params[:role].to_s}" do
    source "server.initd.erb"
    mode "0755"
    variables({
      :role => params[:role]
    })
  end

  service "selenium-#{params[:role]}" do
    action [:start, :enable]
  end
end
