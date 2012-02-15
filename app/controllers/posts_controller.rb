class PostsController < ApplicationController
  before_filter :signed_in_user, except: [:index, :show]

	def index  
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
		@comments = @post.comments
		@comment = @post.comments.build
	end

	def new
		@post = current_user.posts.build
	end

	def edit
		@post = Post.find(params[:id])
	end

	def create
		@post = current_user.posts.build(params[:post])
	
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.' 
    else
      render  :new
    end
	end

	def update
		@post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      redirect_to @post, notice: 'Post was successfully updated.'
    else
      render :edit
    end
	end

	def destroy
		@post = Post.find(params[:id])
    @user = @post.user
		@post.destroy
    redirect_to @user
	end	

end
