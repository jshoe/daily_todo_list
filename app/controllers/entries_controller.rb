class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]

  # GET /entries
  # GET /entries.json
  def index
    @entries = Entry.all
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
  end

  # GET /entries/new
  def new
    @entry = Entry.new
  end

  # GET /entries/1/edit
  def edit
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.new(entry_params)
    @entry.item_id = session[:current_item_id]

    respond_to do |format|
      if @entry.save
        flash[:success] = 'Entry was successfully created.'
        format.html { redirect_to @entry }
        format.json { render :show, status: :created, location: @entry }
      else
        flash[:danger] = 'There was a problem creating the Item.'
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        flash[:success] = 'Entry was successfully updated.'
        format.html { redirect_to @entry.item }
        format.json { render :show, status: :ok, location: @entry }
      else
        flash[:danger] = 'There was a problem updating the Item.'
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      flash[:success] = 'Entry was successfully deleted.'
      format.html { redirect_to entries_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def entry_params
      params.require(:entry).permit(:num_val, :text_val, :created_at, :updated_at, :item_id, :notes)
    end
end
