class SubscribesController < ApplicationController
  before_action :set_subscribe, only: %i[ show edit update destroy ]

  # GET /subscribes or /subscribes.json
  def index
    @subscribes = Subscribe.all
  end

  # GET /subscribes/1 or /subscribes/1.json
  def show
  end

  # GET /subscribes/new
  def new
    @subscribe = Subscribe.new
  end

  # GET /subscribes/1/edit
  def edit
  end

  # POST /subscribes or /subscribes.json
  def create
    @subscribe = Subscribe.new(subscribe_params)

    respond_to do |format|
      if @subscribe.save
        format.html { redirect_to subscribe_url(@subscribe), notice: "Subscribe was successfully created." }
        format.json { render :show, status: :created, location: @subscribe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @subscribe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subscribes/1 or /subscribes/1.json
  def update
    respond_to do |format|
      if @subscribe.update(subscribe_params)
        format.html { redirect_to subscribe_url(@subscribe), notice: "Subscribe was successfully updated." }
        format.json { render :show, status: :ok, location: @subscribe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @subscribe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subscribes/1 or /subscribes/1.json
  def destroy
    @subscribe.destroy

    respond_to do |format|
      format.html { redirect_to subscribes_url, notice: "Subscribe was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subscribe
      @subscribe = Subscribe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def subscribe_params
      params.require(:subscribe).permit(:status, :expired_at, :user_id_id)
    end
end
