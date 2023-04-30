document.addEventListener('DOMContentLoaded', function() {
    const form = document.querySelector('form');
    const inputs = form.querySelectorAll('input, select, textarea');
    
    // Function to check if all form fields are filled
    function checkInputs() {
      let isFilled = true;
      inputs.forEach(function(input) {
        if (input.value.trim() === '') {
          isFilled = false;
          return;
        }
      });
      return isFilled;
    }
    
    // Function to update submit button state
    function updateSubmitButtonState() {
      const submitButton = form.querySelector('button[type="submit"]');
      if (checkInputs()) {
        submitButton.disabled = false;
      } else {
        submitButton.disabled = true;
      }
    }
    
    // Add event listeners to form inputs
    inputs.forEach(function(input) {
      input.addEventListener('input', function() {
        updateSubmitButtonState();
      });
    });
    
    // Initial check of submit button state
    updateSubmitButtonState();
  });
  