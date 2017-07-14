class AttendancesController < ApplicationController

  expose :teaching
  expose :school_class, -> {teaching.school_class}
  expose :enrollments, -> { school_class.enrollments }

  expose :attendance, -> { fetch_attendance }

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

  # TODO: this should be lazy loaded with each tab (month)
  def fetch_attendance
    Attendance.where(:course_id => teaching.course.id, :enrollment_id => enrollments).order(:attendance_date).group_by(&:attendance_date)
  end

end
