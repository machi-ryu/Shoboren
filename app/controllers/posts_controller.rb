class PostsController < ApplicationController

    def create
        @post = Post.new(post_params)
        #@post = Post.find(params[:id])
        @post.save
        redirect_to controller: :places, action: :show, id: @post.place_id
    end

    private
        def post_params
            params.require(:post).permit(:content, :user_id, :place_id)
        end

end
