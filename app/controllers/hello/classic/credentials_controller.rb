require_dependency "hello/application_controller"

#
# IT IS RECOMMENDED THAT YOU DO NOT OVERRIDE THIS FILE IN YOUR APP
#

module Hello
module Classic
  class CredentialsController < ApplicationController
    
    before_actions do
      all { restrict_access_to_sudo_mode }
      # only(:index)   { @credentials = hello_user.credentials }
      # only(:new)     { @credential   = hello_user.credentials.build }
      # only(:create)  { @credential   = hello_user.credentials.build(credential_params) }
      # only(:show, :edit, :update, :destroy)  {
      only(:update, :email, :username, :password)  {
        @credential = hello_user.credentials.classic.find(params[:id])
      }
    end

    # # GET /hello/classic/credentials
    # def index
    # end

    # # GET /hello/classic/credentials/new
    # def new
    # end

    # # POST /hello/classic/credentials
    # def create
    #   if @credential.save
    #     redirect_to @credential, notice: 'Your credential was successfully created.'
    #   else
    #     render :new
    #   end
    # end


    # # GET /hello/classic/credentials/1
    # def show
    # end

    # GET /hello/classic/credentials/1/email
    def email
    end

    # GET /hello/classic/credentials/1/username
    def username
    end

    # GET /hello/classic/credentials/1/password
    def password
    end

    # # GET /hello/classic/credentials/1/edit
    # def edit
    # end

        # PATCH/PUT /hello/classic/credentials/1
        def update
          the_action = credential_params.keys.first
          entity = UpdateClassicCredentialEntity.new(the_action)
          if @credential.update(credential_params)
            flash[:notice] = entity.success_message
            redirect_to hello.user_path
          else
            flash[:alert] = entity.alert_message
            render the_action
          end
        end

    # # DELETE /hello/classic/credentials/1
    # def destroy
    #   if @credential.destroy
    #     redirect_to credentials_url, notice: 'Your credential was successfully destroyed.'
    #   else
    #     render :edit
    # end

    private

      # Only allow a trusted parameter "white list" through.
      def credential_params
        params.require(:credential).permit(:email, :username, :password)
      end
  end

end
end
