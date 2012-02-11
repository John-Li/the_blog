class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
		@comments = @post.comments
		@comment = @post.comments.build
	end

	def new
		@post = Post.new
	end

	def edit
		@post = Post.find(params[:id])
	end

	def create
		@post = Post.new(params[:post])
	
    if @post.save
      redirect_to @post, notice: 'Post was successfully created.' 
    else
      render  :new
    end
	end

	def update
		@post = Post.find(params[:id])

		respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy

		respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
	end	

end
