
 class <%= plural_class_name%>Controller < ApplicationController

  def download 
    file_content = []
    <%= name %> = <%= class_name %>.find(params[:id])
    @<%= doc %> = <%= name %>.<%= doc %>
    @<%= title %> = <%= name %>.<%= title %>.to_s
    file_name =  (@<%= title %>+".textile")
    send_data(@<%= doc %>, :filename => file_name, :type => "text/textile")
   end
  
  def download_html
    <%= name %> = <%= class_name %>.find(params[:id])
    @<%= doc %> = RedCloth.new(<%= name %>.<%= doc %>).to_html
    @<%= title %> = <%= name %>.<%= title %>.to_s
    file_name =  (@<%= title %>+".html")
    send_data(@<%= doc %>, :filename => file_name, :type => "text/html")
  end 
 
  def index
    @<%=  plural_name %> = <%= class_name %>.all
  end

  def show
    @<%= name %> = <%= class_name %>.find(params[:id])
  end

  def new
    @<%= name %> = <%= class_name %>.new
  end

  def create
    @<%= name %> = <%= class_name %>.new(params[:<%= name %>])
    if @<%= name %>.save
      flash[:notice] = "Successfully created <%= name %>."
      render :action => "edit"
    else
      render :action => 'new'
    end
  end

  def edit
    @<%= name %> = <%= class_name %>.find(params[:id])
  end

  def update
    @<%= name %> = <%= class_name %>.find(params[:id])
    if @<%= name %>.update_attributes(params[:<%= name %>])
      flash[:notice] = "Successfully updated <%= name %>."
      render :action => "edit"
    else
      render :action => 'edit'
    end
  end

  def destroy
    @<%= name %> = <%= class_name %>.find(params[:id])
    @<%= name %>.destroy
    flash[:notice] = "Successfully destroyed <%= name %>."
    redirect_to <%= plural_name %>_url
  end
 
end