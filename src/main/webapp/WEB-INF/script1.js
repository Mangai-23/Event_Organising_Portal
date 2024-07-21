const tBody = document.getElementById("table-body");

/*addNewRow =()=> {
    const row = document.createElement("tr");
    row.className = "single-row";
    row.innerHTML = `<td><input type="text" placeholder="Product name" class="product" id="product"></td>
                    
                    <td><input type="number" placeholder="0" name="amount" class="amount" id="amount"  onkeyup="getInput()"></td>
                    <td style="text-align: right;"><span class="material-icons" action="delete">delete_outline</span></td>`

    tBody.insertBefore(row, tBody.lastElementChild.previousSibling);
}

document.getElementById("add-row").addEventListener("click", (e)=> {
    e.preventDefault();
    addNewRow();
});
//GET INPUTS, MULTIPLY AND GET THE ITEM PRICE
/*getInput =()=> {
    var rows = document.querySelectorAll("tr.single-row");
    rows.forEach((currentRow) => {
       // var unit =1;
        //var price = currentRow.querySelector("#price").value;

        amount = currentRow.querySelector("#amount").value;
        currentRow.querySelector("#amount").value = amount;
        overallSum();

    })
};
const selectedVenueName = localStorage.getItem("selectedVenueName");
const selectedVenueCost = localStorage.getItem("selectedVenueCost");
const selectedDecoration = localStorage.getItem("selectedDecoration");
const selectedDecorationPrice = localStorage.getItem("selectedDecorationPrice");

const venueDetails = document.getElementById("venueDetails");
venueDetails.className = "single-row";
venueDetails.innerHTML = `<td><p>Venue Name: ${selectedVenueName}</p></td>
    <td><p>Venue Cost: Rs.${selectedVenueCost}</p></td>
`;

// Display decoration details
const decorationDetails = document.getElementById("decorationDetails");
decorationDetails.className = "single-row";
decorationDetails.innerHTML = `
    <p>Decoration Name: ${selectedDecoration}</p>
    <p>Decoration Cost: ${selectedDecorationPrice}</p>
`;*/
const selectedVenueName = localStorage.getItem("selectedVenueName");
const selectedVenueCost = localStorage.getItem("selectedVenueCost");
const selectedDecoration = localStorage.getItem("selectedDecoration");
const selectedDecorationPrice = localStorage.getItem("selectedDecorationPrice");

// Populate venue details
document.getElementById("venueDetails").textContent = `Venue Cost: Rs.${selectedVenueCost}`;

// Populate decoration details
document.getElementById("decorationDetails").textContent = `Decoration Cost: ${selectedDecorationPrice}`;

// Now you have separate rows for venue and decoration with their respective details.

//Get the overall sum/Total
overallSum =()=> {
    var arr = document.getElementsByName("amount");
    var total = 0;
    for(var i = 0; i < arr.length; i++) {
        if(arr[i].value) {
            total += +arr[i].value;
        }
        document.getElementById("total").value = total;
    }
}

//Delete row from the table
tBody.addEventListener("click", (e)=>{
    let el = e.target;
    const deleteROW = e.target.getAttribute("action");
    if(deleteROW == "delete") {
        delRow(el);
        overallSum();
    }
})

//Target row and remove from DOM;
delRow =(el)=> {
    el.parentNode.parentNode.parentNode.removeChild(el.parentNode.parentNode);
}