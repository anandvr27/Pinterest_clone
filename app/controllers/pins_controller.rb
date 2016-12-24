class PinsController < ApplicationController

	before_action :find_pin, only: [:show, :edit, :update, :destroy, :upvote, :downvote], except: :mypins
	before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @pins = Pin.all.order("created_at DESC")
  end

  # GET /pins/1
  # GET /pins/1.json
  def show
  end

  def mypins  
    @pins = current_user.pins.order("created_at DESC")
  end

  # GET /pins/new
  def new
    @pin = Pin.new
  end

  # GET /pins/1/edit
  def edit
    if @pin.user.email != current_user.email
      respond_to do |format|  
        format.html { redirect_to @pin, alert: 'You are not authorised to edit this content' }
      end  
    end
  end

  # POST /pins
  # POST /pins.json
  def create
    @pin = Pin.new(pin_params)
    @pin.user_id = current_user.id
    respond_to do |format|
      if @pin.save
        format.html { redirect_to @pin, notice: 'Pin was successfully created.' }
        format.json { render :show, status: :created, location: @pin }
      else
        format.html { render :new }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pins/1
  # PATCH/PUT /pins/1.json
  def update
    respond_to do |format|
      if @pin.update(pin_params)
        format.html { redirect_to @pin, notice: 'Pin was successfully updated.' }
        format.json { render :show, status: :ok, location: @pin }
      else
        format.html { render :edit }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pins/1
  # DELETE /pins/1.json
  def destroy
    @pin.destroy
    respond_to do |format|
      format.html { redirect_to pins_url, notice: 'Pin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


	def upvote
		@pin.upvote_by current_user
		redirect_to :back
	end

	private

	def pin_params
		params.require(:pin).permit(:title, :description, :image)
	end

	def find_pin
		@pin = Pin.find(params[:id])
	end

end
