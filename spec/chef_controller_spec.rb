require 'rails_helper'

RSpec.describe CheffsController, type: :controller do
  describe 'GET #index' do
    it 'assigns all cheffs to @cheffs' do
      cheff1 = Cheff.create(day: 'Monday', time: '12:00 PM', cuisine: 'Italian', meal: 'Lunch', price: 20, booked_num: 5, max_num: 10)
      cheff2 = Cheff.create(day: 'Tuesday', time: '6:00 PM', cuisine: 'Mexican', meal: 'Dinner', price: 25, booked_num: 8, max_num: 12)

      get :index
      expect(assigns(:cheffs)).to match_array([cheff1, cheff2])
    end

    it 'renders the :index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'renders the :new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new cheff and redirects to cheffs_path' do
        valid_params = { day: 'Sunday', time: '6:30 PM', cuisine: 'Thai', meal: 'Dinner', price: 28, booked_num: 7, max_num: 12 }
        post :create, params: { cheff: valid_params }

        expect(Cheff.count).to eq(1)
        expect(flash[:notice]).to eq('Cheff was successfully created.')
        expect(response).to redirect_to(cheffs_path)
      end
    end

    # context 'with invalid parameters' do
    #   it 'renders the :new template' do
    #     invalid_params = { day: 7 } 
    #     post :create, params: { cheff: invalid_params }
    #     expect(response).to render_template(:new)
    #   end
    # end
  end

  describe 'PATCH #update' do
    context 'with valid parameters' do
      it 'updates the cheff and redirects to cheffs_path' do
        cheff = Cheff.create(day: 'Monday', time: '12:00 PM', cuisine: 'Italian', meal: 'Lunch', price: 20, booked_num: 5, max_num: 10)
        updated_params = { day: 'Updated Day', time: 'Updated Time' } # Add more valid parameters as needed

        patch :update, params: { id: cheff.id, cheff: updated_params }

        cheff.reload
        expect(cheff.day).to eq('Updated Day')
        expect(cheff.time).to eq('Updated Time')
        expect(flash[:notice]).to eq('Cheff was successfully updated.')
        expect(response).to redirect_to(cheffs_path)
      end
    end

    # context 'with invalid parameters' do
    #   it 'renders the :edit template' do
    #     cheff = Cheff.create(day: 'Tuesday', time: 0, cuisine: 'Mexican', meal: 'Dinner', price: 25, booked_num: 8, max_num: 12)
    #     invalid_params = { day: 'Invalid Day' } # Add more invalid parameters as needed
    #     patch :update, params: { id: cheff.id, cheff: invalid_params }
    #     expect(response).to render_template(:edit)
    #   end
    # end
  end

  describe 'DELETE #destroy' do
    it 'destroys the cheff and redirects to cheffs_path' do
      cheff = Cheff.create(day: 'Wednesday', time: '7:00 PM', cuisine: 'Japanese', meal: 'Dinner', price: 30, booked_num: 6, max_num: 15)

      delete :destroy, params: { id: cheff.id }

      expect(Cheff.count).to eq(0)
      expect(flash[:notice]).to eq('Cheff was successfully destroyed.')
      expect(response).to redirect_to(cheffs_path)
    end
  end
end
