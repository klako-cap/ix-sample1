module.exports = (srv)=>{

    // Extract the 'Products' service entity
    const { Products } = srv.entities;
    let a =1;
  
    /* Compute margin after reading from the
       database through GET requests         */
    srv.after ('READ', Products, (each)=>{
      let num = each.retail - each.price;
      each.margin = num.toFixed(2);  // comply to Decimals(9,2)
    })

    /* Issue warning for negative margin before 
       processing a POST/PUT/PATCH request   */
    srv.before (['CREATE', 'UPDATE'], Products, (req)=>{
      let margin = req.data.retail - req.data.price;
      if (margin < 0) {
        req.warn("Negative margin for product " + req.data.ID);
      }
    })
 }