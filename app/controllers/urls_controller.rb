class UrlsController < ApplicationController

  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def show
    @url = Url.find_by(params[:id])
    redirect_to @url.url
  end

  def create
  @url = Url.new(url_params)

    respond_to do |format|
        if @url.save
          format.html { redirect_to @url, notice: 'Url was successfully created.' }
          format.json { render :show, status: :created, location: @url}
        else
          format.html { render :new }
          format.json { render json: @url.errors, status: :unprocessable_entity }
        end
    end
  end

private
# Never trust parameters from the scary internet, only allow the white list through.
def url_params
  params.require(:url).permit(:url)
end

end
