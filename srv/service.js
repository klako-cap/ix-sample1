module.exports = (srv)=>{

    // Get the definition of Products
    const { Products } = srv.entities
  
    // Compute margin after READ operations
    srv.after ('READ', Products, (each)=>{
      let num = each.retail - each.price;
      each.margin = num.toFixed(2);  // comply to Decimals(9,2)
    })

    // Issue warning for negative margin upon POST/PUT/PATCH
    srv.before (['CREATE', 'UPDATE'], Products, (req)=>{
      const margin = req.data.retail - req.data.price;
      if (margin < 0) {
        req.warn("Negative margin for product " + req.data.ID)
      };
    })
 }
