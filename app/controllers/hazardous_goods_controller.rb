class HazardousGoodsController < ApplicationController
  before_action :set_hazardous_good, only: [:show, :edit, :update, :destroy]

  # GET /hazardous_goods
  def index
    @hazardous_goods = HazardousGood.all
  end

  # GET /hazardous_goods/1
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
  def create
    @hazardous_good = HazardousGood.new(hazardous_good_params)

    respond_to do |format|
      if @hazardous_good.save
        format.html { redirect_to @hazardous_good, notice: 'Hazardous good was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /hazardous_goods/1
  def update
    respond_to do |format|
      if @hazardous_good.update(hazardous_good_params)
        format.html { redirect_to @hazardous_good, notice: 'Hazardous good was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /hazardous_goods/1
  def destroy
    @hazardous_good.destroy
    respond_to do |format|
      format.html { redirect_to hazardous_goods_url, notice: 'Hazardous good was successfully destroyed.' }
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
