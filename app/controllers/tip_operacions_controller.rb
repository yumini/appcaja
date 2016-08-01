class TipOperacionsController < ApplicationController
  before_action :set_tip_operacion, only: [:show, :edit, :update, :destroy]

  # GET /tip_operacions
  # GET /tip_operacions.json
  def index
    @tip_operacions = TipOperacion.all
  end

  # GET /tip_operacions/1
  # GET /tip_operacions/1.json
  def show
  end

  # GET /tip_operacions/new
  def new
    @tip_operacion = TipOperacion.new
    @page_title ="Tipo de Operacion"
  end

  # GET /tip_operacions/1/edit
  def edit
  end

  # POST /tip_operacions
  # POST /tip_operacions.json
  def create
    @tip_operacion = TipOperacion.new(tip_operacion_params)

    respond_to do |format|
      if @tip_operacion.save
        format.html { redirect_to @tip_operacion, notice: 'Tip operacion was successfully created.' }
        format.json { render :show, status: :created, location: @tip_operacion }
      else
        format.html { render :new }
        format.json { render json: @tip_operacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tip_operacions/1
  # PATCH/PUT /tip_operacions/1.json
  def update
    respond_to do |format|
      if @tip_operacion.update(tip_operacion_params)
        format.html { redirect_to @tip_operacion, notice: 'Tip operacion was successfully updated.' }
        format.json { render :show, status: :ok, location: @tip_operacion }
      else
        format.html { render :edit }
        format.json { render json: @tip_operacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tip_operacions/1
  # DELETE /tip_operacions/1.json
  def destroy
    @tip_operacion.destroy
    respond_to do |format|
      format.html { redirect_to tip_operacions_url, notice: 'Tip operacion was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tip_operacion
      @tip_operacion = TipOperacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tip_operacion_params
      params.require(:tip_operacion).permit(:nom_opera, :abrev_opera, :tipo_opera, :contable)
    end
end
