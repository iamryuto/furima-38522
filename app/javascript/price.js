function price (){
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const commissionValue = Math.floor(inputValue / 10);
    const profitValue = inputValue - commissionValue;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = `${commissionValue}`
    const addProfitDom = document.getElementById("profit");
    addProfitDom.innerHTML = `${profitValue}`
  })
};

window.addEventListener('load', price);
