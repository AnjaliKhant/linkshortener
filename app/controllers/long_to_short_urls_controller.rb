class LongToShortUrlsController < ApplicationController
  def new
    @long_to_short_url = LongToShortUrl.new
  end

  def show
    @long_to_short_url = LongToShortUrl.find_by(id: params[:id])
    if @long_to_short_url
      visitors =  @long_to_short_url.visitors.find_by(ip_address: request.remote_ip)
      if visitors.nil?
        @long_to_short_url.visitors.create(ip_address: request.remote_ip) # track IP address
      else
        visitors.update(counter: visitors.counter+1)
      end
      redirect_to @long_to_short_url.original_url
      # redirect_to long_to_short_url_info_path(@long_to_short_url.id)
    else
      flash[:error] = "Invalid URL."
      redirect_to root_path
    end
  end

  def create
    @long_to_short_url = LongToShortUrl.new(long_to_short_url_params)

    if @long_to_short_url.save
      flash[:success] = "Short URL was successfully created."
      redirect_to long_to_short_url_path(@long_to_short_url)
    else
      flash.now[:error] = "Failed to create a short URL."
      render :new
    end
  rescue ActiveRecord::RecordNotUnique
    # handle duplicate short URLs
    @long_to_short_url.short_url = nil
    retry
  end

  def info
    @long_to_short_url = LongToShortUrl.find(params[:id])
    @visitor = @long_to_short_url.visitors.all
  end

  private
  
  def long_to_short_url_params
    params.require(:long_to_short_url).permit(:original_url)
  end
end
