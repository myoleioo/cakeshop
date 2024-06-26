
document.addEventListener("DOMContentLoaded", function () {
    const form = document.getElementById('productForm');
    const productnameInput = document.getElementById('productname');
    const descriptionInput = document.getElementById('description');
    const priceInput = document.getElementById('price');
    const fileInput = document.getElementById('file');
    const productError = document.getElementById('productError');
    const descriptionError = document.getElementById('descriptionError');
    const priceError = document.getElementById('priceError');
    const fileError = document.getElementById('fileError');

    function validateProductname() {
        if (productnameInput.value.trim() === '') {
            productnameInput.classList.add('invalid');
            productError.textContent = 'Please enter a productname.';
            return false;
        } else {
            productnameInput.classList.remove('invalid');
            productError.textContent = '';
            return true;
        }
    }
    
    function validateDescription() {
        const descriptionValue = descriptionInput.value.trim();
        if (descriptionValue === '') {
            descriptionInput.classList.add('invalid');
            descriptionError.textContent = 'Please enter a description.';
            return false;
        } else if (!/^[A-Z\s]+$/g.test(descriptionValue)) {
            // Check if description contains any lowercase letters
            descriptionInput.classList.add('invalid');
            descriptionError.textContent = 'Description must only contain uppercase letters.';
            return false;
        } else {
            descriptionInput.classList.remove('invalid');
            descriptionError.textContent = '';
            return true;
        }
    }
    
    
    function validatePrice() {
        if (priceInput.value.trim() === '') {
            priceInput.classList.add('invalid');
            priceError.textContent = 'Please enter a price.';
            return false;
        } else {
            priceInput.classList.remove('invalid');
            priceError.textContent = '';
            return true;
        }
    }
    
    
    function validateFile() {
        if (fileInput.value.trim() === '') {
            fileInput.classList.add('invalid');
            fileError.textContent = 'Please enter a photo.';
            return false;
        } else {
            fileInput.classList.remove('invalid');
            fileError.textContent = '';
            return true;
        }
    }

    
    function validateForm() {
        return validateProductname() && validateDescription() && validatePrice() && validateFile();
    }

    productnameInput.addEventListener('blur', validateProductname);
    descriptionInput.addEventListener('blur',validateDescription);
    priceInput.addEventListener('blur', validatePrice);
    fileInput.addEventListener('blur', validateFile);
    /*confirmPasswordInput.addEventListener('blur', () => {
    if(passwordInput.value != confirmPasswordInput){
      confirmPasswordError.textContent = "Password and confirm password do not match!!";
    }
  });*/


    //focus
    productnameInput.addEventListener('focus', function () {
        productnameInput.classList.remove('invalid');
        productError.textContent = '';
        });
        
    descriptionInput.addEventListener('focus', function () {
        descriptionInput.classList.remove('invalid');
        descriptionError.textContent = '';
        });
        
    priceInput.addEventListener('focus', function () {
        priceInput.classList.remove('invalid');
        priceError.textContent = '';
        });
        
    fileInput.addEventListener('focus', function () {
        fileInput.classList.remove('invalid');
        fileError.textContent = '';
        });
    

    form.addEventListener('submit', function (event) {
            event.preventDefault(); // Prevent the form from submitting
        if (validateForm()) {
            // If validation passes, you can submit the form
            // You might want to do additional checks here before submitting
            form.submit();
        }
        
        /*if (validateForm()) {
       event.preventDefault(); // Prevent the form from submitting
            form.submit();*/
    });
});