class TextsController < ApplicationController

  def index
    @texts = Text.all.order(updated_at: :desc).page(params[:page]).per(5)
  end

  def new
    @text = Text.new
  end

  def create
    @text = Text.new(title: params[:title], text: params[:text], user_id: current_user.id)
  
    if @text.save
      flash[:notice]= "投稿が完了しました"
      redirect_to texts_path
    else
      flash[:notice]= "タイトル、要約を記入して下さい"
      redirect_to texts_new_path
    end
  end

  def show
    @text = Text.find_by(id: params[:id])
  end

  def edit
    @text = Text.find_by(id: params[:id])
  end

  def update
    @text = Text.find_by(id: params[:id])
    @text.title = params[:title]
    @text.text = params[:text]
    if @text.save
      flash[:notice]= "編集が完了しました"
      redirect_to texts_path
    else
      flash[:notice]= "タイトル、要約を記入して下さい"
      redirect_to ("/texts/#{@text.id}/edit")
    end
  end

  def destroy
    flash[:notice]= "削除が完了しました"
    redirect_to texts_path
    @text = Text.find_by(id: params[:id])
    @text.destroy
  end

  private
  def text_params
    params.require(:text).permit(:title, :text).merge(user_id: current_user.id)
  end

end
