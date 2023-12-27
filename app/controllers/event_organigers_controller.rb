class EventOrganigersController < ApplicationController
  before_action :set_event_organiger, only: %i[ show update destroy ]

  # GET /event_organigers
  def index
    @event_organigers = EventOrganiger.all

    render json: @event_organigers
  end

  # GET /event_organigers/1
  def show
    render json: @event_organiger
  end

  # POST /event_organigers
  def create
    @event_organiger = EventOrganiger.new(event_organiger_params)

    if @event_organiger.save
      render json: @event_organiger, status: :created, location: @event_organiger
    else
      render json: @event_organiger.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /event_organigers/1
  def update
    if @event_organiger.update(event_organiger_params)
      render json: @event_organiger
    else
      render json: @event_organiger.errors, status: :unprocessable_entity
    end
  end

  # DELETE /event_organigers/1
  def destroy
    @event_organiger.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_organiger
      @event_organiger = EventOrganiger.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def event_organiger_params
      params.require(:event_organiger).permit(:name, :email, :contact_person, :phone_no)
    end
end
