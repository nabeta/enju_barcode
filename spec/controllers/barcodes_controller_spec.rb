require 'spec_helper'

describe BarcodesController do
  fixtures :all

  describe "GET index" do
    before(:each) do
      FactoryGirl.create(:barcode)
    end

    describe "When logged in as Administrator" do
      before(:each) do
        sign_in FactoryGirl.create(:admin)
      end

      it "assigns all barcodes as @barcodes" do
        get :index
        assigns(:barcodes).should eq(Barcode.all)
      end
    end

    describe "When logged in as Librarian" do
      before(:each) do
        sign_in FactoryGirl.create(:librarian)
      end

      it "assigns all barcodes as @barcodes" do
        get :index
        assigns(:barcodes).should eq(Barcode.all)
      end
    end

    describe "When logged in as User" do
      before(:each) do
        sign_in FactoryGirl.create(:user)
      end

      it "should be forbidden" do
        get :index
        assigns(:barcodes).should be_empty
        response.should be_forbidden
      end
    end

    describe "When not logged in" do
      it "assigns all barcodes as @barcodes" do
        get :index
        assigns(:barcodes).should be_empty
        response.should redirect_to(new_user_session_url)
      end
    end
  end

  describe "GET show" do
    describe "When logged in as Administrator" do
      before(:each) do
        sign_in FactoryGirl.create(:admin)
      end

      it "assigns the requested barcode as @barcode" do
        barcode = FactoryGirl.create(:barcode)
        get :show, :id => barcode.id
        assigns(:barcode).should eq(barcode)
      end
    end

    describe "When logged in as Librarian" do
      before(:each) do
        sign_in FactoryGirl.create(:librarian)
      end

      it "assigns the requested barcode as @barcode" do
        barcode = FactoryGirl.create(:barcode)
        get :show, :id => barcode.id
        assigns(:barcode).should eq(barcode)
      end
    end

    describe "When logged in as User" do
      before(:each) do
        sign_in FactoryGirl.create(:user)
      end

      it "assigns the requested barcode as @barcode" do
        barcode = FactoryGirl.create(:barcode)
        get :show, :id => barcode.id
        assigns(:barcode).should eq(barcode)
      end
    end

    describe "When not logged in" do
      it "assigns the requested barcode as @barcode" do
        barcode = FactoryGirl.create(:barcode)
        get :show, :id => barcode.id
        assigns(:barcode).should eq(barcode)
      end
    end
  end

  describe "GET new" do
    describe "When logged in as Administrator" do
      before(:each) do
        sign_in FactoryGirl.create(:admin)
      end

      it "assigns the requested barcode as @barcode" do
        get :new
        assigns(:barcode).should_not be_valid
        response.should be_success
      end
    end

    describe "When logged in as Librarian" do
      before(:each) do
        sign_in FactoryGirl.create(:librarian)
      end

      it "assigns the requested barcode as @barcode" do
        get :new
        assigns(:barcode).should_not be_valid
        response.should be_success
      end
    end

    describe "When logged in as User" do
      before(:each) do
        sign_in FactoryGirl.create(:user)
      end

      it "should not assign the requested barcode as @barcode" do
        get :new
        assigns(:barcode).should_not be_valid
        response.should be_forbidden
      end
    end

    describe "When not logged in" do
      it "should not assign the requested barcode as @barcode" do
        get :new
        assigns(:barcode).should_not be_valid
        response.should redirect_to(new_user_session_url)
      end
    end
  end

  describe "GET edit" do
    describe "When logged in as Administrator" do
      before(:each) do
        sign_in FactoryGirl.create(:admin)
      end

      it "assigns the requested barcode as @barcode" do
        barcode = FactoryGirl.create(:barcode)
        get :edit, :id => barcode.id
        assigns(:barcode).should eq(barcode)
      end
    end

    describe "When logged in as Librarian" do
      before(:each) do
        sign_in FactoryGirl.create(:librarian)
      end

      it "assigns the requested barcode as @barcode" do
        barcode = FactoryGirl.create(:barcode)
        get :edit, :id => barcode.id
        assigns(:barcode).should eq(barcode)
      end
    end

    describe "When logged in as User" do
      before(:each) do
        sign_in FactoryGirl.create(:user)
      end

      it "assigns the requested barcode as @barcode" do
        barcode = FactoryGirl.create(:barcode)
        get :edit, :id => barcode.id
        response.should be_forbidden
      end
    end

    describe "When not logged in" do
      it "should not assign the requested barcode as @barcode" do
        barcode = FactoryGirl.create(:barcode)
        get :edit, :id => barcode.id
        response.should redirect_to(new_user_session_url)
      end
    end
  end

  describe "POST create" do
    before(:each) do
      @attrs = FactoryGirl.attributes_for(:barcode)
      @invalid_attrs = {:code_word => ''}
    end

    describe "When logged in as Administrator" do
      before(:each) do
        sign_in FactoryGirl.create(:admin)
      end

      describe "with valid params" do
        it "assigns a newly created barcode as @barcode" do
          post :create, :barcode => @attrs
          assigns(:barcode).should be_valid
        end

        it "redirects to the created patron" do
          post :create, :barcode => @attrs
          response.should redirect_to(assigns(:barcode))
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved barcode as @barcode" do
          post :create, :barcode => @invalid_attrs
          assigns(:barcode).should_not be_valid
        end

        it "re-renders the 'new' template" do
          post :create, :barcode => @invalid_attrs
          response.should render_template("new")
        end
      end
    end

    describe "When logged in as Librarian" do
      before(:each) do
        sign_in FactoryGirl.create(:librarian)
      end

      describe "with valid params" do
        it "assigns a newly created barcode as @barcode" do
          post :create, :barcode => @attrs
          assigns(:barcode).should be_valid
        end

        it "redirects to the created patron" do
          post :create, :barcode => @attrs
          response.should redirect_to(assigns(:barcode))
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved barcode as @barcode" do
          post :create, :barcode => @invalid_attrs
          assigns(:barcode).should_not be_valid
        end

        it "re-renders the 'new' template" do
          post :create, :barcode => @invalid_attrs
          response.should render_template("new")
        end
      end
    end

    describe "When logged in as User" do
      before(:each) do
        sign_in FactoryGirl.create(:user)
      end

      describe "with valid params" do
        it "assigns a newly created barcode as @barcode" do
          post :create, :barcode => @attrs
          assigns(:barcode).should be_valid
        end

        it "should be forbidden" do
          post :create, :barcode => @attrs
          response.should be_forbidden
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved barcode as @barcode" do
          post :create, :barcode => @invalid_attrs
          assigns(:barcode).should_not be_valid
        end

        it "should be forbidden" do
          post :create, :barcode => @invalid_attrs
          response.should be_forbidden
        end
      end
    end

    describe "When not logged in" do
      describe "with valid params" do
        it "assigns a newly created barcode as @barcode" do
          post :create, :barcode => @attrs
          assigns(:barcode).should be_valid
        end

        it "should be forbidden" do
          post :create, :barcode => @attrs
          response.should redirect_to(new_user_session_url)
        end
      end

      describe "with invalid params" do
        it "assigns a newly created but unsaved barcode as @barcode" do
          post :create, :barcode => @invalid_attrs
          assigns(:barcode).should_not be_valid
        end

        it "should be forbidden" do
          post :create, :barcode => @invalid_attrs
          response.should redirect_to(new_user_session_url)
        end
      end
    end
  end

  describe "PUT update" do
    before(:each) do
      @barcode = FactoryGirl.create(:barcode)
      @attrs = FactoryGirl.attributes_for(:barcode)
      @invalid_attrs = {:code_word => ''}
    end

    describe "When logged in as Administrator" do
      before(:each) do
        sign_in FactoryGirl.create(:admin)
      end

      describe "with valid params" do
        it "updates the requested barcode" do
          put :update, :id => @barcode.id, :barcode => @attrs
        end

        it "assigns the requested barcode as @barcode" do
          put :update, :id => @barcode.id, :barcode => @attrs
          assigns(:barcode).should eq(@barcode)
          response.should redirect_to(@barcode)
        end
      end

      describe "with invalid params" do
        it "assigns the requested barcode as @barcode" do
          put :update, :id => @barcode.id, :barcode => @invalid_attrs
          response.should render_template("edit")
        end
      end
    end

    describe "When logged in as Librarian" do
      before(:each) do
        sign_in FactoryGirl.create(:librarian)
      end

      describe "with valid params" do
        it "updates the requested barcode" do
          put :update, :id => @barcode.id, :barcode => @attrs
        end

        it "assigns the requested barcode as @barcode" do
          put :update, :id => @barcode.id, :barcode => @attrs
          assigns(:barcode).should eq(@barcode)
          response.should redirect_to(@barcode)
        end
      end

      describe "with invalid params" do
        it "assigns the requested barcode as @barcode" do
          put :update, :id => @barcode.id, :barcode => @invalid_attrs
          response.should render_template("edit")
        end
      end
    end

    describe "When logged in as User" do
      before(:each) do
        sign_in FactoryGirl.create(:user)
      end

      describe "with valid params" do
        it "updates the requested barcode" do
          put :update, :id => @barcode.id, :barcode => @attrs
        end

        it "assigns the requested barcode as @barcode" do
          put :update, :id => @barcode.id, :barcode => @attrs
          assigns(:barcode).should eq(@barcode)
          response.should be_forbidden
        end
      end

      describe "with invalid params" do
        it "assigns the requested barcode as @barcode" do
          put :update, :id => @barcode.id, :barcode => @invalid_attrs
          response.should be_forbidden
        end
      end
    end

    describe "When not logged in" do
      describe "with valid params" do
        it "updates the requested barcode" do
          put :update, :id => @barcode.id, :barcode => @attrs
        end

        it "should be forbidden" do
          put :update, :id => @barcode.id, :barcode => @attrs
          response.should redirect_to(new_user_session_url)
        end
      end

      describe "with invalid params" do
        it "assigns the requested barcode as @barcode" do
          put :update, :id => @barcode.id, :barcode => @invalid_attrs
          response.should redirect_to(new_user_session_url)
        end
      end
    end
  end

  describe "DELETE destroy" do
    before(:each) do
      @barcode = FactoryGirl.create(:barcode)
    end

    describe "When logged in as Administrator" do
      before(:each) do
        sign_in FactoryGirl.create(:admin)
      end

      it "destroys the requested barcode" do
        delete :destroy, :id => @barcode.id
      end

      it "redirects to the barcodes list" do
        delete :destroy, :id => @barcode.id
        response.should redirect_to(barcodes_url)
      end
    end

    describe "When logged in as Librarian" do
      before(:each) do
        sign_in FactoryGirl.create(:librarian)
      end

      it "destroys the requested barcode" do
        delete :destroy, :id => @barcode.id
      end

      it "redirects to the barcodes list" do
        delete :destroy, :id => @barcode.id
        response.should redirect_to(barcodes_url)
      end
    end

    describe "When logged in as User" do
      before(:each) do
        sign_in FactoryGirl.create(:user)
      end

      it "destroys the requested barcode" do
        delete :destroy, :id => @barcode.id
      end

      it "should be forbidden" do
        delete :destroy, :id => @barcode.id
        response.should be_forbidden
      end
    end

    describe "When not logged in" do
      it "destroys the requested barcode" do
        delete :destroy, :id => @barcode.id
      end

      it "should be forbidden" do
        delete :destroy, :id => @barcode.id
        response.should redirect_to(new_user_session_url)
      end
    end
  end
end
