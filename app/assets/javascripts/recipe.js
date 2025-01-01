document.addEventListener('DOMContentLoaded', () => {
  const categorySelect = document.querySelector('#category-select');
  const parentRecipeField = document.getElementById('parent-recipe-field');

  categorySelect.addEventListener('change', (e) => {
    if (e.target.value === 'arrange') {
      fetch(`${categorySelect.dataset.url}?category=${e.target.value}`, {
        method: categorySelect.dataset.method,
        headers: { 'X-Requested-With': 'XMLHttpRequest' },
      })
        .then((response) => response.text())
        .then((html) => {
          parentRecipeField.innerHTML = html;
          parentRecipeField.style.display = 'block';
        });
    } else {
      parentRecipeField.style.display = 'none';
    }
  });
});
