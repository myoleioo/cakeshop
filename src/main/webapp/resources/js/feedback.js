document.addEventListener("DOMContentLoaded", function() {
	const form = document.getElementById('feedbackform');
	const feedbackInput = document.getElementById('feedbackinput');
	const feedbackError = document.getElementById('feedbackerror');
	const ratingInputs = document.querySelectorAll('input[name="rating"]');
	const ratingError = document.getElementById('ratingerror');

	function validateFeedback() {
		if (feedbackInput.value.trim() === '') {
			feedbackInput.classList.add('invalid');
			feedbackError.textContent = 'Please enter your feedback.';
			return false;
		} else {
			feedbackInput.classList.remove('invalid');
			feedbackError.textContent = '';
			return true;
		}
	}

	function validateRating() {
		const ratingChecked = Array.from(ratingInputs).some(input => input.checked);
		if (!ratingChecked) {
			ratingError.textContent = 'Please select a rating.';
			return false;
		} else {
			ratingError.textContent = '';
			return true;
		}
	}

	function validatefeedbackForm() {
		const isFeedbackValid = validateFeedback();
		const isRatingValid = validateRating();
		return isFeedbackValid && isRatingValid;
	}

	// Blur event listeners
	feedbackInput.addEventListener('blur', validateFeedback);

	// Focus event listeners to clear error messages
	feedbackInput.addEventListener('focus', function() {
		feedbackInput.classList.remove('invalid');
		feedbackError.textContent = '';
	});


	ratingInputs.forEach(input => {
        input.addEventListener('blur', function() {
            validateRating();
        });
    });

	// Rating change event listener to clear error messages
	ratingInputs.forEach(input => {
		input.addEventListener('change', function() {
			validateRating();
		});
	});

	form.addEventListener('submit', function(event) {
		event.preventDefault(); // Prevent the form from submitting
		if (validatefeedbackForm()) {
			// If validation passes, you can submit the form
			// You might want to do additional checks here before submitting
			form.submit();
		}
	});
});
