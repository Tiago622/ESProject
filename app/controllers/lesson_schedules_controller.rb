class LessonSchedulesController < ApplicationController
  before_action :set_lesson_schedule, only: [:show, :edit, :update, :destroy]

  # GET /lesson_schedules
  # GET /lesson_schedules.json
  def index
    @lesson_schedules = LessonSchedule.all
  end

  # GET /lesson_schedules/1
  # GET /lesson_schedules/1.json
  def show
  end

  # GET /lesson_schedules/new
  def new
    @lesson_schedule = LessonSchedule.new
  end

  # GET /lesson_schedules/1/edit
  def edit
  end

  # POST /lesson_schedules
  # POST /lesson_schedules.json
  def create
    @lesson_schedule = LessonSchedule.new(lesson_schedule_params)

    respond_to do |format|
      if @lesson_schedule.save
        format.html { redirect_to @lesson_schedule, notice: 'Lesson schedule was successfully created.' }
        format.json { render :show, status: :created, location: @lesson_schedule }
      else
        format.html { render :new }
        format.json { render json: @lesson_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lesson_schedules/1
  # PATCH/PUT /lesson_schedules/1.json
  def update
    respond_to do |format|
      if @lesson_schedule.update(lesson_schedule_params)
        format.html { redirect_to @lesson_schedule, notice: 'Lesson schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson_schedule }
      else
        format.html { render :edit }
        format.json { render json: @lesson_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lesson_schedules/1
  # DELETE /lesson_schedules/1.json
  def destroy
    @lesson_schedule.destroy
    respond_to do |format|
      format.html { redirect_to lesson_schedules_url, notice: 'Lesson schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson_schedule
      @lesson_schedule = LessonSchedule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_schedule_params
      params.require(:lesson_schedule).permit(:lesson_id, :schedule_id)
    end
end
