class NotesController < ApplicationController

  def index
    @notes = Note.all
  end

  def new
    @note = Note.new
  end

  def create
    binding.pry
    @item = Item.find(params[:format])
    @note = Note.create(note_params)
  end

  private

  def note_params
    params.require(:note).permit(:body)
  end
end
