class AttendancesController < ApplicationController

  expose :school_class
  expose :enrollments, -> { school_class.enrollments }

  def index
    #authorize Attendance
  end

  def show

  end

  def create

  end


  private

  def set_attendance
    @attendance = Attendance.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def attendance_params
    params.fetch(:attendance, {}).permit(:enrollment_id, :course_id, :status, :obs, :status, :attendance_date)
  end

end
