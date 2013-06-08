require 'test_helper'

class Cards::QuestionsControllerTest < ActionController::TestCase
  setup do
    @cards_question = cards_questions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cards_questions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cards_question" do
    assert_difference('Cards::Question.count') do
      post :create, cards_question: {  }
    end

    assert_redirected_to cards_question_path(assigns(:cards_question))
  end

  test "should show cards_question" do
    get :show, id: @cards_question
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cards_question
    assert_response :success
  end

  test "should update cards_question" do
    put :update, id: @cards_question, cards_question: {  }
    assert_redirected_to cards_question_path(assigns(:cards_question))
  end

  test "should destroy cards_question" do
    assert_difference('Cards::Question.count', -1) do
      delete :destroy, id: @cards_question
    end

    assert_redirected_to cards_questions_path
  end
end
