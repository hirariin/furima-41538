
const price = () => {

  const priceInput = document.getElementById("item-price");
  const addTaxDom = document.getElementById("add-tax-price");
  const profitDom = document.getElementById("profit");
  priceInput.addEventListener("input", () => {
    const inputValue = parseInt(priceInput.value, 10) || 0;

    const fee = Math.floor(inputValue * 0.1);


    const profit = inputValue - fee;

    addTaxDom.innerHTML = `${fee} `;
    profitDom.innerHTML = `${profit} `;
  });


};

window.addEventListener("turbo:load", price);
window.addEventListener("turbo:render", price);