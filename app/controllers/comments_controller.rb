class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = Comment.new(comment_params)
    is_create = @comment.save
    if is_create
      comment_html = render_to_string( :partial => 'comments/comment', :formats => [:html], :locals => { :comment => @comment } )
      form_html = render_to_string( :partial => 'comments/form', :formats => [:html], :locals => { :comment => current_user.comments.build(:event_id => @comment.event.id) } )
    else
      form_html = render_to_string( :partial => 'comments/form', :formats => [:html], :locals => { :comment => @comment } )
    end
    PrivatePub.publish_to "/comments/new", :create_status => is_create, :form_html => form_html, :comment_html => comment_html
  end

  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @comment.destroy
    PrivatePub.publish_to "/comments", :comment => @comment
  end

  private
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def comment_params
      params.require(:comment).permit(:content, :user_id, :event_id)
    end
end
