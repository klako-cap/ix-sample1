using { Currency } from '@sap/cds/common';
namespace ix.cap;

entity Products {
  key ID       : Integer;
      name     : localized String(100) not null;
      price    : Decimal(9,2);
      retail   : Decimal(9,2);
      virtual margin : Decimal(9,2);
      currency : Currency;
      supplier : Association to Suppliers;
}

entity Suppliers {
  key ID       : Integer;
      name     : String(100) @title: '{i18n>supplierName}';
      products : Association to many Products 
                on products.supplier = $self;
}
