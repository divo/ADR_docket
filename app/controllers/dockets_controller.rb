class DocketsController < ApplicationController
  before_action :set_docket, only: [:show, :edit, :update, :destroy]

  # GET /dockets
  # GET /dockets.json
  def index
    @dockets = Docket.all
  end

  # GET /dockets/1
  # GET /dockets/1.json
  def show
  end

  # GET /dockets/new
  def new
    @docket = Docket.new
    @addresses = Address.all
    @_hazardous_good = HazardousGood.new
    @hazardous_goods = HazardousGood.all
  end

  # GET /dockets/1/edit
  def edit
  end

  # POST /dockets
  # POST /dockets.json
  def create
    build_new_address('deliver_to')
    build_new_address('collect_from')
    build_hazardous_good

    @docket = Docket.new(docket_params)

    respond_to do |format|
      if @docket.save
        format.html { redirect_to @docket, notice: 'Docket was successfully created.' }
        format.json { render :show, status: :created, location: @docket }
      else
        format.html { render :new }
        format.json { render json: @docket.errors, status: :unprocessable_entity }
      end
    end
  end

  def build_new_address(key)
    return if address_params["new_#{key}_address"].empty? || docket_params["#{key}_id"].present?

    address = Address.create(address: address_params["new_#{key}_address"])
    params[:docket]["#{key}_id"] = address.id
  end

  def build_hazardous_good
    return if hazardous_good_params.values.all?(&:empty?) || docket_params[:hazardous_good_id].present?

    hazardous_good = HazardousGood.create(hazardous_good_params)
    params[:docket][:hazardous_good_id] = hazardous_good.id
  end

  # PATCH/PUT /dockets/1
  # PATCH/PUT /dockets/1.json
  def update
    respond_to do |format|
      if @docket.update(docket_params)
        format.html { redirect_to @docket, notice: 'Docket was successfully updated.' }
        format.json { render :show, status: :ok, location: @docket }
      else
        format.html { render :edit }
        format.json { render json: @docket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dockets/1
  # DELETE /dockets/1.json
  def destroy
    @docket.destroy
    respond_to do |format|
      format.html { redirect_to dockets_url, notice: 'Docket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_docket
    @docket = Docket.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def docket_params
    params.require(:docket).permit(:weight, :berth, :size, :equipment_no,
                                   :customer_reference_no, :seal_no, :description,
                                   :return_empty, :deliver_to_id, :collect_from_id,
                                   :hazardous_good_id)
  end

  def address_params
    params.require(:docket).permit(:new_deliver_to_address, :new_collect_from_address)
  end

  def hazardous_good_params
    params.require(:hazardous_good).permit(:name, :un_number, :primary_class, :secondary_class, :packing_group, :tunnel_code)
  end
end
