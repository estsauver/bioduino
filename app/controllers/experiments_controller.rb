class ExperimentsController < ApplicationController
  # GET /experiments
  # GET /experiments.json
  def index
    @experiments = Experiment.order("id desc").all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @experiments }
    end
  end

  # GET /experiments/1
  # GET /experiments/1.json
  def show
    @experiment = Experiment.find(params[:id])
    @temperatures = @experiment.datapoints.where(:dataType => "temperature").order("id desc").first(70000)
    @pHs = @experiment.datapoints.where(:dataType => "pH").order("id desc").first(70000)
    @agitations = @experiment.datapoints.where(:dataType => "agitation").order("id desc").first(70000)
    @dissolvedOxygens = @experiment.datapoints.where(:dataType => "do").order("id desc").first(70000)
    gon.temperatureData = [{:values => @temperatures.map{ |d| {:x => (d.time-@experiment.startTime).seconds, :y => d.value} }, :key=> "Experiment id:#{@experiment.id}", :color =>'#ff7f0e'}]
    gon.pHData = [{:values => @pHs.map{ |d| {:x => (d.time-@experiment.startTime).seconds, :y => d.value} }, :key=> "Experiment id:#{@experiment.id}", :color =>'#ff7f0e'}]
    gon.doData = [{:values => @dissolvedOxygens.map{ |d| {:x => (d.time-@experiment.startTime).seconds, :y => d.value} }, :key=> "Experiment id:#{@experiment.id}", :color =>'#ff7f0e'}]
    gon.agitData = [{:values => @agitations.map{ |d| {:x => (d.time-@experiment.startTime).seconds, :y => d.value} }, :key=> "Experiment id:#{@experiment.id}", :color =>'#ff7f0e'}]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @experiment }
    end
  end



  # GET /experiments/new
  # GET /experiments/new.json
  def new
    @experiment = Experiment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @experiment }
    end
  end

  # GET /experiments/1/edit
  def edit
    @experiment = Experiment.find(params[:id])
  end

  # POST /experiments
  # POST /experiments.json
  def create
    @experiment = Experiment.new(params[:experiment])

    respond_to do |format|
      if @experiment.save
        format.html { redirect_to @experiment, notice: 'Experiment was successfully created.' }
        format.json { render json: @experiment, status: :created, location: @experiment }
      else
        format.html { render action: "new" }
        format.json { render json: @experiment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /experiments/1
  # PUT /experiments/1.json
  def update
    @experiment = Experiment.find(params[:id])

    respond_to do |format|
      if @experiment.update_attributes(params[:experiment])
        format.html { redirect_to @experiment, notice: 'Experiment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @experiment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /experiments/1
  # DELETE /experiments/1.json
  def destroy
    @experiment = Experiment.find(params[:id])
    @experiment.destroy

    respond_to do |format|
      format.html { redirect_to experiments_url }
      format.json { head :no_content }
    end
  end

  def current
    @experiment = Experiment.last
    redirect_to @experiment
  end

  def raw_data
    @experiment = Experiment.find(params[:id])
    @temperatures = @experiment.datapoints.where(:dataType => "temperature").order("id desc").all
    @pHs = @experiment.datapoints.where(:dataType => "pH").order("id desc").all
    @agitations = @experiment.datapoints.where(:dataType => "agitation").order("id desc").all
    @dissolvedOxygens = @experiment.datapoints.where(:dataType => "do").order("id desc").all
    @maximumGroupInt = @experiment.datapoints.maximum("group_int")
    @minimumGroupInt = @experiment.datapoints.minimum("group_int")
    respond_to do |format|
      format.html
      format.xls 
    end
  end
end
