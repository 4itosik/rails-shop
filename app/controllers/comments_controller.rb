class CommentsController < ApplicationController
	def create	
		comment = Comment.new
		if comment.update_attributes (comment_params)
			product = Product.find(params[:comment][:product_id])
			product.comments << comment
		end  
	end

	private
	  def comment_params
	    params.require(:comment).permit(:name, :body)
	  end
end
