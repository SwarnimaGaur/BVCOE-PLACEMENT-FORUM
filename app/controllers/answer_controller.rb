class AnswerController < ApplicationController
  def create

    @question = Question.find(params[:question_id])
    @answer = @question.answers.new
    @answer.ans =params[:ans]
    @answer.question_id = params[:question_id]
    @answer.user_id = params[:user_id]

    if @answer.save
      redirect_to url_for(:controller => :question, :action => :QnA)
    else
      redirect_to url_for(:controller => :question, :action => :QnA)
    end
  end


  def destroy
    @answer = Answer.find(params[:id])
    if current_user.admin?
      @answer.destroy

      redirect_to url_for(:controller => :question, :action => :QnA)

    elsif current_user.id == @answer.user_id

      @answer.destroy

      redirect_to url_for(:controller => :question, :action => :QnA)
    else
      redirect_to url_for(:controller => :question, :action => :QnA)
    end
  end
end


