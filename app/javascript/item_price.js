const calculatePrice = () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const taxRate = 0.1;
    const salesTax = Math.floor(inputValue * taxRate);
    const profit = Math.floor(inputValue - salesTax);
    const addTaxDom = document.getElementById('add-tax-price');
    addTaxDom.innerHTML = salesTax;
    const profitDom = document.getElementById('profit');
    profitDom.innerHTML = profit;
  })
};
window.addEventListener("turbo:load", calculatePrice);
window.addEventListener("turbo:render", calculatePrice);