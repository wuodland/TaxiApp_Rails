#Topups can only be added when signed in via admins user(check layouts/application.html.erb for the necessary info and login URL)

class TopupsController < ApplicationController
  before_action :set_topup, only: [:show, :edit, :update, :destroy]
  before_action :customer_list

  # GET /topups
  # GET /topups.json
  def index
    @topups = Topup.all
  end

  # GET /topups/1
  # GET /topups/1.json
  def show
  end

  # GET /topups/new
  def new
    @topup = Topup.new
  end

  # GET /topups/1/edit
  def edit
  end

  # POST /topups
  # POST /topups.json
  def create
    @topup = Topup.new(topup_params)

    respond_to do |format|
      if @topup.save
        format.html { redirect_to @topup, notice: 'Topup was successfully created.' }
        format.json { render :show, status: :created, location: @topup }
      else
        format.html { render :new }
        format.json { render json: @topup.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /topups/1
  # PATCH/PUT /topups/1.json
  def update
    respond_to do |format|
      if @topup.update(topup_params)
        format.html { redirect_to @topup, notice: 'Topup was successfully updated.' }
        format.json { render :show, status: :ok, location: @topup }
      else
        format.html { render :edit }
        format.json { render json: @topup.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /topups/1
  # DELETE /topups/1.json
  def destroy
    @topup.destroy
    respond_to do |format|
      format.html { redirect_to topups_url, notice: 'Topup was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_topup
      @topup = Topup.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def topup_params
      params.require(:topup).permit(:customer_id, :balance)
    end
    def customer_list
      @customerlist = Customer.select(:id).distinct
    end

end
