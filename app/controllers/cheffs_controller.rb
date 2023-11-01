class CheffsController < ApplicationController
  before_action :set_cheff, only: %i[ show edit update destroy ]

  # GET /cheffs or /cheffs.json
  def index
    @cheffs = Cheff.all
  end

  # GET /cheffs/1 or /cheffs/1.json
  def show
  end
  
  # GET /cheffs/new
  def new
    @cheff = Cheff.new
  end

  # GET /cheffs/1/edit
  def edit
  end

  # POST /cheffs or /cheffs.json
  def create
    @cheff = Cheff.new(cheff_params)

    respond_to do |format|
      if @cheff.save
        format.html { redirect_to cheff_url(@cheff), notice: "Cheff was successfully created." }
        format.json { render :show, status: :created, location: @cheff }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @cheff.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /cheffs/1 or /cheffs/1.json
  def update
    respond_to do |format|
      if @cheff.update(cheff_params)
        format.html { redirect_to cheffs_path, notice: "Cheff was successfully updated." }
        format.json { render :show, status: :ok, location: @cheff }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cheff.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cheffs/1 or /cheffs/1.json
  def destroy
    @cheff.destroy

    respond_to do |format|
      format.html { redirect_to cheffs_path, notice: "Cheff was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cheff
      @cheff = Cheff.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def cheff_params
      params.require(:cheff).permit(:day, :time, :cuisine, :meal, :price, :booked_num, :max_num)
    end
end
