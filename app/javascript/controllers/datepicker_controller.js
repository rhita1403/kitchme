import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"; // You need to import this to use new flatpickr()

export default class extends Controller {
  connect() {
    const startDateInput = document.getElementById('booking_start_date'); // Replace with your start_date input ID
    const endDateInput = document.getElementById('booking_end_date'); // Replace with your end_date input ID
    flatpickr(startDateInput, {
      dateFormat: 'd-m-Y',
      minDate: 'today',
      theme: 'light', // Format of the selected date
      // Add more configuration options as needed
      onClose: function(selectedDates) {
        endDateCalendar.set('minDate', selectedDates[0] || null);
        validateDates(startDateInput, endDateInput);
      }
    });
    const endDateCalendar = flatpickr(endDateInput, {
      dateFormat: 'd-m-Y',
      theme: 'light', // Format of the selected date
      // Add more configuration options as needed
      onClose: function(selectedDates) {
        validateDates(startDateInput, endDateInput);
      }
    });
    function validateDates(startInput, endInput) {
      const startDate = startInput.value ? new Date(startInput.value) : null;
      const endDate = endInput.value ? new Date(endInput.value) : null;
      if (startDate && endDate && endDate < startDate) {
        endInput.value = ""; // Clear end_date if it's before start_date
        endInput.classList.add('is-invalid'); // Optional: Add a visual indicator for invalid input
        // Add additional logic to handle invalid date range if needed
      } else {
        endInput.classList.remove('is-invalid'); // Optional: Remove the visual indicator for invalid input
        // Additional logic if the date range is valid
      }
    }
  }
}
