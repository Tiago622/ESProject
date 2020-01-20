class OrganicUnitsController < ApplicationController
  before_action :set_organic_unit, only: [:show, :edit, :update, :destroy]
  #before_action :authenticate_user!
  helper_method :sort_column, :sort_direction

  # GET /organic_units
  # GET /organic_units.json
  def index
    @organic_units = OrganicUnit.order(sort_column + " " + sort_direction)
  end

  # GET /organic_units/1
  # GET /organic_units/1.json
  def show
  end

  # GET /organic_units/new
  def new
    @organic_unit = OrganicUnit.new
  end

  # GET /organic_units/1/edit
  def edit
  end

  # POST /organic_units
  # POST /organic_units.json
  def create
    @organic_unit = OrganicUnit.new(organic_unit_params)

    respond_to do |format|
      if @organic_unit.save
        format.html { redirect_to @organic_unit, notice: 'Organic unit was successfully created.' }
        format.json { render :show, status: :created, location: @organic_unit }
      else
        format.html { render :new }
        format.json { render json: @organic_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /organic_units/1
  # PATCH/PUT /organic_units/1.json
  def update
    respond_to do |format|
      if @organic_unit.update(organic_unit_params)
        format.html { redirect_to @organic_unit, notice: 'Organic unit was successfully updated.' }
        format.json { render :show, status: :ok, location: @organic_unit }
      else
        format.html { render :edit }
        format.json { render json: @organic_unit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /organic_units/1
  # DELETE /organic_units/1.json
  def destroy
    @organic_unit.destroy
    respond_to do |format|
      format.html { redirect_to organic_units_url, notice: 'Organic unit was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_organic_unit
      @organic_unit = OrganicUnit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def organic_unit_params
      params.require(:organic_unit).permit(:name, :acronym)
    end
     
    def sort_column
      OrganicUnit.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
