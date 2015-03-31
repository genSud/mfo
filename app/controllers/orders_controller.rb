class OrdersController < ApplicationController

  before_action :signed_in_user, only: [:index, :edit, :new, :update]
  before_action :user_is_admin, only:[:index, :new, :edit, :update]

  def index
    @title = "История заявок"
    @orders = Order.all
  end

  def new
    @title = "Новая заявка"
    @order = Order.new

    @order.build_borrower

    @order.borrower.build_founder

    @order.borrower.build_bank_account
    @order.borrower.bank_account.build_bank
    @order.borrower.build_person


    @order.guarantor_individuals << Individual.new(_destroy:true)
    @order.guarantor_legals << Organization.new(_destroy:true)

    @order.documents.build

  end

  def create

    @order = Order.new order_params

    if order_params[:borrower_attributes][:type_o] == "ФЛ"
      @order.borrower.skip_kpp_validation = true
    end


    if @order.save

      if order_params[:documents_attributes].present?
        order_params[:documents_attributes].each do |d|
          if d.last[:_destroy] == 'true'
            if @order.documents[d.first.to_i].present?
              @order.documents[d.first.to_i].remove_file!
              @order.documents[d.first.to_i].destroy
            end
          end
        end
      end

      flash[:success] = "Заявка создана"
      redirect_to orders_path
    else
      @title = "Новая заявка"

      if @order.documents.blank?
        @order.documents.build
      end

      if @order.guarantor_individuals.blank?
        @order.guarantor_individuals.build
      end

      if @order.guarantor_legals.blank?
        @order.guarantor_legals.build
      end

      render action: "new"
    end

  end

  def edit
    @title = "Редактирование заявки"
    @order = Order.find params[:id]

    if @order.documents.blank?
      @order.documents.build
    end

  end

  def update
    @order = Order.find params[:id]

    if @order.update_attributes order_params

      flash[:success] = "Заявка обновлена"
      redirect_to orders_path

    else
      @title = "Редактирование заявки"
      render 'edit'
    end

  end

  private

    def order_params

      organization_attributes = [:id, :type_o, :inn, :kpp, :name, :fullname, :ogrn, :address_legal, :address_actual, :head_position, :reg_date, :_destroy]
      person_attributes = [:id, :fullname, :birthday, :birth_place, :citizenship, :phone, :email, :reg_place, :curr_place, :curr_place, :pass_serial_number, :pass_issued, :pass_issued_code, :pass_issue_date, :old_pass_serial_number, :old_pass_issued, :old_pass_issued_code, :old_pass_issue_date, :_destroy]
      bank_attributes = [:id, :bik, :korr_number, :inn, :name, :city, :address]

      params.require(:order).permit(:summa, :platform, :submission_deadline, :agent, :agent_name, :agent_summa, :number, :number_mfo, :number_data_protocol,:personal_number, :create_date, :status,

                                    borrower_attributes:[
                                        organization_attributes,
                                        founder_attributes:[:name, :pass_data_ogrn, :share],
                                        bank_account_attributes:[
                                            :id,
                                            :account_number,
                                            bank_attributes:bank_attributes
                                        ],
                                        person_attributes:person_attributes
                                    ],

                                    guarantor_legals_attributes:[
                                        organization_attributes,
                                        bank_account_attributes:[
                                            :id,
                                            :account_number,
                                            bank_attributes:bank_attributes
                                        ],
                                        person_attributes: person_attributes
                                    ],

                                    guarantor_individuals_attributes: person_attributes,

                                    documents_attributes:[:id, :order_id, :type_d, :file, :file_cache, :remove_file, :_destroy]
      )
    end

    def service_params
      params.require(:service).permit(:guarantor_type, :active_guarantor_individual)
    end

  def user_is_admin
    unless current_user.is_admin?
      redirect_to signin_url, notice: "Войдите как администратор"
    end
  end

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Для выполнения этого действия нужна авторизация"
    end
  end

end
