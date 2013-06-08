class Cards::QuestionsController < ApplicationController
  # GET /cards/questions
  # GET /cards/questions.json
  def index
    @cards_questions = Cards::Question.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @cards_questions }
    end
  end

  # GET /cards/questions/1
  # GET /cards/questions/1.json
  def show
    @cards_question = Cards::Question.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cards_question }
    end
  end

  # GET /cards/questions/new
  # GET /cards/questions/new.json
  def new
    @cards_question = Cards::Question.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cards_question }
    end
  end

  # GET /cards/questions/1/edit
  def edit
    @cards_question = Cards::Question.find(params[:id])
  end

  # POST /cards/questions
  # POST /cards/questions.json
  def create
    @cards_question = Cards::Question.new(params[:cards_question])

    respond_to do |format|
      if @cards_question.save
        format.html { redirect_to @cards_question, notice: 'Question was successfully created.' }
        format.json { render json: @cards_question, status: :created, location: @cards_question }
      else
        format.html { render action: "new" }
        format.json { render json: @cards_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /cards/questions/1
  # PUT /cards/questions/1.json
  def update
    @cards_question = Cards::Question.find(params[:id])

    respond_to do |format|
      if @cards_question.update_attributes(params[:cards_question])
        format.html { redirect_to @cards_question, notice: 'Question was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cards_question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /cards/questions/1
  # DELETE /cards/questions/1.json
  def destroy
    @cards_question = Cards::Question.find(params[:id])
    @cards_question.destroy

    respond_to do |format|
      format.html { redirect_to cards_questions_url }
      format.json { head :no_content }
    end
  end
end
