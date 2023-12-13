class DropratesController < ApplicationController
  before_action :set_droprate, only: %i[ show edit update destroy ]

  # GET /droprates or /droprates.json
  def index
    @droprates = Droprate.all
  end

  # GET /droprates/1 or /droprates/1.json
  def show
  end

  # GET /droprates/new
  def new
    @droprate = Droprate.new
  end

  # GET /droprates/1/edit
  def edit
  end

  # POST /droprates or /droprates.json
  def create
    @droprate = Droprate.new(droprate_params)

    respond_to do |format|
      if @droprate.save
        format.html { redirect_to droprate_url(@droprate), notice: "Droprate was successfully created." }
        format.json { render :show, status: :created, location: @droprate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @droprate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /droprates/1 or /droprates/1.json
  def update
      @droprate.update(droprate_params)
  end

  # DELETE /droprates/1 or /droprates/1.json
  def destroy
    @droprate.destroy!

    respond_to do |format|
      format.html { redirect_to droprates_url, notice: "Droprate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_droprate
      @droprate = Droprate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def droprate_params
      params.require(:droprate).permit(:item_name, :drop_chance, :boss_kills, :kills_per_drop)
    end
end
