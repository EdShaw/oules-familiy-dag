class ParentOfsController < ApplicationController
  before_action :set_parent_of, only: [:show, :edit, :update, :destroy]

  # GET /parent_ofs
  # GET /parent_ofs.json
  def index
    @parent_ofs = ParentOf.all
  end

  # GET /parent_ofs/1
  # GET /parent_ofs/1.json
  def show
  end

  # GET /parent_ofs/new
  def new
    @parent_of = ParentOf.new
  end

  # GET /parent_ofs/1/edit
  def edit
  end

  # POST /parent_ofs
  # POST /parent_ofs.json
  def create
    @parent_of = ParentOf.new(parent_of_params)

    respond_to do |format|
      if @parent_of.save
        format.html { redirect_to @parent_of, notice: 'Parent of was successfully created.' }
        format.json { render :show, status: :created, location: @parent_of }
      else
        format.html { render :new }
        format.json { render json: @parent_of.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /parent_ofs/1
  # PATCH/PUT /parent_ofs/1.json
  def update
    respond_to do |format|
      if @parent_of.update(parent_of_params)
        format.html { redirect_to @parent_of, notice: 'Parent of was successfully updated.' }
        format.json { render :show, status: :ok, location: @parent_of }
      else
        format.html { render :edit }
        format.json { render json: @parent_of.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /parent_ofs/1
  # DELETE /parent_ofs/1.json
  def destroy
    @parent_of.destroy
    respond_to do |format|
      format.html { redirect_to parent_ofs_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_parent_of
      @parent_of = ParentOf.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def parent_of_params
      params.require(:parent_of).permit(:parent_id, :child_id)
    end
end
