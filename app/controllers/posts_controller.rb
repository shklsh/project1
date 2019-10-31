class PostsController < ApplicationController
    before_action :authorise_post, :except => [:index]
    
    def index
        @posts = Post.all
    end

    def show
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    def create
        # render plain: params[:post].inspect
        @post = Post.new(post_params)

        if @post.save
            redirect_to @post
        else
            render 'new'
        end
    end
    
    def edit
        @post = Post.find(params[:id])
    end 

    def update
    @post = Post.find(params[:id])
 
        if @post.update(post_params)
        redirect_to @post
        else
        render 'edit'
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end

    # Strong params: create a whitelist of permitted parameters
    private def post_params
        params.require(:post).permit(:name, :city, :objective)
    end
end