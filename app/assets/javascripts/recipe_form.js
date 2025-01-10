  document.addEventListener("DOMContentLoaded", function() {
    // チェックボックスをクリックした時の動作
    document.querySelectorAll('.toggle-quantity').forEach(function(checkbox) {
      checkbox.addEventListener('change', function() {
        const quantityInput = this.closest('.form-check').querySelector('.quantity-input');
        if (this.checked) {
          quantityInput.style.display = 'block';
        } else {
          quantityInput.style.display = 'none';
        }
      });
    });
  });
