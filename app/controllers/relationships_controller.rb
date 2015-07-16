class RelationshipsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    user = User.find(params[:followed_id])
    active_relationship = current_user.follow(user)

    respond_to do |format|
      format.html { redirect_to user }
      format.json { render json: { url: relationship_path(active_relationship.id), status: :success } }
    end
  end

  def destroy
    user = Relationship.find(params[:id]).followed
    current_user.unfollow(user)
    
    respond_to do |format|
      format.html { redirect_to user }
      format.json { render json: { id: user.id, url: relationships_path, status: :success } }
    end
  end
end
