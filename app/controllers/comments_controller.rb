class CommentsController < ApplicationController
    http_basic_authenticate_with name:"will", password:"will",only: [:destroy]

    def create
        #render plain: params[:post].inspect
        @post= Post.find(params[:post_id])
        @comment= @post.comments.create(comment_params)

        redirect_to post_path (@post)
        
    end
    def new 
        @comment=Comment.form
    end

    def destroy
        @post= Post.find(params[:post_id])
        @comment= @post.comments.find(params[:id])
        @comment.destroy
        if (@comment.save)
            redirect_to post_path(@post)
        else
            render 'new'
        end
    end

    private def comment_params
        params.require(:comment).permit(:username,:body)
    end
end
