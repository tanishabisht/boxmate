require 'rails_helper'

RSpec.describe CustomersController, type: :controller do
  describe "GET #index" do
    it "returns a success response" do
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid parameters" do
      it "creates a new Customer" do
        valid_params = { day: 'Sunday', time: '6:30 PM', cuisine: 'Thai', meal: 'Dinner', price: 28, cheff_id: '2' }
        post :create, params: { customer: valid_params }
        expect(Customer.count).to eq(1)
      end

      it "redirects to the created customer" do
        valid_params = { day: 'Sunday', time: '6:30 PM', cuisine: 'Thai', meal: 'Dinner', price: 28, cheff_id: '2' }
        post :create, params: { customer: valid_params }
        expect(response).to redirect_to(customers_path)
      end
    end

    # context "with invalid parameters" do
    #   it "does not create a new Customer" do
    #     expect {
    #       post :create, params: { customer: invalid_attributes }
    #     }.to_not change(Customer, :count)
    #   end
    #   it "renders the new template" do
    #     post :create, params: { customer: invalid_attributes }
    #     expect(response).to render_template(:new)
    #   end
    # end
  end

  describe "PATCH #update" do
    context "with valid parameters" do
      it "updates the requested customer" do
        valid_params = { day: 'Sunday', time: '6:30 PM', cuisine: 'Thai', meal: 'Dinner', price: 28, cheff_id: '2' }
        customer = Customer.create(valid_params)
        new_day = "New Day"
        patch :update, params: { id: customer.to_param, customer: { day: new_day } }
        customer.reload
        expect(customer.day).to eq(new_day)
      end

      it "redirects to the customer" do
        valid_params = { day: 'Sunday', time: '6:30 PM', cuisine: 'Thai', meal: 'Dinner', price: 28, cheff_id: '2' }
        customer = Customer.create(valid_params)
        patch :update, params: { id: customer.to_param, customer: valid_params }
        expect(response).to redirect_to(customer_url(customer))
      end
    end

    # context "with invalid parameters" do
    #   it "renders the edit template" do
    #     valid_params = { day: 'Sunday', time: '6:30 PM', cuisine: 'Thai', meal: 'Dinner', price: 28, cheff_id: '2' }
    #     customer = Customer.create(valid_params)
    #     patch :update, params: { id: customer.to_param, customer: invalid_attributes }
    #     expect(response).to render_template(:edit)
    #   end
    # end
  end

  describe "DELETE #destroy" do
    it "destroys the requested customer" do
      customer = Customer.create(valid_attributes)
      expect {
        delete :destroy, params: { id: customer.to_param }
      }.to change(Customer, :count).by(-1)
    end

    it "redirects to the customers list" do
      customer = Customer.create(valid_attributes)
      delete :destroy, params: { id: customer.to_param }
      expect(response).to redirect_to(customers_url)
    end
  end

  private

  def valid_attributes
    # Define valid attributes for a customer here
  end

  def invalid_attributes
    # Define invalid attributes for a customer here
  end
end
