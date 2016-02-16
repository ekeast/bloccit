require 'rails_helper'
require 'random_data'

RSpec.describe QuestionsController, type: :controller do

  let(:my_question) { Question.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: false) }

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_question] to @questions" do
      get :index
# #9
      expect(assigns(:questions)).to eq([my_question])
    end
  end

  describe "GET show" do
    it "returns http success" do
# #16
      get :show, {id: my_question.id}
      expect(response).to have_http_status(:success)
    end

    it "renders the #show view" do
# #17
      get :show, {id: my_question.id}
      expect(response).to render_template :show
    end

    it "assigns my_post to @post" do
      get :show, {id: my_question.id}
# #18
      expect(assigns(:question)).to eq(my_question)
    end

  end

  describe "GET new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

# #2
    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

# #3
    it "instantiates @question" do
      get :new
      expect(assigns(:question)).not_to be_nil
    end
  end

  describe "QUESTION create" do
# #4
    it "increases the number of Questions by 1" do
      expect{question :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: false}}.to change(Question,:count).by(1)
    end

# #5
    it "assigns the new question to @question" do
      question :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: false}
      expect(assigns(:question)).to eq Question.last
    end

# #6
    it "redirects to the new question" do
      post :create, question: {title: RandomData.random_sentence, body: RandomData.random_paragraph, resolved: false}
      expect(response).to redirect_to Question.last
    end
  end

  describe "PUT update" do
    it "updates question with expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph

      put :update, id: my_question.id, question: {title: new_title, body: new_body, resolved: false}
      updated_question = assigns(:question)
      expect(updated_question.id).to eq my_question.id
      expect(updated_question.title).to eq new_title
      expect(updated_question.body).to eq new_body
      expect(updated_question.resolved).to eq false
    end

    it "redirects to the updated question" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph

      put :update, id: my_question.id, question: {title: new_title, body: new_body, resolved: false}
      expect(response).to redirect_to my_post
    end
  end
  describe "DELETE destroy" do
    it "deletes the question" do
      delete :destroy, {id: my_question.id}
      count = Question.where({id: my_question.id}).size
      expect(count).to eq 0
    end

    it "redirects to posts index" do
      delete :destroy, {id: my_question.id}

      expect(reponse).to redirect_to questions_path
    end
  end
end
