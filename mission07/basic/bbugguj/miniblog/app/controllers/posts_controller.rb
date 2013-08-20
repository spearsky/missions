class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]

  def search
    @posts = Post.where("text like '%#{params[:search]}%'")
    @posts << Post.where("title like '%#{params[:search]}%'")
    @posts.flatten!.uniq!
    @communities = Community.all
    render :template => 'welcome/index'
    
  end

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @community = Community.find(params[:community_id])
    @post = @community.posts.new(post_params)
    @post.user = current_user        

    if @post.save
      redirect_to community_path @community
    else
      render action: 'new'
    end

    # respond_to do |format|
    #   if @post.save
    #     format.html { redirect_to @post, notice: 'Post was successfully created.' }
    #     format.json { render action: 'show', status: :created, location: @post }
    #   else
    #     format.html { render action: 'new' }
    #     format.json { render json: @post.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :text, :user_id, :community_id)
    end
end
