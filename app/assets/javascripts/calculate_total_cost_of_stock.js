function calculateTotalCostOfStock() {
  var stockQuantity = document.getElementById('stock_quantity').value;
  var stockUnitCost = document.getElementById('stock_unit_cost').value;

  var stockTotalCost = document.getElementById('stock_total_cost');
  var myResult = stockQuantity * stockUnitCost;
  stockTotalCost.value = myResult;
}
