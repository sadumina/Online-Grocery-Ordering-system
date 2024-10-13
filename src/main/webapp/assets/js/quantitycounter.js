
/**
   * Quantity Button
   */
  
document.addEventListener('DOMContentLoaded', () => {
  // Select all increment and decrement buttons
  const incrementButtons = document.querySelectorAll('.increment');
  const decrementButtons = document.querySelectorAll('.decrement');

  // Function to update quantity
  function updateQuantity(button, increment) {
    const quantityInput = button.parentElement.querySelector('.quantity');
    let currentValue = parseInt(quantityInput.value, 10);
    if (increment) {
      quantityInput.value = currentValue + 1;
    } else {
      if (currentValue > 1) { // Prevent quantity from going below 1
        quantityInput.value = currentValue - 1;
      }
    }
  }

  // Add event listeners to increment buttons
  incrementButtons.forEach(button => {
    button.addEventListener('click', () => updateQuantity(button, true));
  });

  // Add event listeners to decrement buttons
  decrementButtons.forEach(button => {
    button.addEventListener('click', () => updateQuantity(button, false));
  });
});
