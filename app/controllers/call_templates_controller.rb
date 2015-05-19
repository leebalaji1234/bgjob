class CallTemplatesController < ApplicationController
  before_action :set_call_template, only: [:show, :edit, :update, :destroy]

  # GET /call_templates
  # GET /call_templates.json
  def index
    @call_templates = CallTemplate.all
  end

  # GET /call_templates/1
  # GET /call_templates/1.json
  def show
  end

  # GET /call_templates/new
  def new
    @call_template = CallTemplate.new
  end

  # GET /call_templates/1/edit
  def edit
  end

  # POST /call_templates
  # POST /call_templates.json
  def create
    @call_template = CallTemplate.new(call_template_params)

    respond_to do |format|
      if @call_template.save
        format.html { redirect_to @call_template, notice: 'Call template was successfully created.' }
        format.json { render :show, status: :created, location: @call_template }
      else
        format.html { render :new }
        format.json { render json: @call_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /call_templates/1
  # PATCH/PUT /call_templates/1.json
  def update
    respond_to do |format|
      if @call_template.update(call_template_params)
        format.html { redirect_to @call_template, notice: 'Call template was successfully updated.' }
        format.json { render :show, status: :ok, location: @call_template }
      else
        format.html { render :edit }
        format.json { render json: @call_template.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /call_templates/1
  # DELETE /call_templates/1.json
  def destroy
    @call_template.destroy
    respond_to do |format|
      format.html { redirect_to call_templates_url, notice: 'Call template was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_call_template
      @call_template = CallTemplate.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def call_template_params
      params.require(:call_template).permit(:name, :desc, :flocation, :mode)
    end
end
