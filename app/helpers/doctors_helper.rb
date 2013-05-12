module DoctorsHelper
  def doctor_index
    ('A'..'Z').map do |letter| # letters must be a string for range to work
      link_to letter, refinery.doctors_doctor_path(id: letter)
    end.join(" ").html_safe
  end
end
