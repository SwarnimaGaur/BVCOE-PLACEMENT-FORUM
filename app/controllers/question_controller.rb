class QuestionController < ApplicationController
before_action :authenticate_user!
  def create
	@question=Question.new(params.require(:question).permit(:ques ,:id))

	@question.user_id = current_user.id
	@question.save
if @question.save
	redirect_to url_for(:controller => :question, :action=> :QnA)
else
	redirect_to url_for(:controller => :question, :action=> :QnA)
 end

end

def update
	@question = Question.find(id: params[:id])
	@question.update(ques: params[:ques], id: params[:id], user_id: params[:user_id])
  redirect_to url_for(:controller => :question, :action => :QnA)
	end

  def destroy
		 @question = Question.find(params[:id])
		 if current_user.admin? 

		 		 @question.destroy

	redirect_to url_for(:controller => :experience, :action => :browse_exp)

	elsif current_user.id == @question.user_id 
		 
		 @question.destroy

		redirect_to url_for(:controller => :question, :action => :QnA)
	else 
		redirect_to url_for(:controller => :question, :action => :QnA)
    end
end


def ask
@question= Question.new
	end

  
  def edit
@questions=Question.find(params[:user_id])
end

  def QnA
@questions =Question.includes(:answers).all.order(created_at: :desc)
end

end