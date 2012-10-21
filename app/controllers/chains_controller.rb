class ChainsController < ApplicationController
  # GET /chains
  # GET /chains.json
  def index
    @chains = Chain.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @chains }
    end
  end

  # GET /chains/1
  # GET /chains/1.json
  def show
    @chain = Chain.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @chain }
    end
  end

  # GET /chains/new
  # GET /chains/new.json
  def new
    @chain = Chain.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @chain }
    end
  end

  # GET /chains/1/edit
  def edit
    @chain = Chain.find(params[:id])
  end

  # POST /chains
  # POST /chains.json
  def create
    @chain = Chain.new(params[:chain])

    respond_to do |format|
      if @chain.save
        format.html { redirect_to @chain, notice: 'Chain was successfully created.' }
        format.json { render json: @chain, status: :created, location: @chain }
      else
        format.html { render action: "new" }
        format.json { render json: @chain.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /chains/1
  # PUT /chains/1.json
  def update
    @chain = Chain.find(params[:id])

    respond_to do |format|
      if @chain.update_attributes(params[:chain])
        format.html { redirect_to @chain, notice: 'Chain was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @chain.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chains/1
  # DELETE /chains/1.json
  def destroy
    @chain = Chain.find(params[:id])
    @chain.destroy

    respond_to do |format|
      format.html { redirect_to chains_url }
      format.json { head :no_content }
    end
  end
end
