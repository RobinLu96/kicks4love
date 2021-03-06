class Admin::CalendarPostsController < Admin::AdminController

	skip_before_filter :verify_authenticity_token, :only => [:destroy]
	before_action :get_calendar_post, :only => [:edit, :destroy, :update, :show]

	def index
		@page_title = "Calendar Posts | Kicks4Love Admin"
		@calendar_posts = CalendarPost.all
		@expired_posts_count = CalendarPost.old.size
 		if params[:filter].present?
 			if params[:filter][:release_type].present?
 				@calendar_posts = @calendar_posts.where(:release_type => params[:filter][:release_type])
 			end
 			if params[:filter][:sort_date] == "insc"
 				@calendar_posts = @calendar_posts.order(release_date: :ASC)
 			else
 				@calendar_posts = @calendar_posts.order(release_date: :DESC)
 			end
 			session[:calendar_post_per_page] = params[:filter][:per_page].to_i
 		else
 			@calendar_posts.latest
 		end
		@per_page = session[:calendar_post_per_page] || 5
		@calendar_posts = @calendar_posts.paginate(:page => params[:page] || 1, :per_page => session[:calendar_post_per_page] || 5)
	end

	def new
		@calendar_post = CalendarPost.new
		@page_title = "New Calendar Post | Kicks4Love Admin"
	end

	def create
		calendar_post = CalendarPost.new calendar_post_params

		if calendar_post.save
			redirect_to admin_calendar_posts_path, :notice => "New calendar post successfully created"
		else
			redirect_to :back, :alert => "Error creating new calendar post"
		end
	end

	def update
		if @calendar_post.update_attributes(calendar_post_params)
			flash[:notice] = "The calendar post has been successfully updated"
		else
			flash[:alert] = "Error occurs while updating the calendar post, please try again"
		end

		redirect_to admin_calendar_posts_path
	end

	def edit
		@page_title = "Edit Calendar Post | Kicks4Love Admin"
	end

	def destroy
		id = @calendar_post.id
		if @calendar_post.destroy
			Admin::AdminHelper.remove_uploads_file('calendar_post', id)
			flash[:notice] = "The calendar post has been deleted successfully"
		else
			flash[:alert] = "Error occurs while deleting the calendar post, please try again"
		end

		redirect_to admin_calendar_posts_path
	end

	def remove_old
		old_posts = CalendarPost.old
		return_posts = old_posts.to_a
		if old_posts.destroy_all
			return_posts.each {|post| Admin::AdminHelper.remove_uploads_file('calendar_post', post.id)}
			render :json => return_posts.to_json, :layout => false
		else
			head :ok, :status => 500
		end
	end

	private

	def calendar_post_params
		params.require(:calendar_post).permit(:title_en, :title_cn, :content_en, :release_date, :release_type, :usd, :rmb, :cover_image)
	end

	def get_calendar_post
		@calendar_post = CalendarPost.find_by_id(params[:id])
	end
	
end