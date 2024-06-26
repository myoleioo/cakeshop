const addToCartButtons = document.getElementsByClassName('add_to_cart');

for (let i = 0; i < addToCartButtons.length; i++) {
  const button = addToCartButtons[i];
  button.addEventListener('click', addToCartClicked);
}

function addToCartClicked(event) {
  const button = event.target;
  const productItem = button.closest('.product__item');
  const imageSrc = productItem.querySelector('.product__item__pic').getAttribute('data-setbg');
  const description = productItem.querySelector('.product__item__text a').innerText;
  const price = productItem.querySelector('.product__item__price').innerText;
  
  addItemToCart(imageSrc, description, price);
  updateCartPrice();
}