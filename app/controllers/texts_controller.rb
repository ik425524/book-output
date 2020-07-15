class TextsController < ApplicationController

  def index
    @texts = Text.all.order(created_at: :desc)
  end

  def new
  end

  def create
    @text = Text.new(title: params[:title], text: params[:text])
    @text.save
    redirect_to texts_path
  end

  def show
    @text = Text.find_by(id: params[:id])
  end

end
