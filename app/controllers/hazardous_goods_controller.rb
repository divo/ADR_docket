class HazardousGoodsController < ApplicationController
  before_action :set_hazardous_good, only: [:show, :edit, :update, :destroy]

  # GET /hazardous_goods
  # GET /hazardous_goods.json
  def index
    @hazardous_goods = HazardousGood.all
  end

  # GET /hazardous_goods/1
  # GET /hazardous_goods/1.json
  def show
  end

  # GET /hazardous_goods/new
  def new
    @hazardous_good = HazardousGood.new
  end

  # GET /hazardous_goods/1/edit
  def edit
  end

  # POST /hazardous_goods
  # POST /hazardous_goods.json
  def create
    @hazardous_good = HazardousGood.new(hazardous_good_params)

    respond_to do |format|
      if @hazardous_good.save
        format.html { redirect_to @hazardous_good, notice: 'Hazardous good was successfully created.' }
        format.json { render :show, status: :created, location: @hazardous_good }
      else
        format.html { render :new }
        format.json { render json: @hazardous_good.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hazardous_goods/1
  # PATCH/PUT /hazardous_goods/1.json
  def update
    respond_to do |format|
      if @hazardous_good.update(hazardous_good_params)
        format.html { redirect_to @hazardous_good, notice: 'Hazardous good was successfully updated.' }
        format.json { render :show, status: :ok, location: @hazardous_good }
      else
        format.html { render :edit }
        format.json { render json: @hazardous_good.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hazardous_goods/1
  # DELETE /hazardous_goods/1.json
  def destroy
    @hazardous_good.destroy
    respond_to do |format|
      format.html { redirect_to hazardous_goods_url, notice: 'Hazardous good was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hazardous_good
      @hazardous_good = HazardousGood.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hazardous_good_params
      params.require(:hazardous_good).permit(:name, :un_number, :primary_class, :secondary_class, :packing_group, :tunnel_code)
    end
end
